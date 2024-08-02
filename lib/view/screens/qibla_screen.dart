import 'dart:async';
import 'dart:math' as Math;
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:iconsax/iconsax.dart';
import 'package:sensors_plus/sensors_plus.dart';
import '../../constants/string.dart';

class Qibla_Screen extends StatefulWidget {
  const Qibla_Screen({super.key});

  @override
  State<Qibla_Screen> createState() => _Qibla_ScreenState();
}

class _Qibla_ScreenState extends State<Qibla_Screen>
    with SingleTickerProviderStateMixin {
  MagnetometerEvent _magnetometerEvent =
      MagnetometerEvent(0, 0, 0, DateTime.now());
  StreamSubscription? subscription;
  bool isAligned = false;
  late AnimationController _controller;
  late Animation<double> _animation;
  double _previousAngle = 0.0;
  AccelerometerEvent? _accelerometerEvent;
  StreamSubscription? accelerometerSubscription;
  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 300),
      vsync: this,
    );

    _animation =
        Tween(begin: 0.0, end: 0.0).animate(_controller); // تهيئة _animation

    subscription = magnetometerEvents.listen(
      (event) {
        setState(() {
          _magnetometerEvent = event;
          isAligned = checkAlignment(event);
          double newAngle =
              calculatePhoneDirection() - calculateQiblaDirection();
          _animation =
              Tween(begin: _previousAngle, end: newAngle).animate(_controller);
          _previousAngle = newAngle;
          _controller.forward(from: 0.0);
        });
      },
    );

    accelerometerSubscription = accelerometerEvents.listen(
      (event) {
        setState(() {
          _accelerometerEvent = event;
        });
      },
    );
  }

  bool checkAlignment(MagnetometerEvent event) {
    double qiblaDirection = calculateQiblaDirection();
    double phoneDirection = Math.atan2(event.y, event.x) * (180.0 / Math.pi);
    phoneDirection =
        (phoneDirection + 360.0) % 360.0; // ضبط النطاق إلى 0-360 درجة

    double tolerance = 5.0; // التفاوت المسموح به بالدرجات
    return (phoneDirection - qiblaDirection).abs() <= tolerance;
  }

  @override
  void dispose() {
    subscription?.cancel();
    _controller.dispose();
    super.dispose();
  }

  double calculateQiblaDirection() {
    double kaabaLatitude = 21.4225;
    double kaabaLongitude = 39.8262;

    double currentLatitude = 0.0;
    double currentLongitude = 0.0;

    double lat1 = currentLatitude * (3.141592653589793 / 180.0);
    double lon1 = currentLongitude * (3.141592653589793 / 180.0);
    double lat2 = kaabaLatitude * (3.141592653589793 / 180.0);
    double lon2 = kaabaLongitude * (3.141592653589793 / 180.0);

    double dLon = lon2 - lon1;

    double x = Math.cos(lat2) * Math.sin(dLon);
    double y = Math.cos(lat1) * Math.sin(lat2) -
        Math.sin(lat1) * Math.cos(lat2) * Math.cos(dLon);

    double bearing = Math.atan2(x, y);
    bearing = bearing * (180.0 / 3.141592653589793);
    bearing = (bearing + 360.0) % 360.0;

    // عكس اتجاه القبلة
    return (bearing + 180.0) % 360.0;
  }

  double calculatePhoneDirection() {
    double phoneDirection =
        Math.atan2(_magnetometerEvent.y, _magnetometerEvent.x) *
            (180.0 / Math.pi);
    return (phoneDirection + 360.0) % 360.0;
  }

  bool _isPhoneHorizontal() {
    if (_accelerometerEvent == null) return false;

    // القيم للاتجاهات المختلفة
    double x = _accelerometerEvent!.x;
    double y = _accelerometerEvent!.y;
    double z = _accelerometerEvent!.z;

    // تحقق إذا كان الهاتف في وضع أفقي
    return (z.abs() < 8.0 && x.abs() < 8.0 && y.abs() > 8.0);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 70,
        automaticallyImplyLeading: false,
        actions: const [
          Padding(
            padding: EdgeInsets.only(right: 8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  "اتجاة القبلة",
                  style: TextStyle(
                    color: PrimaryColor,
                    fontFamily: "noto",
                    fontSize: 23,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                Row(
                  children: [
                    Center(
                      child: Text(
                        "الموقع",
                        style: TextStyle(
                          color: PrimaryColor,
                          fontFamily: "noto",
                          fontSize: 17,
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 7,
                    ),
                    Icon(
                      Iconsax.location,
                      color: PrimaryColor,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
        backgroundColor: SecondaryColor,
      ),
      body: _isPhoneHorizontal()
          ? Center(
              child: Text(
                "ضع الهاتف فى وضع افقى",
                style: TextStyle(
                  color: Colors.red,
                  fontFamily: "noto",
                  fontSize: 23,
                  fontWeight: FontWeight.w600,
                ),
              ),
            )
          : SizedBox(
              width: MediaQuery.of(context).size.width,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    isAligned
                        ? "الهاتف نحو القبلة"
                        : 'قم بتدوير الهاتف نحو القبلة ',
                    style: TextStyle(
                      color: isAligned ? SecondaryColor : Colors.blueGrey,
                      fontFamily: "noto",
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  AnimatedBuilder(
                    animation: _animation,
                    builder: (context, child) {
                      return Transform.rotate(
                        angle: -_animation.value * (Math.pi / 180.0),
                        child: child,
                      );
                    },
                    child: SvgPicture.asset(
                      "assets/image/qiblaCompass.svg",
                      color: isAligned ? SecondaryColor : Colors.blueGrey,
                    ),
                  ),
                ],
              ),
            ),
    );
  }
}

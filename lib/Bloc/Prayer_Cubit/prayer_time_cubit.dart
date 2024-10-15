import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:quran_app/models/Prayertime.dart';
import 'package:quran_app/view%20models/prayerTime.dart';

part 'prayer_time_state.dart';

class PrayerTimeCubit extends Cubit<PrayerTimeState> {
  PrayerTimeCubit() : super(PrayerTimeInitial());

  fetchdata() async {
    emit(PrayerTimeLoading());
    try {
      PrayertimeModel prayertimeModel = await PrayertimeViewModel().fetchdata();
      emit(PrayerTimeSucsses(prayertimeModel: prayertimeModel));
    } on Exception catch (e) {
      emit(PrayerTimefailear(Erorr: e.toString()));
    }
  }
}

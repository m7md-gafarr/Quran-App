part of 'prayer_time_cubit.dart';

@immutable
sealed class PrayerTimeState {}

final class PrayerTimeInitial extends PrayerTimeState {}

final class PrayerTimeLoading extends PrayerTimeState {}

final class PrayerTimeSucsses extends PrayerTimeState {
  PrayertimeModel prayertimeModel;
  PrayerTimeSucsses({required this.prayertimeModel});
}

final class PrayerTimefailear extends PrayerTimeState {
  final String Erorr;
  PrayerTimefailear({required this.Erorr});
}

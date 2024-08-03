part of 'tasbeeh_cubit.dart';

@immutable
sealed class TasbeehState {}

final class TasbeehInitial extends TasbeehState {}

final class TasbeehFinsh extends TasbeehState {}

final class TasbeehCountChange extends TasbeehState {}

final class TasbeehRest extends TasbeehState {}

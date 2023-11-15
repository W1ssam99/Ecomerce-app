part of 'functions_cubit.dart';

@immutable
abstract class FunctionsState {}

class FunctionsInitial extends FunctionsState {}


class UpdateThemeSwitchState extends FunctionsState {
  final bool? value;

  UpdateThemeSwitchState({this.value});
}


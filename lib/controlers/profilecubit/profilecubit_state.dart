

part of 'profilecubit_cubit.dart';

@immutable
abstract class UserState {}

class UserInitial extends UserState {}

class UserDataLoaded extends UserState {
  final String? username;

  UserDataLoaded({required this.username});
}

class UserNotAuthenticated extends UserState {}

class UpdateThemeSwitchState extends UserState {
  final bool? value;

  UpdateThemeSwitchState({this.value});
}



class ProfileState extends Equatable {
  const ProfileState();

  @override
  List<Object?> get props => [];
}

class ProfileLoading extends ProfileState {}

class ProfileLoaded extends ProfileState {
  final String username;
  final String email;

  ProfileLoaded(this.username , this.email);

  @override
  List<Object?> get props => [username];
}

class ProfileError extends ProfileState {
  final String errorMessage;

  ProfileError(this.errorMessage);

  @override
  List<Object?> get props => [errorMessage];
}

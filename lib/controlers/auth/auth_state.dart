part of 'auth_cubit.dart';

@immutable
abstract class AuthenticationEvent {}

class SignInEvent extends AuthenticationEvent {
  final String email;
  final String password;

  SignInEvent({required this.email, required this.password});
}

// State
abstract class AuthenticationState {}

class AuthenticatedState extends AuthenticationState {
  final User user;
  AuthenticatedState({required this.user});
}


class UnauthenticatedState extends AuthenticationState {}

class AuthenticationErrorState extends AuthenticationState {
  final String errorMessage;
  AuthenticationErrorState({required this.errorMessage});
}


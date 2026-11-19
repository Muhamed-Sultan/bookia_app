part of 'auth_cubit.dart';

@immutable
sealed class AuthState {}

final class AuthInitial extends AuthState {}

final class LoginLoadingState extends AuthState {}

final class LoginSuccessState extends AuthState {}

final class LoginErrorState extends AuthState {
  final String error;
  LoginErrorState({required this.error});
}

final class RegisterLoadingState extends AuthState {}

final class RegisterSuccessState extends AuthState {}

final class RegisterErrorState extends AuthState {
  final String error;

  RegisterErrorState({required this.error});
}

final class GoogleAuthLoadingState extends AuthState {}

final class GoogleAuthSuccessState extends AuthState {}

final class GoogleAuthErrorState extends AuthState {
  final String error;

  GoogleAuthErrorState({required this.error});
}

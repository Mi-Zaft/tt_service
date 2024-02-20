part of 'auth_bloc.dart';

class AuthState {}

class AuthStateInitial extends AuthState {}

class AuthStatePhoneWritten extends AuthState {}

class AuthPhoneSuccess extends AuthState {}

class AuthPhoneFail extends AuthState {
  AuthPhoneFail({required this.errorMessage});

  final String errorMessage;
}

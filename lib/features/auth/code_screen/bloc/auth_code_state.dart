part of 'auth_code_bloc.dart';

class AuthCodeState {
  String? errorMessage;
}

class AuthCodeInitialState extends AuthCodeState {}

class AuthCodeWrittenState extends AuthCodeState {}

class AuthCodeRequestSuccessState extends AuthCodeState {}

class AuthCodeRequestFailState extends AuthCodeState {
  AuthCodeRequestFailState({required this.errorMessage});
  final String errorMessage;
}

class AuthCodeResendSuccessState extends AuthCodeState {}

class AuthCodeResendFailState extends AuthCodeState {
  AuthCodeResendFailState({required this.errorMessage});
  final String errorMessage;
}

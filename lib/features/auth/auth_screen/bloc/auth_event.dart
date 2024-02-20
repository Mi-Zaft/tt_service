part of 'auth_bloc.dart';

class AuthEvent {}

class AuthEventSendCode extends AuthEvent {
  AuthEventSendCode({required this.phone, required this.unmaskedPhone});
  final String phone;
  final String unmaskedPhone;
}

class AuthEventEditingPhone extends AuthEvent {
  AuthEventEditingPhone({required this.phone});
  final String phone;
}

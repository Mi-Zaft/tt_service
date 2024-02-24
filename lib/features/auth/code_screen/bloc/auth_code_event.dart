part of 'auth_code_bloc.dart';

class AuthCodeEvent {}

class EditingCode extends AuthCodeEvent {
  EditingCode({required this.code});
  final String code;
}

class LoadingResendCode extends AuthCodeEvent {
  LoadingResendCode({required this.unmaskedPhone});
  final String unmaskedPhone;
}

class LoadingConfirmCodeRequest extends AuthCodeEvent {
  LoadingConfirmCodeRequest({required this.unMaskedPhone, required this.code});
  final String unMaskedPhone;
  final String code;
}

class CodeWritten extends AuthCodeEvent {}

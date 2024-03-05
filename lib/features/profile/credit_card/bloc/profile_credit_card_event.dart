part of 'profile_credit_card_bloc.dart';

class ProfileCreditCardEvent {}

class ProfileCreditCardChangeEvent extends ProfileCreditCardEvent {
  final Fields field;
  final String value;

  ProfileCreditCardChangeEvent({required this.field, required this.value});
}

class ProfileCreditCardSaveRequest extends ProfileCreditCardEvent {}

enum Fields { number, date, cvv }

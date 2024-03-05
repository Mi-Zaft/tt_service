part of 'profile_credit_card_bloc.dart';

class ProfileCreditCardState {}

class ProfileCreditCardInitial extends ProfileCreditCardState {}

class ProfileCreditCardValidated extends ProfileCreditCardState {}

class ProfileCreditCardSaved extends ProfileCreditCardState {}

class ProfileCreditCardSaveFail extends ProfileCreditCardState {
  final String errorMesage;

  ProfileCreditCardSaveFail({required this.errorMesage});
}

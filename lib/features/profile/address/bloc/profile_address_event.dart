part of 'profile_address_bloc.dart';

class ProfileAddressEvent {}

class AddressTextFieldChanged extends ProfileAddressEvent {
  final String value;

  AddressTextFieldChanged({required this.value});
}
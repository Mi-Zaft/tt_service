part of 'profile_address_bloc.dart';

class ProfileAddressEvent {}

class ProfileAddressTextFieldChanged extends ProfileAddressEvent {
  final String value;

  ProfileAddressTextFieldChanged({required this.value});
}

class ProfileAddressSomeFieldChanged extends ProfileAddressEvent {
  final Fields field;
  final dynamic value;

  ProfileAddressSomeFieldChanged({required this.field, required this.value});
}

class ProfileAddressRequestSave extends ProfileAddressEvent {}

enum Fields { address, entrance, floor, apartment, intercom, comment }

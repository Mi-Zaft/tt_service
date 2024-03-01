part of 'profile_address_bloc.dart';

class ProfileAddressState {}

class ProfileAddressInitial extends ProfileAddressState {}

class ProfileAddressListReceived extends ProfileAddressState {
  final List<AddressApi> listOfAddresses;

  ProfileAddressListReceived({required this.listOfAddresses});
}

class ProfileAddressValidated extends ProfileAddressState {}

part of 'profile_address_bloc.dart';

class ProfileAddressState {}

class ProfileAddressInitial extends ProfileAddressState {}

class ProfileAddressListReceived extends ProfileAddressState {
  final List<AddressApi> listOfAddresses;

  ProfileAddressListReceived({required this.listOfAddresses});
}

class ProfileAddressLoading extends ProfileAddressState {}

class ProfileAddressError extends ProfileAddressState {
  final String message;

  ProfileAddressError({required this.message});
}
class ProfileAddressValidated extends ProfileAddressState {}

class ProfileAddressSaved extends ProfileAddressState {}

class ProfileAddressSaveError extends ProfileAddressState {
  final String errorMessage;

  ProfileAddressSaveError({required this.errorMessage});
}
import 'package:flutter_bloc/flutter_bloc.dart';

part 'profile_address_event.dart';
part 'profile_address_state.dart';

class ProfileAddressBloc extends Bloc<ProfileAddressEvent, ProfileAddressState> {
  ProfileAddressBloc() : super(ProfileAddressInitial()) {
    on<AddressTextFieldChanged>((event, emit) {
      print(event.value);
      Map<String, dynamic> dataToSend = {};
    });
  }
}
import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tt_service/models/address.dart';
import 'package:tt_service/services/api_service.dart';

part 'profile_address_event.dart';
part 'profile_address_state.dart';

class ProfileAddressBloc
    extends Bloc<ProfileAddressEvent, ProfileAddressState> {
  Address? finalAddress = Address();
  ProfileAddressBloc() : super(ProfileAddressInitial()) {
    on<ProfileAddressTextFieldChanged>((event, emit) async {
      if (event.value.length < 3) {
        return;
      }
      Response response = await ApiService()
          .fetchData('/api/v1/address/all?address_request=${event.value}');
      List<AddressApi> listOfAddresses = [];
      for (var i = 0; i < response.data.length; i++) {
        listOfAddresses.add(AddressApi.fromJson(response.data[i]));
      }
      emit(ProfileAddressListReceived(listOfAddresses: listOfAddresses));
    });
    on<ProfileAddressEvent>((event, emit) {
      emit(ProfileAddressInitial());
    });
    on<ProfileAddressSomeFieldChanged>((event, emit) {
      print('ProfileAddressTextFieldChanged');
      switch (event.field) {
        case Fields.address:
          finalAddress?.id = event.value;
        case Fields.entrance:
          finalAddress?.entrance = int.parse(event.value);
        case Fields.floor:
          finalAddress?.floor = int.parse(event.value);
        case Fields.apartment:
          finalAddress?.apartment = int.parse(event.value);
        case Fields.intercom:
          finalAddress?.intercom = event.value;
        case Fields.comment:
          finalAddress?.comment = event.value;
      }
      if (finalAddress?.id != null) {
        emit(ProfileAddressValidated());
      }
    });
    on<ProfileAddressRequestSave>((event, emit) {
      print('save address');
    });
  }
}

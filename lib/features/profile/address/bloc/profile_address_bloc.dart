import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tt_service/models/address.dart';
import 'package:tt_service/services/api_service.dart';
import 'dart:convert';

part 'profile_address_event.dart';
part 'profile_address_state.dart';

class ProfileAddressBloc
    extends Bloc<ProfileAddressEvent, ProfileAddressState> {
  Address? finalAddress = Address();
  static String? getAddress;
  static dynamic getApartment;
  ProfileAddressBloc() : super(ProfileAddressInitial()) {
    on<ProfileAddressTextFieldChanged>((event, emit) async {
      if (event.value.length < 3) {
        return;
      }
      Response response = await ApiService()
          .fetchData('/api/v1/address/all?address_request=${event.value}');
      List<AddressApi> listOfAddresses = [];
      print(response.data);
       for (var i = 0; i < response.data.length; i++) {
         listOfAddresses.add(AddressApi.fromJson(response.data[i]));
       }
       emit(ProfileAddressListReceived(listOfAddresses: listOfAddresses));
    });
    on<ProfileAddressEvent>((event, emit) {
      emit(ProfileAddressInitial());
    });
    on<ProfileAddressSomeFieldChanged>((event, emit) {
      print(event.value);
      print(event.field);
      switch (event.field) {
        case Fields.address:
          if (event.value is AddressApi) {
            finalAddress?.id = event.value.addressId;
            getAddress = event.value.address;
            print(event.value.address);
          }
        case Fields.entrance:
          finalAddress?.entrance = (event.value);
          print(finalAddress?.entrance);
        case Fields.floor:
          finalAddress?.floor = (event.value);
          print(finalAddress?.floor);
        case Fields.apartment:
          finalAddress?.apartment = (event.value);
          getApartment = event.value;
          print(finalAddress?.apartment);
        case Fields.intercom:
          finalAddress?.intercom = event.value;
          print(finalAddress?.intercom);
        case Fields.comment:
          finalAddress?.comment = event.value;
          print(finalAddress?.comment);
      }
      if (finalAddress?.id != null) {
        emit(ProfileAddressValidated());
      }
    });
    on<ProfileAddressRequestSave>((event, emit) async {
      Map<String, dynamic> dataToSend = {
        'id': finalAddress?.id,
        'entrance': finalAddress?.entrance,
        'floor': finalAddress?.floor,
        'apartment': finalAddress?.apartment,
        'intercom': finalAddress?.intercom,
        'comment': finalAddress?.comment,
      };
      String jsonDataAddress = jsonEncode(dataToSend);
      print(jsonDataAddress);
      Response response =
          await ApiService().postData('/api/v1/address/add', jsonDataAddress);
      if (response.statusCode == 200) {
        print('Address saved');
        emit(ProfileAddressSaved());
      } else {
        print(dataToSend);
        emit(
          ProfileAddressSaveError(
            errorMessage: response.statusMessage ?? '',
          ),
        );
      }
    });
  }
}

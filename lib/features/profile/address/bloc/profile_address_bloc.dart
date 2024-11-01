import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tt_service/models/address.dart';
import 'package:tt_service/services/api_service.dart';
import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../models/user_data.dart';
part 'profile_address_event.dart';
part 'profile_address_state.dart';

class ProfileAddressBloc extends Bloc<ProfileAddressEvent, ProfileAddressState> {
  Address? finalAddress = Address();
  static String? getAddress;
  static dynamic getApartment;


  ProfileAddressBloc() : super(ProfileAddressInitial()) {
    // Обработчик изменения текста в поле адреса
    on<ProfileAddressTextFieldChanged>((event, emit) async {
      if (event.value.length < 3) {
        emit(ProfileAddressInitial());
        return;
      }
      try {
        emit(ProfileAddressLoading());
        Response response = await ApiService().fetchData(
          '/api/v1/address/all?address_request=${event.value}',
        );
        List<AddressApi> listOfAddresses = [];
        print(response.data);
        for (var i = 0; i < response.data.length; i++) {
          listOfAddresses.add(AddressApi.fromJson(response.data[i]));
        }
        emit(ProfileAddressListReceived(listOfAddresses: listOfAddresses));
      } catch (e) {
        print('Ошибка при получении адресов: $e');
        emit(ProfileAddressError(message: e.toString()));
      }
    });

    // Обработчик изменения полей адреса
    on<ProfileAddressSomeFieldChanged>((event, emit) {
      print(event.value);
      print(event.field);
      switch (event.field) {
        case Fields.address:
          {
            if (event.value is AddressApi) {
              finalAddress?.id = event.value.addressId;
              getAddress = event.value.address;
              finalAddress?.name = event.value.address;
              print(event.value.addressId);
              print(event.value.address);
            }
          }
        case Fields.entrance:
          {
            finalAddress?.entrance = event.value;
            print(finalAddress?.entrance);
            break;
          }
        case Fields.floor:
          {
            finalAddress?.floor = event.value;
            print(finalAddress?.floor);
            break;
          }
        case Fields.apartment:
          {
            finalAddress?.apartment = event.value;
            getApartment = finalAddress?.apartment;
            print(finalAddress?.apartment);
            break;
          }
        case Fields.intercom:
          {
            finalAddress?.intercom = event.value;
            print(finalAddress?.intercom);
            break;
          }
        case Fields.comment:
          {
            finalAddress?.comment = event.value;
            print(finalAddress?.comment);
            break;
          }
      }
      if (finalAddress?.id != null) {
        emit(ProfileAddressValidated());
      } else {
        emit(ProfileAddressInitial());
      }
    });

    // Обработчик сохранения адреса
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
      try {
        Response response = await ApiService().postData(
          '/api/v1/address/add',
          jsonDataAddress,
        );
        if (response.statusCode == 200) {
          print('Address saved');

          UserData userData = UserData(
            id: finalAddress?.id.toString() ?? '',
            name: finalAddress?.name ?? '',
            entrance: finalAddress?.entrance ?? '',
            floor: finalAddress?.floor ?? '',
            apartment: finalAddress?.apartment ?? '',
            comment: finalAddress?.comment ?? '',
            intercom: finalAddress?.intercom ?? '',
          );

          emit(ProfileAddressSaved());
        } else {
          print(dataToSend);
          emit(
            ProfileAddressSaveError(
              errorMessage: response.statusMessage ?? 'Ошибка при сохранении адреса',
            ),
          );
        }
      } catch (e) {
        print('Ошибка при сохранении адреса: $e');
        emit(
          ProfileAddressSaveError(
            errorMessage: e.toString(),
          ),
        );
      }
    });
  }
}


import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tt_service/models/credit_card.dart';
import 'package:tt_service/services/api_service.dart';

part 'profile_credit_card_event.dart';
part 'profile_credit_card_state.dart';

class ProfileCreditCardBloc
    extends Bloc<ProfileCreditCardEvent, ProfileCreditCardState> {
  CreditCard? creditCard = CreditCard();
  ProfileCreditCardBloc() : super(ProfileCreditCardInitial()) {
    on<ProfileCreditCardChangeEvent>((event, emit) {
      switch (event.field) {
        case Fields.number:
          creditCard?.number = event.value;
        case Fields.date:
          creditCard?.date = event.value;
        case Fields.cvv:
          creditCard?.cvv = event.value;
      }

      print(creditCard?.number);

      if (creditCard?.number?.length == 16 &&
          creditCard?.date?.length == 5 &&
          creditCard?.cvv?.length == 3) {
        emit(ProfileCreditCardValidated());
      } else {
        emit(ProfileCreditCardInitial());
      }
    });
    on<ProfileCreditCardSaveRequest>((event, emit) async {
      if (creditCard?.number?.length == 16 &&
          creditCard?.date?.length == 5 &&
          creditCard?.cvv?.length == 3) {
        Map<String, dynamic> dataToSend = {
          'creditCard': creditCard?.number,
          'dateOfExpire': creditCard?.date,
          'cvv': creditCard?.cvv
        };
        Response response =
            await ApiService().postData('/api/v1/payment', dataToSend);
        print(creditCard?.number);
        if (response.statusCode == 200) {
          emit(ProfileCreditCardSaved());
        } else {
          print(response.statusMessage);
          emit(
            ProfileCreditCardSaveFail(
                errorMesage:
                    response.statusMessage ?? 'Ошибка сохранения карты'),
          );
        }
      } else {
        emit(ProfileCreditCardInitial());
      }
    });
  }
}

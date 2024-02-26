import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tt_service/services/api_service.dart';

part 'auth_code_event.dart';
part 'auth_code_state.dart';

class AuthCodeBloc extends Bloc<AuthCodeEvent, AuthCodeState> {
  AuthCodeBloc() : super(AuthCodeInitialState()) {
    on<EditingCode>((event, emit) {
      if (state is AuthCodeRequestFailState) {
        emit(AuthCodeInitialState());
      } else {
        if (event.code.length == 6) {
          emit(AuthCodeWrittenState());
        } else {
          emit(AuthCodeInitialState());
        }
      }
    });
    on<LoadingResendCode>((event, emit) async {
      Map<String, dynamic> dataToSend = {'phone': '+7${event.unmaskedPhone}'};
      Response response = await ApiService().postDataWithoutToken(
          endPoint: '/api/v1/authorization/send-code', data: dataToSend);
      print(response);
      if (response.statusCode == 200) {
        emit(AuthCodeResendSuccessState());
      } else {
        emit(AuthCodeResendFailState(
            errorMessage: response.statusMessage ?? 'Ошибка'));
      }
    });
    on<LoadingConfirmCodeRequest>(
      (event, emit) async {
        Map<String, dynamic> dataToSend = {
          'phone': '+7${event.unMaskedPhone}',
          'code': event.code
        };
        Response response = await ApiService().postDataWithoutToken(
            endPoint: '/api/v1/authorization/verify-code', data: dataToSend);
        print(response);
        if (response.statusCode == 200) {
          if (response.data.containsKey('access_token')) {
            final SharedPreferences prefs =
                await SharedPreferences.getInstance();
            await prefs.setString('access_token', response.data['access_token']);
            emit(AuthCodeRequestSuccessState());
          } else {
            emit(AuthCodeRequestFailState(errorMessage: 'Попробуйте позже'));
          }
        } else {
          emit(AuthCodeRequestFailState(
              errorMessage: response.statusMessage ?? 'Ошибка'));
        }
      },
    );
  }
}

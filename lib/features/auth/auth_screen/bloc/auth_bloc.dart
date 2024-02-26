import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tt_service/services/api_service.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc() : super(AuthStateInitial()) {
    on<AuthEventSendCode>(
      (event, emit) async {
        Map<String, dynamic> dataToSend = {
          'phone': '+7${event.unmaskedPhone}',
        };
        Response response = await ApiService()
            .postData('/api/v1/authorization/send-code', dataToSend);
        print(response);
        if (response.statusCode == 200) {
          emit(AuthPhoneSuccess());
        } else if (response.statusCode != 200) {
          emit(AuthPhoneFail(errorMessage: response.statusMessage ?? 'Ошибка'));
        }
      },
    );
    on<AuthEventEditingPhone>((event, emit) {
      if (event.phone.length == 10) {
        emit(AuthStatePhoneWritten());
      } else {
        emit(AuthStateInitial());
      }
    });
  }
}

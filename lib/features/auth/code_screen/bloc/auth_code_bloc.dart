import 'package:flutter_bloc/flutter_bloc.dart';

part 'auth_code_event.dart';
part 'auth_code_state.dart';

class AuthCodeBloc extends Bloc<AuthCodeEvent, AuthCodeState> {
  AuthCodeBloc() : super(AuthCodeInitialState()) {
    on<AuthCodeEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}

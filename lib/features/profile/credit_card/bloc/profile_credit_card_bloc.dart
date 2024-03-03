import 'package:flutter_bloc/flutter_bloc.dart';

part 'profile_credit_card_event.dart';
part 'profile_credit_card_state.dart';

class ProfileCreditCardBloc
    extends Bloc<ProfileCreditCardEvent, ProfileCreditCardState> {
  ProfileCreditCardBloc() : super(ProfileCreditCardInitial()) {
    on<ProfileCreditCardEvent>((event, emit) {});
  }
}

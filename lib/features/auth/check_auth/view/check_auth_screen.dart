import 'package:flutter/material.dart';
import 'package:tt_service/features/auth/first_screen/view/auth_first_screen.dart';
import 'package:tt_service/features/main/choose_bags_count/view/choose_bags_count_screen.dart';
import 'package:tt_service/features/profile/address/views/profile_address_edit.dart';
import 'package:tt_service/features/profile/credit_card/views/profile_credit_card_edit.dart';
import 'package:tt_service/services/api_service.dart';

class CheckAuthScreen extends StatelessWidget {
  const CheckAuthScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: ApiService().getAuth(), // Проверка авторизации
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            if (snapshot.hasError || snapshot.data == null) {
              return const AuthFirstScreen();
            } else {
              if (snapshot.data?['address']['addressId'] == null) {
                return const ProfileAddressEdit();
              }
              if (snapshot.data?['creditCard'] == null) {
                return const ProfileCreditCardEdit();
              }
              return const ChooseBagsCountScreen();
            }
          }
          return const AuthFirstScreen();
        });
  }
}

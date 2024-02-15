import 'package:flutter/material.dart';
import 'package:tt_service/features/auth/first_screen/view/auth_first_screen.dart';
import 'package:tt_service/features/main/choose_bags_count/view/choose_bags_count_screen.dart';
import 'package:tt_service/services/api_service.dart';

class CheckAuthScreen extends StatelessWidget {
  const CheckAuthScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: ApiService().getToken(), // Получение токена
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            if (snapshot.hasError || snapshot.data == null) {
              return const AuthFirstScreen();
            } else {
              return const ChooseBagsCountScreen();
            }
          }
          return const AuthFirstScreen();
        });
  }
}

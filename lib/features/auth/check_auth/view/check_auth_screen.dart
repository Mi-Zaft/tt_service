import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:tt_service/features/auth/first_screen/view/auth_first_screen.dart';
import 'package:tt_service/features/main/choose_bags_count/view/choose_bags_count_screen.dart';
import 'package:tt_service/features/profile/address/views/profile_address_edit.dart';
import 'package:tt_service/features/profile/credit_card/views/profile_credit_card_edit.dart';
import 'package:tt_service/services/api_service.dart';
import 'package:provider/provider.dart';
import 'package:tt_service/models/user_data_provider.dart';
import 'package:tt_service/models/user_data.dart';
import 'package:tt_service/features/profile/profile_editor/overview.dart';

String? globalPhoneNumber;

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
              if (snapshot.data?['address'] == null) {
                globalPhoneNumber = snapshot.data?['phone'];
                return const ProfileAddressEdit();
              }
              if (snapshot.data?['address'] != null) {
                globalPhoneNumber = snapshot.data?['phone'];
                return FutureBuilder(
                  future: ApiService().fetchData('api/v1/address'),
                  builder: (context, userSnapshot) {
                    if (userSnapshot.connectionState == ConnectionState.waiting) {
                      return const Center(child: CircularProgressIndicator());
                    } else if (userSnapshot.hasError) {
                      return Center(child: Text('Ошибка: ${userSnapshot.error}'));
                    } else if (userSnapshot.hasData) {
                      Response response = userSnapshot.data as Response;

                      if (response.statusCode == 200) {
                        Map<String, dynamic> data = response.data;

                        UserData userData = UserData.fromJson(data);

                        // Откладываем установку userData до следующего кадра
                        SchedulerBinding.instance.addPostFrameCallback((_) {
                          Provider.of<UserDataProvider>(context, listen: false)
                              .setUserData(userData);

                          print(userData);
                          print('Проверка на Null');
                          if (userData == null)
                          print(userData.name);
                        });

                        // Возвращаем ваш экран
                        return const ChooseBagsCountScreen();
                      } else {
                        return Center(child: Text('Ошибка: ${response.statusMessage}'));
                      }
                    } else {
                      return Center(child: Text('Неизвестная ошибка'));
                    }
                  },
                );
              }
              if (snapshot.data?['creditCard'] == null) {
                return const ChooseBagsCountScreen();  // return const ProfileCreditCardEdit();
                // return const ChooseBagsCountScreen();
              }
              return const ChooseBagsCountScreen();
            }
          }
          return const AuthFirstScreen();
        });
  }
}

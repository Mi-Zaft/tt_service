import 'package:flutter/material.dart';
import 'package:tt_service/features/profile/my_profile_screen/widgets/phone_number_field.dart';
import 'package:tt_service/features/profile/my_profile_screen/widgets/address_field.dart';
import 'package:tt_service/features/profile/my_profile_screen/widgets/payment_method_field.dart';
import 'package:tt_service/features/profile/my_profile_screen/widgets/quit_button.dart';
import 'package:provider/provider.dart';
import 'package:tt_service/models/user_data_provider.dart';

class MyProfileScreen extends StatefulWidget {
  const MyProfileScreen({Key? key}) : super(key: key);

  @override
  _MyProfileScreenState createState() => _MyProfileScreenState();
}

class _MyProfileScreenState extends State<MyProfileScreen> {
  @override
  Widget build(BuildContext context) {
    // Получаем доступ к UserDataProvider
    final userDataProvider = Provider.of<UserDataProvider>(context);

    // Проверяем, что данные не null
    if (userDataProvider.userData == null) {
      return const Center(child: Text('Данные пользователя недоступны'));
    }

    final userData = userDataProvider.userData!;

    return Scaffold(
      appBar: AppBar(
        leading: BackButton(
          onPressed: () {
            Navigator.pushNamedAndRemoveUntil(
                context, '/main-menu-screen', (route) => false);
          },
        ),
        centerTitle: true,
        flexibleSpace: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Text(
              'Мой профиль',
              style: TextStyle(
                color: Color(0xFF1A7D2A),
                fontSize: 20,
                fontFamily: 'GT-Eesti-Pro-Display',
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(32.0),
        child: Padding(
          padding: const EdgeInsets.only(top: 16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(bottom: 16.0),
                child: PhoneNumber(),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 16.0),
                child: AddressField(
                    addressName: userData.name,
                    apartmentName: userData.apartment
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 16.0),
                child: PaymentMethodField(),
              ),
              Spacer(),
              QuitButton()
            ],
          ),
        ),
      ),
    );
  }
}

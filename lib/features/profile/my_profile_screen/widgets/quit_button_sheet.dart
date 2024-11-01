import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tt_service/models/user.dart';
import 'package:tt_service/models/user_data_provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tt_service/features/auth/code_screen/bloc/auth_code_bloc.dart';
import 'package:tt_service/features/auth/code_screen/view/code_screen.dart';
import 'package:tt_service/features/auth/check_auth/view/check_auth_screen.dart';


class QuitButtonSheet extends StatefulWidget {
  const QuitButtonSheet({Key? key}) : super(key: key);

  @override
  _QuitButtonSheetState createState() => _QuitButtonSheetState();
}

class _QuitButtonSheetState extends State<QuitButtonSheet> {
  bool isLoading = false;

  Future<void> _handleQuit() async {

      globalPhoneNumber = null;

      final prefs = await SharedPreferences.getInstance();
      print(prefs);
      await prefs.remove('access_token');

      // Очистить данные в UserDataProvider
      Provider.of<UserDataProvider>(context, listen: false).clearUserData();

      // Если используете другие провайдеры или системы хранения (например, SharedPreferences, SecureStorage), очистите их здесь
      // Например:
      // Provider.of<AnotherProvider>(context, listen: false).clearData();
      // await SecureStorage.deleteAll();

      // Показать сообщение "Успешно!"
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Успешно!')),
      );
  }

  @override
  Widget build(BuildContext context) {
      return Container(
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(25),
            topRight: Radius.circular(25),
          ),
        ),
        height: 300,
        width: MediaQuery
            .sizeOf(context)
            .width,
        child: Column(
          children: [
            const SizedBox(
              height: 36,
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 64),
              child: Center(
                child: Text(
                  'Вы уверены, что хотите выйти из своего профиля?',
                  style: TextStyle(
                    fontFamily: 'GT-Eesti-Pro-Display',
                    fontSize: 20,
                    fontWeight: FontWeight.w300,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 12),
            Padding(
              padding: const EdgeInsets.fromLTRB(36, 16, 36, 8),
              child: InkWell(
                onTap: () {
                  _handleQuit();
                  // Переход на самый первый экран, удалив все предыдущие маршруты
                  Navigator.of(context).pushNamedAndRemoveUntil('/first-screen', (Route<dynamic> route) => false);
                },
                child: AspectRatio(
                  aspectRatio: 19 / 3,
                  child: Container(
                    decoration: BoxDecoration(
                      color: Color(0xFFBAE7BA),
                      borderRadius: BorderRadius.circular(10),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.2),
                          blurRadius: 15,
                          spreadRadius: 1,
                        ),
                      ],
                    ),
                    child: Center(
                        child: Text('Выйти',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Color(0xFF505050),
                            fontSize: 20,
                            fontFamily: 'GT-Eesti-Pro-Display',
                            fontWeight: FontWeight.w300,
                          ),
                        )
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(35, 16, 35, 8),
              child: InkWell(
                onTap: () {},
                child: AspectRatio(
                  aspectRatio: 19 / 3,
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.2),
                          blurRadius: 15,
                          spreadRadius: 1,
                        ),
                      ],
                    ),
                    child: Center(
                        child: Text('Отмена',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Color(0xFF505050),
                            fontSize: 20,
                            fontFamily: 'GT-Eesti-Pro-Display',
                            fontWeight: FontWeight.w300,
                          ),
                        )
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      );
    }
  }

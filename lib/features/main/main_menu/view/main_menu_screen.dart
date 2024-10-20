import 'package:flutter/material.dart';
import 'package:tt_service/features/main/main_menu/widgets/my_profile.dart';
import 'package:tt_service/features/main/main_menu/widgets/order_history.dart';
import 'package:tt_service/features/main/main_menu/widgets/take_out_the_trash.dart';
import 'package:tt_service/services/api_service.dart';
class MainMenuScreen extends StatefulWidget {
  const MainMenuScreen({Key? key}) : super(key: key);

  @override
  _MainMenuScreenState createState() => _MainMenuScreenState();
}

class _MainMenuScreenState extends State<MainMenuScreen> {
  final apiService = ApiService();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
      ),
      body: Center(
        child: Column(
          children: [
            TakeOutTheTrash(),
            OrderHistory(),
            MyProfile()
          ],
        ),
      )
    );
  }
}

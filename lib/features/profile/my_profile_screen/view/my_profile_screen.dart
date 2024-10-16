import 'package:flutter/material.dart';

class MyProfileScreen extends StatefulWidget {
  const MyProfileScreen({Key? key}) : super(key: key);

  @override
  _MyProfileScreenState createState() => _MyProfileScreenState();
}

class _MyProfileScreenState extends State<MyProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'Мой профиль',
          style: TextStyle(
            color: Color(0xFF1A7D2A),
            fontSize: 20,
            fontFamily: 'GT-Eesti-Pro-Display',
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );
  }
}

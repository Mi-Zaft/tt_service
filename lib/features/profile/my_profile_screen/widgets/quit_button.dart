import 'package:flutter/material.dart';

class QuitButton extends StatefulWidget {
  const QuitButton({Key? key}) : super(key: key);

  @override
  _QuitButtonState createState() => _QuitButtonState();
}

class _QuitButtonState extends State<QuitButton> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.pushNamedAndRemoveUntil(
            context, '/order-history-screen', (route) => false);
      },
      child: AspectRatio(
        aspectRatio: 16 / 3,
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.2),
                blurRadius: 10,
                spreadRadius: 1,
              ),
            ],
          ),
          child: Center(
            child: Text('Выйти из профиля',
              style: TextStyle(
                color: Color(0xFF1A7D2A),
                fontSize: 20,
                fontFamily: 'GT-Eesti-Pro-Display',
                fontWeight: FontWeight.w500,
              ),
            )
          ),
        ),
      ),
    );
  }
}

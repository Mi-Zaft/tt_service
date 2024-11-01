import 'package:flutter/material.dart';
import 'package:tt_service/features/profile/my_profile_screen/widgets/quit_button_sheet.dart';

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
        showModalBottomSheet(
            context: context,
            builder: (context)
            {
              return QuitButtonSheet();
            }
        );
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

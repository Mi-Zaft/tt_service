import 'package:flutter/material.dart';
import 'package:tt_service/features/auth/check_auth/view/check_auth_screen.dart';


class PhoneNumber extends StatelessWidget {
  const PhoneNumber({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Номер телефона',
            style: TextStyle(
              color: Color(0xFF7A7A7A),
              fontSize: 18,
              fontFamily: 'GT-Eesti-Pro-Display',
              fontWeight: FontWeight.w300,
            ),
          ),
          Text('$globalPhoneNumber',
            style: TextStyle(
              color: Color(0xFF000000),
              fontSize: 18,
              fontFamily: 'GT-Eesti-Pro-Display',
              fontWeight: FontWeight.w300,
            ),
          )
        ],
      ),
    );
  }
}

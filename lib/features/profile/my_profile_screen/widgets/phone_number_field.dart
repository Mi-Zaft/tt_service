import 'package:flutter/material.dart';
import 'package:tt_service/features/auth/auth_screen/bloc/auth_bloc.dart';

class PhoneNumber extends StatelessWidget {
  const PhoneNumber({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final dynamic phoneNumber = AuthBloc.getPhoneNumber;
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
          Text(phoneNumber,
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

import 'package:flutter/material.dart';

class MyProfile extends StatelessWidget {
  const MyProfile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(24.0,),
      child: InkWell(
        onTap: () {
          Navigator.pushNamedAndRemoveUntil(
              context, '/my-profile-screen', (route) => false);
        },
        child: AspectRatio(
          aspectRatio: 16 / 4,
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
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Align(
                  alignment: Alignment.centerLeft,
                  child: Image.asset('assets/images/iconMyProfile.png'),
                ),
                Align(
                  alignment: Alignment.centerRight,
                  child: Text(
                    'Мой профиль',
                    style: TextStyle(
                      color: Color(0xFF1A7D2A),
                      fontSize: 20,
                      fontFamily: 'GT-Eesti-Pro-Display',
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

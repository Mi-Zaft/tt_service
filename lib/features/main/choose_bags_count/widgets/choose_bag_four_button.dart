import 'package:flutter/material.dart';

class ChooseBagFourButton extends StatelessWidget {
  const ChooseBagFourButton({super.key});

  @override
  Widget build(BuildContext context) { //center
    return Center(
      child: Row(
        children: [
          Expanded(
            child: Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Image.asset('assets/images/iconBag4.png'),
                  Image.asset('assets/images/iconBag4.png'),
                  Image.asset('assets/images/iconBag4.png'),
                  Image.asset('assets/images/iconBag4.png'),
                ],
              ),
            ),
          ),
          const Text(
            '2 мешка - 180Р',
            style: TextStyle(
              color: Color.fromRGBO(80, 80, 80, 1),
              fontFamily: 'GT-Eesti-Pro-Display',
              fontSize: 24,
              fontWeight: FontWeight.w500,
            ),
          ),
          const SizedBox(width: 7),
        ],
      ),
    );
  }
}

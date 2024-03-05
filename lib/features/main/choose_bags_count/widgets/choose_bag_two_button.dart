import 'package:flutter/material.dart';

class ChooseBagTwoButton extends StatelessWidget {
  const ChooseBagTwoButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Row(
        children: [
          Expanded(
            child: Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  const SizedBox(width: 10),
                  Image.asset('assets/images/iconBag2.png'),
                  Image.asset('assets/images/iconBag2.png'),
                  const SizedBox(width: 10)
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

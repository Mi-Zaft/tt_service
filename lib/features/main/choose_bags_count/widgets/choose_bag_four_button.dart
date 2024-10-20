import 'package:flutter/material.dart';

class ChooseBagFourButton extends StatelessWidget {
  final double price;
  const ChooseBagFourButton({super.key, required this.price});

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
                  Image.asset('assets/images/iconBag4.png'),
                  Image.asset('assets/images/iconBag4.png'),
                  Image.asset('assets/images/iconBag4.png'),
                  Image.asset('assets/images/iconBag4.png'),
                ],
              ),
            ),
          ),
          Text(
            '4 мешка - ${price.toStringAsFixed(0)}Р',
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

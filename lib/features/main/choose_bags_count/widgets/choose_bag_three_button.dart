import 'package:flutter/material.dart';

class ChooseBagThreeButton extends StatelessWidget {
  final double price;
  const ChooseBagThreeButton({super.key, required this.price});

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
                  Image.asset('assets/images/iconBag3.png'),
                  Image.asset('assets/images/iconBag3.png'),
                  Image.asset('assets/images/iconBag3.png')
                ],
              ),
            ),
          ),
          Text(
            '3 мешка - ${price.toStringAsFixed(0)}Р',
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
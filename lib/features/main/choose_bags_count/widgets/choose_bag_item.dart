import 'package:flutter/material.dart';

class ChooseBagItem extends StatelessWidget {
  const ChooseBagItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Padding(
          padding: EdgeInsets.only(left: 35),
        ),
        Expanded(
          child: Container(
            height: 70,
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(5)),
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: Color.fromRGBO(0, 0, 0, 0.2),
                  spreadRadius: 5,
                  blurRadius: 2,
                ),
              ],
            ),
            child: const Center(
              child: Text(
                'Первый вынос бесплатно',
                style: TextStyle(
                  color: Color.fromRGBO(80, 80, 80, 1),
                  fontFamily: 'GT-Eesti-Pro-Display',
                  fontSize: 24,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ),
        ),
        const Padding(
          padding: EdgeInsets.only(right: 35),
        )
      ],
    );
  }
}

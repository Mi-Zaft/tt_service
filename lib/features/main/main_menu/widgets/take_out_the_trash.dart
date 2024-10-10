import 'package:flutter/material.dart';

class TakeOutTheTrash extends StatelessWidget {
  const TakeOutTheTrash({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Stack(
          children: [
            Align(
              alignment: Alignment(0.8, -0.8),
              child: Text(
                'Вынос мусора',
                style: TextStyle(
                    fontFamily: 'GT-Eesti-Pro-Display',
                    fontSize: 24,
                    fontWeight: FontWeight.w400,
                    color: Color.fromRGBO(26, 125, 42, 100)),
              ),
            ),
            Align(
              alignment: Alignment(0.8, 0.8),
              child: Text(
                'от 120₽',
                style: TextStyle(
                    fontFamily: 'GT-Eesti-Pro-Display',
                    fontSize: 20,
                    fontWeight: FontWeight.w400,
                    color: Color.fromRGBO(26, 125, 42, 100)),
              ),
            ),
            Align(
              alignment: Alignment.bottomLeft,
              child: Image.asset('assets/images/imgTakeOut.png'),
            )
          ],
        ),
      ),
    );
  }
}

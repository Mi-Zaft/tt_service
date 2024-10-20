import 'package:flutter/widgets.dart';

class ChooseBagOneButton extends StatelessWidget {
  final double price;
  const ChooseBagOneButton({super.key, required this.price});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Row(
        children: [
          Expanded(
            child: Image.asset('assets/images/iconBag1.png'),
          ),
           Text(
            '1 мешок - ${price.toStringAsFixed(0)}Р',
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

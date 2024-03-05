import 'package:flutter/widgets.dart';

class ChooseBagOneButton extends StatelessWidget {
  const ChooseBagOneButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Row(
        children: [
          Expanded(
            child: Image.asset('assets/images/iconBag1.png'),
          ),
          const Text(
            '1 мешок - 130Р',
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

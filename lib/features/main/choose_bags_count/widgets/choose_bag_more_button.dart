import 'package:flutter/widgets.dart';

class ChooseBagMoreButton extends StatelessWidget {
  const ChooseBagMoreButton({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text(
        'Больше мешков',
        style: TextStyle(
          color: Color.fromRGBO(80, 80, 80, 1),
          fontFamily: 'GT-Eesti-Pro-Display',
          fontSize: 24,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }
}

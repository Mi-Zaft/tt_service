import 'package:flutter/material.dart';

class CodeTextField extends StatelessWidget {
  const CodeTextField({
    super.key,
    required this.onPressed,
    required this.value,
    this.isWrong = false
  });

  final VoidCallback onPressed;
  final String value;
  final bool isWrong;

  @override
  Widget build(BuildContext context) => GestureDetector(
        onTap: onPressed,
        child: Container(
          decoration: BoxDecoration(
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(5),
              topRight: Radius.circular(5),
            ),
            color: isWrong  ? const Color.fromRGBO(255, 136, 136, 0.5) : null,
            border: const Border(
              bottom: BorderSide(
                color: Color.fromRGBO(112, 112, 112, 1),
              ),
            ),
          ),
          child: Center(
            child: Text(
              value,
              style: TextStyle(
                  fontSize: 48,
                  fontWeight: FontWeight.w400,
                  fontFamily: "GT-Eesti-Pro-Display",
                  color: isWrong ? const Color.fromRGBO(255, 44, 44, 1) : Colors.black),
            ),
          ),
        ),
      );
}

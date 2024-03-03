import 'package:flutter/material.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

class CardDataTextfield extends StatelessWidget {
  final String labelText;
  final MaskTextInputFormatter maskFormatter;
  final TextEditingController controller;
  const CardDataTextfield({
    super.key,
    required this.labelText,
    required this.maskFormatter,
    required this.controller
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      inputFormatters: [maskFormatter],
      cursorColor: Colors.black,
      keyboardType: TextInputType.number,
      decoration: InputDecoration(
          focusedBorder: const UnderlineInputBorder(
            borderSide: BorderSide(
              color: Color.fromRGBO(112, 112, 112, 1),
            ),
          ),
          enabledBorder: const UnderlineInputBorder(
            borderSide: BorderSide(
              color: Color.fromRGBO(112, 112, 112, 1),
            ),
          ),
          labelText: labelText,
          labelStyle: const TextStyle(
            color: Color.fromRGBO(122, 122, 122, 1),
          )),
    );
  }
}

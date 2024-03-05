import 'package:flutter/material.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

class CardDataTextfield extends StatelessWidget {
  final String labelText;
  final MaskTextInputFormatter maskFormatter;
  final TextEditingController controller;
  final Function(String) onChanged;
  const CardDataTextfield({
    super.key,
    required this.labelText,
    required this.maskFormatter,
    required this.controller,
    required this.onChanged
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      onChanged: onChanged,
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

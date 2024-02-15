import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

class PhoneNumberTextfield extends StatelessWidget {
  PhoneNumberTextfield({super.key});

  MaskTextInputFormatter maskFormatter = MaskTextInputFormatter(
    mask: '(###) ###-##-##',
    filter: {"#": RegExp(r'[0-9]')},
  );

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.zero,
        decoration: const BoxDecoration(
          border: Border(
            bottom: BorderSide(),
          ),
        ),
        child: Row(
          children: [
            const Text(
              "+7",
              style: TextStyle(
                color: Colors.black,
                fontFamily: 'GT-Eesti-Pro-Display',
                fontSize: 32,
                fontWeight: FontWeight.w300,
              ),
            ),
            const SizedBox(
              width: 10,
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(bottom: 5),
                child: TextField(
                  cursorHeight: 32,
                  style: const TextStyle(
                    fontFamily: 'GT-Eesti-Pro-Display',
                    fontSize: 32,
                    fontWeight: FontWeight.w300,
                  ),
                  inputFormatters: [maskFormatter],
                  keyboardType: TextInputType.phone,
                  cursorColor: Colors.black,
                  decoration: const InputDecoration(
                    focusedBorder: InputBorder.none,
                    enabledBorder: InputBorder.none,
                    contentPadding: EdgeInsets.zero,
                  ),
                ),
              ),
            ),
          ],
        ));
  }
}

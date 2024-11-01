import 'package:flutter/material.dart';

class AddressTextfieldDigits extends StatelessWidget {
  final String labelText;
  final TextEditingController controller;
  final Function(String) onChanged;

  const AddressTextfieldDigits({
    super.key,
    required this.labelText,
    required this.controller,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      onChanged: (value) => {
        onChanged(value)
      },
      keyboardType: TextInputType.phone,
      controller: controller,
      cursorColor: Colors.black,
      style: const TextStyle(
        fontFamily: 'GT-Eesti-Pro-Display',
        fontSize: 20,
        fontWeight: FontWeight.w300,
      ),
      decoration: InputDecoration(
        focusedBorder: const UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.black),
        ),
        enabledBorder: const UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.black),
        ),
        contentPadding: EdgeInsets.zero,
        label: Text(
          labelText,
          style: const TextStyle(
              fontFamily: 'GT-Eesti-Pro-Display',
              fontSize: 16,
              color: Color.fromRGBO(122, 122, 122, 1)),
        ),
      ),
    );
  }
}
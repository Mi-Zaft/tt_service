import 'package:flutter/material.dart';

class AddressCommentTextfield extends StatelessWidget {
  final TextEditingController controller;
  final Function(String) onChanged;
  const AddressCommentTextfield({super.key, required this.controller, required this.onChanged,});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(Radius.circular(10)),
        boxShadow: [
          BoxShadow(
            color: Color.fromRGBO(0, 0, 0, 0.2),
            spreadRadius: 5,
            blurRadius: 7,
            offset: Offset(0, 3),
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: TextField(
          onChanged: (value) => {
            onChanged(value)
          },
          controller: controller,
          maxLines: 2,
          maxLength: 100,
          decoration: const InputDecoration(
            focusedBorder: InputBorder.none,
            enabledBorder: InputBorder.none,
          ),
        ),
      ),
    );
  }
}

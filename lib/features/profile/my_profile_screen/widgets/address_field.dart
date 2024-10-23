import 'package:flutter/material.dart';

class AddressField extends StatefulWidget {
  const AddressField({Key? key}) : super(key: key);

  @override
  _AddressFieldState createState() => _AddressFieldState();
}

class _AddressFieldState extends State<AddressField> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.pushNamedAndRemoveUntil(
            context, '/address-edit-screen', (route) => false);
      },
      child: Container(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Адрес',
                  style: TextStyle(
                    color: Color(0xFF7A7A7A),
                    fontSize: 18,
                    fontFamily: 'GT-Eesti-Pro-Display',
                    fontWeight: FontWeight.w300,
                  ),
                ),
                Text(' Ул. Петрушкина 90 кв 90',
                  style: TextStyle(
                    color: Color(0xFF000000),
                    fontSize: 18,
                    fontFamily: 'GT-Eesti-Pro-Display',
                    fontWeight: FontWeight.w300,
                  ),
                )
              ],
            ),
            Icon(Icons.arrow_forward_ios)
          ],
        ),
      ),
    );
  }
}

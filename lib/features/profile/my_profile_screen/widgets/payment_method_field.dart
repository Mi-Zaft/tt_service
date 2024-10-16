import 'package:flutter/material.dart';

class PaymentMethodField extends StatefulWidget {
  const PaymentMethodField({Key? key}) : super(key: key);

  @override
  _PaymentMethodFieldState createState() => _PaymentMethodFieldState();
}

class _PaymentMethodFieldState extends State<PaymentMethodField> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Способ оплаты',
                style: TextStyle(
                  color: Color(0xFF7A7A7A),
                  fontSize: 18,
                  fontFamily: 'GT-Eesti-Pro-Display',
                  fontWeight: FontWeight.w300,
                ),
              ),
              Text(' **** 6767',
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
    );
  }
}

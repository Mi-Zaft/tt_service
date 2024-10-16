import 'package:flutter/material.dart';

class OrderHistoryScreen extends StatefulWidget {
  const OrderHistoryScreen({Key? key}) : super(key: key);

  @override
  _OrderHistoryScreenState createState() => _OrderHistoryScreenState();
}

class _OrderHistoryScreenState extends State<OrderHistoryScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: BackButton(),
        centerTitle: true,
        flexibleSpace: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Text(
              'История заказов',
              style: TextStyle(
                color: Color(0xFF1A7D2A),
                fontSize: 20,
                fontFamily: 'GT-Eesti-Pro-Display',
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

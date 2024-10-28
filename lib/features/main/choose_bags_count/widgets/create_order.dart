import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:tt_service/services/api_service.dart';

class CreateOrder extends StatefulWidget {
  final String name;
  final int bagsQuantity;
  final int price;
  final String apartment;
  final int freeBags;
  

  const CreateOrder({
    Key? key,
    required this.name,
    required this.freeBags,
    required this.apartment,
    required this.bagsQuantity,
    required this.price,
  }) : super(key: key);

  @override

  _CreateOrderState createState() => _CreateOrderState();

}

class _CreateOrderState extends State<CreateOrder> {

  @override
  Widget build(BuildContext context) {

    int? countedBags = widget.bagsQuantity;
    int? countedFreeBags = widget.freeBags;
    Map<String, dynamic> data = {
      'quantity': '$countedBags',
      'quantity_free': '$countedFreeBags'
    };
    String? dataToPost = jsonEncode(data);

    return Container(
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(25),
          topRight: Radius.circular(25),
        ),
      ),
      height: 300,
      width: MediaQuery.sizeOf(context).width,
      child: Column(
        children: [
          const SizedBox(height: 50),
          const Text(
            'Все верно?',
            style: TextStyle(
              fontFamily: 'GT-Eesti-Pro-Display',
              fontSize: 24,
              fontWeight: FontWeight.w400,
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 24),
            child: Column(
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Image.asset('assets/images/iconGeo.png'),
                    Container(
                      width: 10,
                    ),
                    Text(
                      '${widget.name} кв. ${widget.apartment}',
                      style: TextStyle(
                        fontFamily: 'GT-Eesti-Pro-Display',
                        fontSize: 20,
                        fontWeight: FontWeight.w300,
                      ),
                    )
                  ],
                ),
                Divider(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Image.asset('assets/images/iconBag.png'),
                    Container(
                      width: 10,
                    ),
                    Text(
                      '${widget.bagsQuantity} мешков - ${widget.price.toStringAsFixed(0)}₽',
                      style: TextStyle(
                        fontFamily: 'GT-Eesti-Pro-Display',
                        fontSize: 20,
                        fontWeight: FontWeight.w300,
                        ),
                    ),
                  ],
                ),
                Divider(),
              ],
            )
          ),
          const SizedBox(height: 30),
          Row(
            children: [
              const SizedBox(width: 24),
              Expanded(
                child: ElevatedButton(
                  onPressed: () => {
                    Navigator.pop(context),
                    print(dataToPost),
                    ApiService().postData('api/v1/order', dataToPost)
                  },
                  style: ElevatedButton.styleFrom(
                    fixedSize: const Size(0, 60),
                    textStyle: const TextStyle(
                        fontSize: 24, fontFamily: "GT-Eesti-Pro-Display"),
                    backgroundColor: const Color.fromRGBO(97, 160, 69, 1),
                    foregroundColor: Colors.white,
                    elevation: 5.0,
                  ),
                  child: const Text('Да, оформить'),
                ),
              ),
              const SizedBox(width: 24),
            ],
          ),
        ],
      ),
    );
  }
}

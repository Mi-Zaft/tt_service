import 'package:flutter/material.dart';

import '../../../../models/order.dart';

class OrderDetailsHistoryScreen extends StatelessWidget {
  final Order order;

  const OrderDetailsHistoryScreen({Key? key, required this.order}) : super(key: key);

  String formatTimestamp(int timestamp) {
    var date = DateTime.fromMillisecondsSinceEpoch(timestamp * 1000);
    return '${date.day}.${date.month}.${date.year} ${date.hour}:${date.minute}';
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(25),
          topRight: Radius.circular(25),
        ),
      ),
      height: 330,
      width: MediaQuery.of(context).size.width,
      child: Column(
        children: [
          SizedBox(height: 50),
          Text(
            "${formatTimestamp(order.createdAt)}",
            style: TextStyle(
              color: Color(0xFF505050),
              fontFamily: 'GT-Eesti-Pro-Display',
              fontSize: 24,
              fontWeight: FontWeight.w400,
            ),
          ),
          const SizedBox(height: 10),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: Column(
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Image.asset('assets/images/iconGeo.png'),
                    const SizedBox(width: 10),
                    Text(
                      '${order.address} кв. ${order.apartment}',
                      style: const TextStyle(
                        fontFamily: 'GT-Eesti-Pro-Display',
                        fontSize: 20,
                        fontWeight: FontWeight.w300,
                      ),
                    ),
                  ],
                ),
                const Divider(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Image.asset('assets/images/iconBag.png'),
                    const SizedBox(width: 10),
                    Text(
                      '${order.quantity} мешков - ${order.price}₽',
                      style: const TextStyle(
                        fontFamily: 'GT-Eesti-Pro-Display',
                        fontSize: 20,
                        fontWeight: FontWeight.w300,
                      ),
                    ),
                  ],
                ),
                const Divider(),
              ],
            ),
          ),
          Column(
            children: [
              SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Заказ выполняется',
                    style: const TextStyle(
                      color: Color(0xFF505050),
                      fontFamily: 'GT-Eesti-Pro-Display',
                      fontSize: 20,
                      fontWeight: FontWeight.w300,
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Image.asset('assets/images/iconSpinner.png'),
                ],
              ),
              SizedBox(
                height: 15,
              ),
              Container(
                child: InkWell(
                  onTap: () {},
                  child: Ink(
                    decoration: const BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                            color: Color(0xFF000000),
                            spreadRadius: 1,
                            blurRadius: 15,
                          )
                        ],
                        color: Colors.white,
                        borderRadius: BorderRadius.all(Radius.circular(5),
                        )
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset('assets/images/iconPhone.png'),
                        SizedBox(
                          width: 10,
                        ),
                        Text('Позвонить',
                          style: TextStyle(
                            color: Color(0xFF505050),
                            fontFamily: 'GT-Eesti-Pro-Display',
                            fontSize: 20,
                            fontWeight: FontWeight.w300,
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

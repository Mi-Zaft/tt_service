import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:tt_service/services/api_service.dart';
import 'package:tt_service/models/order.dart';
import 'package:tt_service/features/main/order/view/order_detail_screen.dart';


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
  bool isLoading = false; // Для отображения индикатора загрузки

  String formatTimestamp(int timestamp) {
    // Преобразуем метку времени в дату
    final date = DateTime.fromMillisecondsSinceEpoch(timestamp * 1000);
    return '${date.day}.${date.month}.${date.year} ${date.hour}:${date.minute}';
  }

  @override
  Widget build(BuildContext context) {
    int countedBags = widget.bagsQuantity;
    int countedFreeBags = widget.freeBags;

    Map<String, dynamic> data = {
      'quantity': countedBags,
      'quantity_free': countedFreeBags,
    };

    // Сохраняем родительский контекст
    final parentContext = Navigator.of(context).context;

    return Container(
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(25),
          topRight: Radius.circular(25),
        ),
      ),
      height: 300,
      width: MediaQuery.of(context).size.width,
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
                      '${widget.name} кв. ${widget.apartment}',
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
                      '${widget.bagsQuantity} мешков - ${widget.price.toStringAsFixed(0)}₽',
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
          const SizedBox(height: 30),
          Row(
            children: [
              const SizedBox(width: 24),
              Expanded(
                child: ElevatedButton(
                  onPressed: isLoading
                      ? null
                      : () async {
                    setState(() {
                      isLoading = true;
                    });

                    try {
                      // Отправляем POST-запрос для создания заказа
                      await ApiService().postData('api/v1/order', data);

                      // Получаем список заказов
                      var response = await ApiService().fetchData('api/v1/order');

                      // Предполагается, что response.data - это List<dynamic>
                      List<dynamic> dataList = response.data;

                      // Преобразуем список в объекты Order
                      List<Order> orders = dataList
                          .map((json) => Order.fromJson(json))
                          .toList();

                      if (orders.isNotEmpty) {
                        // Сортируем заказы по дате создания (от новых к старым)
                        orders.sort((a, b) => b.createdAt.compareTo(a.createdAt));

                        // Берём последний заказ
                        Order latestOrder = orders.first;

                        // Преобразуем дату
                        final String formattedDate = formatTimestamp(latestOrder.createdAt);

                        // Закрываем текущую модалку
                        Navigator.of(context).pop();

                        // Используем родительский контекст для открытия новой модалки
                        WidgetsBinding.instance.addPostFrameCallback((_) {
                          showModalBottomSheet(
                            context: parentContext,
                            builder: (context) {
                              return OrderDetailsScreen(
                                addressName: widget.name,
                                apartmentName: widget.apartment,
                                quantity: latestOrder.quantity,
                                price: latestOrder.price,
                                status: latestOrder.status,
                                createdAt: formattedDate,
                              );
                            },
                          );
                        });
                      } else {
                        // Обработка случая, когда список заказов пуст
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                              content: Text('Список заказов пуст')),
                        );
                      }
                    } catch (e) {
                      // Обработка ошибок
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text('Ошибка: $e')),
                      );
                    } finally {
                      setState(() {
                        isLoading = false;
                      });
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    fixedSize: const Size(0, 60),
                    textStyle: const TextStyle(
                      fontSize: 24,
                      fontFamily: "GT-Eesti-Pro-Display",
                    ),
                    backgroundColor: const Color.fromRGBO(97, 160, 69, 1),
                    foregroundColor: Colors.white,
                    elevation: 5.0,
                  ),
                  child: isLoading
                      ? const CircularProgressIndicator(
                    valueColor:
                    AlwaysStoppedAnimation<Color>(Colors.white),
                  )
                      : const Text('Да, оформить'),
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


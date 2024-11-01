import 'package:flutter/material.dart';
import 'package:tt_service/models/order.dart';
import 'package:tt_service/services/api_service.dart';
import 'package:tt_service/features/main/order_history/view/order_details_history_screen.dart';

class OrderHistoryScreen extends StatefulWidget {
  const OrderHistoryScreen({Key? key}) : super(key: key);

  @override
  _OrderHistoryScreenState createState() => _OrderHistoryScreenState();
}

class _OrderHistoryScreenState extends State<OrderHistoryScreen> {
  late Future<List<Order>> _ordersFuture;

  @override
  void initState() {
    super.initState();
    _ordersFuture = fetchOrders();
  }

  Future<List<Order>> fetchOrders() async {
    try {
      var response = await ApiService().fetchData('api/v1/order');

      // Предполагается, что response.data - это List<dynamic>
      List<dynamic> dataList = response.data;

      // Преобразуем список в объекты Order
      List<Order> orders = dataList.map((json) => Order.fromJson(json)).toList();

      // Сортируем заказы по дате создания (от новых к старым)
      orders.sort((a, b) => b.createdAt.compareTo(a.createdAt));

      return orders;
    } catch (e) {
      throw Exception('Ошибка при загрузке заказов: $e');
    }
  }

  // Метод для форматирования даты
  String formatTimestamp(int timestamp) {
    var date = DateTime.fromMillisecondsSinceEpoch(timestamp * 1000);
    return '${date.day}.${date.month}.${date.year} ${date.hour}:${date.minute}';
  }

  // Метод для определения цвета кнопки по статусу
  Color getStatusColor(String status) {
    switch (status) {
      case 'CREATED':
        return Colors.lightGreen;
      case 'IN_PROGRESS':
        return Colors.orange;
      case 'COMPLETED':
        return Colors.grey;
      case 'CANCELLED':
        return Colors.red;
      default:
        return Colors.grey;
    }
  }

  // Метод для отображения деталей заказа
  void showOrderDetails(Order order) {
    showModalBottomSheet(
      context: context,
      builder: (context) {
        return OrderDetailsHistoryScreen(order: order);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: BackButton(
          onPressed: () {
            Navigator.pushNamedAndRemoveUntil(
                context, '/main-menu-screen', (route) => false);
          },
        ),
        centerTitle: true,
        title: const Text(
          'История заказов',
          style: TextStyle(
            color: Color(0xFF1A7D2A),
            fontSize: 20,
            fontFamily: 'GT-Eesti-Pro-Display',
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
      body: FutureBuilder<List<Order>>(
        future: _ordersFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            // Отображаем индикатор загрузки
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            // Отображаем сообщение об ошибке
            return Center(child: Text('Ошибка: ${snapshot.error}'));
          } else if (snapshot.hasData) {
            // Отображаем список заказов
            List<Order> orders = snapshot.data!;
            return ListView.builder(
              itemCount: orders.length,
              itemBuilder: (context, index) {
                Order order = orders[index];
                String formattedDate = formatTimestamp(order.createdAt);
                Color buttonColor = getStatusColor(order.status);

                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: buttonColor,
                      padding: const EdgeInsets.symmetric(vertical: 16.0),
                    ),
                    onPressed: () => showOrderDetails(order),
                    child: Text(
                      formattedDate,
                      style: const TextStyle(
                        color: Color.fromRGBO(80, 80, 80, 1),
                        fontFamily: 'GT-Eesti-Pro-Display',
                        fontSize: 20,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                );
              },
            );
          } else {
            return const Center(child: Text('Нет данных для отображения'));
          }
        },
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:tt_service/features/main/order/view/create_order.dart';

class ChooseBagMoreSheet extends StatefulWidget {
  final Function(double) onChanged;
  final freeBags;
  final name;
  final apartment;
  final bagsQuantity;
  final price;
  final int fourBagsPrice;
  final int additionalBagPrice;

  const ChooseBagMoreSheet({
    super.key,
    required this.name,
    required this.freeBags,
    required this.apartment,
    required this.price,
    required this.bagsQuantity,
    required this.onChanged,
    required this.fourBagsPrice,
    required this.additionalBagPrice,
  });

  @override
  State<ChooseBagMoreSheet> createState() => _ChooseBagMoreSheetState();
}

class _ChooseBagMoreSheetState extends State<ChooseBagMoreSheet> {
  int _bagsQuantity = 5; // Начальное значение слайдера

  @override
  Widget build(BuildContext context) {
    // Рассчитываем количество дополнительных мешков
    int extraBags = _bagsQuantity - 4;
    // Рассчитываем итоговую стоимость
    int totalPrice = widget.fourBagsPrice + widget.additionalBagPrice * extraBags;

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
          const Padding(
            padding: EdgeInsets.only(top: 50, bottom: 10),
            child: Text(
              'Сколько будет мешков?',
              style: TextStyle(
                fontFamily: 'GT-Eesti-Pro-Display',
                fontSize: 24,
                fontWeight: FontWeight.w400,
              ),
            ),
          ),
          SliderTheme(
            data: const SliderThemeData(
              thumbColor: Color.fromRGBO(97, 160, 69, 1),
              activeTrackColor: Color.fromRGBO(97, 160, 69, 1),
              valueIndicatorColor: Color.fromRGBO(97, 160, 69, 1),
            ),
            child: Slider(
              value: _bagsQuantity.toDouble(),
              divisions: 5,
              min: 5,
              max: 10,
              label: _bagsQuantity.round().toString(),
              onChanged: (double newValue) {
                setState(() {
                  _bagsQuantity = newValue.toInt();
                  widget.onChanged(newValue);
                });
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 12, bottom: 25),
            child: Text(
              'Цена: ${totalPrice.toStringAsFixed(0)}₽',
              style: const TextStyle(
                fontFamily: 'GT-Eesti-Pro-Display',
                fontSize: 24,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          Row(
            children: [
              const SizedBox(width: 24),
              Expanded(
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context);
                    showModalBottomSheet(
                        context: context,
                        builder: (context) {
                          return CreateOrder(
                            name: widget.name,
                            apartment: widget.apartment,
                            bagsQuantity: _bagsQuantity.toInt(),
                            price: totalPrice,
                            freeBags: widget.freeBags,
                          );
                    }
                    );
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
                  child: const Text('Продолжить'),
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
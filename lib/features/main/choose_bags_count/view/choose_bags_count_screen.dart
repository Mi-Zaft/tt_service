import 'package:flutter/material.dart';
import 'package:tt_service/features/main/choose_bags_count/widgets/choose_bag_how_it_work_button.dart';
import 'package:tt_service/features/main/choose_bags_count/widgets/choose_bag_item.dart';
import 'package:tt_service/features/main/choose_bags_count/widgets/choose_bag_more_sheet.dart';

class ChooseBagsCountScreen extends StatefulWidget {
  const ChooseBagsCountScreen({super.key});

  @override
  State<ChooseBagsCountScreen> createState() => _ChooseBagsCountScreen();
}

class _ChooseBagsCountScreen extends State<ChooseBagsCountScreen> {
  double _bagsQuantity = 4;
  final FocusNode _focusNode = FocusNode();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Image.asset(
          "assets/images/imgLogo2.png",
          width: MediaQuery.of(context).size.width / 3,
        ),
        actions: [
          RawMaterialButton(
            onPressed: () {},
            elevation: 2.0,
            fillColor: Colors.white,
            padding: const EdgeInsets.all(15.0),
            shape: const CircleBorder(),
            child: const Icon(
              Icons.menu,
              size: 20.0,
              color: Color.fromRGBO(97, 160, 69, 1),
            ),
          ),
        ],
      ),
      body: SafeArea(
        child: Column(
          children: [
            const SizedBox(height: 20),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  ChooseBagItem(
                    type: Types.free,
                    onTap: () {
                      print('free');
                    },
                  ),
                  ChooseBagItem(
                    type: Types.one,
                    onTap: () {
                      _bagsQuantity = 1;
                      print('one');
                    },
                  ),
                  ChooseBagItem(
                    type: Types.two,
                    onTap: () {
                      _bagsQuantity = 2;
                      print('two');
                    },
                  ),
                  ChooseBagItem(
                    type: Types.three,
                    onTap: () {
                      _bagsQuantity = 3;
                      print('three');
                    },
                  ),
                  ChooseBagItem(
                    type: Types.four,
                    onTap: () {
                      _bagsQuantity = 4;
                      print('four');
                    },
                  ),
                  ChooseBagItem(
                    type: Types.more,
                    onTap: () {
                      showModalBottomSheet(
                        context: context,
                        builder: (context) {
                          return ChooseBagMoreSheet(
                            onChanged: (newValue) {
                              _bagsQuantity = newValue;
                            },
                          );
                        },
                      );
                    },
                  ),
                  TextButton(
                    onPressed: () {
                      showModalBottomSheet(
                        context: context,
                        builder: (context) {
                          return const ChooseBagHowItWorkButton();
                        },
                      );
                    },
                    child: const Text(
                      'Как это работает?',
                      style: TextStyle(
                          color: Color.fromRGBO(97, 160, 69, 1),
                          fontFamily: 'GT-Eesti-Pro-Display',
                          fontSize: 24,
                          fontWeight: FontWeight.w700),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

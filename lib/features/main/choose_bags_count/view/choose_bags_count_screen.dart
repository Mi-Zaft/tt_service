import 'package:flutter/material.dart';
import 'package:tt_service/features/main/choose_bags_count/widgets/choose_bag_item.dart';

class ChooseBagsCountScreen extends StatelessWidget {
  const ChooseBagsCountScreen({super.key});

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
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            const ChooseBagItem(),
            const ChooseBagItem(),
            const ChooseBagItem(),
            const ChooseBagItem(),
            const ChooseBagItem(),
            TextButton(
              onPressed: () {},
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
    );
  }
}

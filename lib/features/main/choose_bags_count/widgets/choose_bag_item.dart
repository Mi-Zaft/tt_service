import 'package:flutter/material.dart';
import 'package:tt_service/features/main/choose_bags_count/widgets/choose_bag_four_button.dart';
import 'package:tt_service/features/main/choose_bags_count/widgets/choose_bag_free_button.dart';
import 'package:tt_service/features/main/choose_bags_count/widgets/choose_bag_more_button.dart';
import 'package:tt_service/features/main/choose_bags_count/widgets/choose_bag_one_button.dart';
import 'package:tt_service/features/main/choose_bags_count/widgets/choose_bag_three_button.dart';
import 'package:tt_service/features/main/choose_bags_count/widgets/choose_bag_two_button.dart';

enum Types { free, one, two, three, four, more }

class ChooseBagItem extends StatelessWidget {
  final Types type;
  final Function onTap;
  const ChooseBagItem({super.key, required this.type, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Padding(
          padding: EdgeInsets.only(left: 35),
        ),
        Expanded(
          child: InkWell(
            onTap: () => onTap(),
            child: Ink(
              height: 70,
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(5)),
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Color.fromRGBO(0, 0, 0, 0.2),
                    spreadRadius: 5,
                    blurRadius: 2,
                  ),
                ],
              ),
              child: Builder(
                builder: (context) {
                  if (type == Types.free) {
                    return const ChooseBagFreeButton();
                  } else 
                  if (type == Types.one) {
                    return const ChooseBagOneButton();
                  } else if (type == Types.two) {
                    return const ChooseBagTwoButton();
                  } else if (type == Types.three) {
                    return const ChooseBagThreeButton();
                  } else if (type == Types.four) {
                    return const ChooseBagFourButton();
                  } else {
                    return const ChooseBagMoreButton();
                  }
                },
              ),
            ),
          ),
        ),
        const Padding(
          padding: EdgeInsets.only(right: 35),
        )
      ],
    );
  }
}

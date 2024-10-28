import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
import 'package:tt_service/features/main/choose_bags_count/widgets/choose_bag_how_it_work_button.dart';
import 'package:tt_service/features/main/choose_bags_count/widgets/choose_bag_item.dart';
import 'package:tt_service/features/main/choose_bags_count/widgets/choose_bag_more_sheet.dart';
import 'package:tt_service/features/main/choose_bags_count/widgets/create_order.dart';
import 'package:tt_service/models/address.dart';
import 'package:tt_service/models/prices.dart';
import 'package:tt_service/features/main/choose_bags_count/bloc/bag_prices_bloc.dart';
import 'package:tt_service/models/user.dart';
import 'package:tt_service/models/user_data_provider.dart';


class ChooseBagsCountScreen extends StatelessWidget {

  const ChooseBagsCountScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => BagPricesBloc()..add(LoadBagPricesEvent()),
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Image.asset(
            "assets/images/imgLogo2.png",
            width: MediaQuery.of(context).size.width / 3,
          ),
          actions: [
            RawMaterialButton(
              onPressed: () {
                Navigator.pushNamedAndRemoveUntil(
                    context, '/main-menu-screen', (route) => false);
              },
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
        body: BlocBuilder<BagPricesBloc, BagPricesState>(
          builder: (context, state) {
            if (state is BagPricesLoading) {
              return const Center(child: CircularProgressIndicator());
            } else if (state is BagPricesLoaded) {
              final bagPrices = state.bagPrices;
              return ChooseBagsContent(bagPrices: bagPrices);
            } else if (state is BagPricesError) {
              return Center(
                child: Text(state.message),
              );
            } else {
              return const SizedBox.shrink();
            }
          },
        ),
      ),
    );
  }
}

class ChooseBagsContent extends StatefulWidget {
  final BagPrices bagPrices;

  const ChooseBagsContent({super.key, required this.bagPrices});

  @override
  State<ChooseBagsContent> createState() => _ChooseBagsContentState();
}

class _ChooseBagsContentState extends State<ChooseBagsContent> {
  double _bagsQuantity = 4;
  int freeBags = 0;

  @override
  Widget build(BuildContext context) {
    final userDataProvider = Provider.of<UserDataProvider>(context);
    final bagPrices = widget.bagPrices;
    final userData = userDataProvider.userData!;


    return SafeArea(
      child: Column(
        children: [
          const SizedBox(height: 20),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                ChooseBagItem(
                  price: 0,
                  type: Types.free,
                  onTap: () {
                    print('free');
                  },
                ),
                ChooseBagItem(
                  price: bagPrices.oneBagCost,
                  type: Types.one,
                  onTap: () {
                    setState(() {
                      _bagsQuantity = 1;
                    });
                    print('one');
                    print('Цена за два мешка: ${bagPrices?.oneBagCost}');
                  },
                ),
                ChooseBagItem(
                  price: bagPrices.twoBagsCost,
                  type: Types.two,
                  onTap: () {
                    setState(() {
                      _bagsQuantity = 2;
                    });
                    print('two');
                    print('Цена за два мешка: ${bagPrices?.twoBagsCost}');
                  },
                ),
                ChooseBagItem(
                  price: bagPrices.threeBagsCost,
                  type: Types.three,
                  onTap: () {
                    setState(() {
                      _bagsQuantity = 3;
                    });
                    print('three');
                  },
                ),
                ChooseBagItem(
                  price: bagPrices.fourBagsCost,
                  type: Types.four,
                  onTap: () {
                    setState(() {
                      _bagsQuantity = 4;
                      showModalBottomSheet(
                          context: context,
                          builder: (context) {
                            return CreateOrder(
                                name: userData.name,
                                apartment: userData.apartment,
                                bagsQuantity: _bagsQuantity.toInt(),
                                price: bagPrices.fourBagsCost.toInt(),
                                freeBags: freeBags,
                            );
                          }
                      );
                    }
                    );
                    print('four');
                  },
                ),
              ChooseBagItem(
                price: bagPrices!.additionalBagCost,
                type: Types.more,
                onTap: () {
                  showModalBottomSheet(
                    context: context,
                    builder: (context) {
                      return ChooseBagMoreSheet(
                        onChanged: (newValue) {
                          setState(() {
                            _bagsQuantity = newValue;
                          });
                        },
                        fourBagsPrice: bagPrices!.fourBagsCost,
                        additionalBagPrice: bagPrices!.additionalBagCost,
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
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
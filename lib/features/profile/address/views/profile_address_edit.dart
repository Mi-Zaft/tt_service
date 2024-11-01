import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tt_service/features/profile/address/bloc/profile_address_bloc.dart';
import 'package:tt_service/features/profile/address/widgets/address_comment_textfield.dart';
import 'package:tt_service/features/profile/address/widgets/address_textfield.dart';
import 'package:tt_service/features/main/get_prices/get_prices.dart';
import 'package:tt_service/features/profile/my_profile_screen/widgets/phone_number_field.dart';
import 'package:tt_service/models/address.dart';
import 'package:tt_service/models/user_data_provider.dart';
import 'package:tt_service/models/user_data.dart';
import 'package:provider/provider.dart';
import 'package:tt_service/features/profile/address/widgets/address_bottom_sheet.dart';

import '../widgets/address_textfield_digits.dart';

class ProfileAddressEdit extends StatefulWidget {
  const ProfileAddressEdit({Key? key}) : super(key: key);

  @override
  _ProfileAddressEditState createState() => _ProfileAddressEditState();

}
class _ProfileAddressEditState extends State<ProfileAddressEdit> {
  late ProfileAddressBloc profileAddressBloc;
  final TextEditingController addressController = TextEditingController();
  final TextEditingController entranceController = TextEditingController();
  final TextEditingController floorController = TextEditingController();
  final TextEditingController apartmentController = TextEditingController();
  final TextEditingController intercomController = TextEditingController();
  final TextEditingController commentController = TextEditingController();

  @override
  void initState() {
    super.initState();
    profileAddressBloc = ProfileAddressBloc();
  }

  @override
  void dispose() {
    profileAddressBloc.close();
    addressController.dispose();
    entranceController.dispose();
    floorController.dispose();
    apartmentController.dispose();
    intercomController.dispose();
    commentController.dispose();
    super.dispose();
  }
  void _openAddressBottomSheet() {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true, // Позволяет `BottomSheet` занимать весь экран
      builder: (context) {
        return AddressBottomSheet(
          profileAddressBloc: profileAddressBloc,
          onAddressSelected: (AddressApi selectedAddress) {
            // Устанавливаем выбранный адрес в контроллер
            setState(() {
              addressController.text = selectedAddress.address;
            });
            // Обновляем Bloc выбранным адресом
            profileAddressBloc.add(
              ProfileAddressSomeFieldChanged(
                field: Fields.address,
                value: selectedAddress,
              ),
            );
            Navigator.pop(context); // Закрываем BottomSheet
          },
        );
      },
    );
  }
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => profileAddressBloc,
      child: BlocListener<ProfileAddressBloc, ProfileAddressState>(
        listener: (context, state) {
          if (state is ProfileAddressSaved) {
            // Получаем экземпляр ProfileAddressBloc
            final profileAddressBloc = BlocProvider.of<ProfileAddressBloc>(context);

            // Создаём экземпляр UserData на основе finalAddress
            UserData userData = UserData(
              id: profileAddressBloc.finalAddress?.id.toString() ?? '',
              name: profileAddressBloc.finalAddress?.name ?? '',
              entrance: profileAddressBloc.finalAddress?.entrance ?? '',
              floor: profileAddressBloc.finalAddress?.floor ?? '',
              apartment: profileAddressBloc.finalAddress?.apartment ?? '',
              comment: profileAddressBloc.finalAddress?.comment ?? '',
              intercom: profileAddressBloc.finalAddress?.intercom ?? '',
            );

            // Устанавливаем userData в UserDataProvider
            final userDataProvider = Provider.of<UserDataProvider>(context, listen: false);
            userDataProvider.setUserData(userData);
            print('Проверка на Null UserData в BlocListener = ${userData.name}');

            // Навигация на следующий экран
            Navigator.pushNamed(context, '/bags-count-screen');
          }
        },
        child: Scaffold(
          floatingActionButton: Padding(
            padding: const EdgeInsets.only(left: 24, right: 24, bottom: 24),
            child: Row(
              children: [
                Expanded(
                  child: BlocBuilder<ProfileAddressBloc, ProfileAddressState>(
                    bloc: profileAddressBloc,
                    builder: (context, state) {
                      if (state is ProfileAddressValidated) {
                        return ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            textStyle: const TextStyle(
                                fontSize: 24,
                                fontFamily: "GT-Eesti-Pro-Display"),
                            backgroundColor:
                                const Color.fromRGBO(97, 160, 69, 1),
                            foregroundColor: Colors.white,
                            elevation: 5.0,
                          ),
                          onPressed: () {
                            profileAddressBloc.add(ProfileAddressRequestSave());
                          },
                          child: const Padding(
                            padding: EdgeInsets.symmetric(vertical: 16),
                            child: Text("Сохранить адрес"),
                          ),
                        );
                      } else {
                        return ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            textStyle: const TextStyle(
                                fontSize: 24,
                                fontFamily: "GT-Eesti-Pro-Display"),
                            backgroundColor:
                                const Color.fromRGBO(50, 50, 50, 0.89),
                            foregroundColor: Colors.white,
                            elevation: 5.0,
                          ),
                          onPressed: () async {
                            await fetchBagPrices(forceRefresh: false);
                            Navigator.pushNamedAndRemoveUntil(
                              context,
                              '/bags-count-screen',
                                  (route) => false,
                            );
                          },
                          child: const Padding(
                            padding: EdgeInsets.symmetric(vertical: 16),
                            child: Text("Сохранить адрес"),
                          ),
                        );
                      }
                    },
                  ),
                ),
              ],
            ),
          ),
          floatingActionButtonLocation:
              FloatingActionButtonLocation.centerDocked,
          // resizeToAvoidBottomInset: false,
          body: SafeArea(
            child: Column(
              children: [
                SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 50),
                        child: Center(
                          child: Image.asset("assets/images/imgLogo2.png"),
                        ),
                      ),
                      const Padding(
                        padding:
                            EdgeInsets.only(bottom: 10, left: 25, right: 25),
                        child: Text(
                          "Откуда выкинуть мусор",
                          style: TextStyle(
                            fontFamily: 'GT-Eesti-Pro-Display',
                            fontSize: 20,
                            fontWeight: FontWeight.w300,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: GestureDetector(
                          onTap: _openAddressBottomSheet,
                          child: AbsorbPointer(
                            child: AddressTextfield(
                              keyboardType: TextInputType.text,
                              labelText: 'Адрес',
                              controller: addressController,
                              onChanged: (value) {
                                // Ввод обрабатывается в BottomSheet
                              },
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 15),
                        child: Row(
                          children: [
                            Expanded(
                              child: Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 5),
                                child: AddressTextfieldDigits(
                                  labelText: 'Подъезд',
                                  controller: entranceController,
                                  onChanged: (value) {
                                    profileAddressBloc.add(
                                      ProfileAddressSomeFieldChanged(
                                        field: Fields.entrance,
                                        value: value,
                                      ),
                                    );
                                  },
                                ),
                              ),
                            ),
                            Expanded(
                              child: Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 5),
                                child: AddressTextfieldDigits(
                                  labelText: 'Этаж',
                                  controller: floorController,
                                  onChanged: (value) {
                                    profileAddressBloc.add(
                                      ProfileAddressSomeFieldChanged(
                                        field: Fields.floor,
                                        value: value,
                                      ),
                                    );
                                  },
                                ),
                              ),
                            ),
                            Expanded(
                              child: Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 5),
                                child: AddressTextfieldDigits(
                                  labelText: 'Кв/офис',
                                  controller: apartmentController,
                                  onChanged: (value) {
                                    profileAddressBloc.add(
                                      ProfileAddressSomeFieldChanged(
                                        field: Fields.apartment,
                                        value: value,
                                      ),
                                    );
                                  },
                                ),
                              ),
                            ),
                            Expanded(
                              child: Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 5),
                                child: AddressTextfieldDigits(
                                  labelText: 'Домофон',
                                  controller: intercomController,
                                  onChanged: (value) {
                                    profileAddressBloc.add(
                                      ProfileAddressSomeFieldChanged(
                                        field: Fields.intercom,
                                        value: value,
                                      ),
                                    );
                                  },
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      const Padding(
                        padding: EdgeInsets.only(top: 20, left: 20),
                        child: Row(
                          children: [
                            Text(
                              'Комментарий',
                              style: TextStyle(
                                fontFamily: 'GT-Eesti-Pro-Display',
                                color: Color.fromRGBO(122, 122, 122, 1),
                                fontSize: 16,
                                fontWeight: FontWeight.w300,
                              ),
                              textAlign: TextAlign.left,
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding:
                        const EdgeInsets.only(left: 20, right: 20, top: 10),
                        child: AddressCommentTextfield(
                          controller: commentController,
                          onChanged: (value) {
                            profileAddressBloc.add(
                              ProfileAddressSomeFieldChanged(
                                field: Fields.comment,
                                value: value,
                              ),
                            );
                          },
                        ),
                      ),
                      // const Spacer(),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

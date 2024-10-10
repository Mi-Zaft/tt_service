import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tt_service/features/profile/address/bloc/profile_address_bloc.dart';
import 'package:tt_service/features/profile/address/widgets/address_comment_textfield.dart';
import 'package:tt_service/features/profile/address/widgets/address_suggest.dart';
import 'package:tt_service/features/profile/address/widgets/address_textfield.dart';

class ProfileAddressEdit extends StatelessWidget {
  const ProfileAddressEdit({super.key});

  @override
  Widget build(BuildContext context) {
    final ProfileAddressBloc profileAddressBloc = ProfileAddressBloc();
    final TextEditingController addressController = TextEditingController();
    final TextEditingController entranceController = TextEditingController();
    final TextEditingController floorController = TextEditingController();
    final TextEditingController apartmentController = TextEditingController();
    final TextEditingController intercomController = TextEditingController();
    final TextEditingController commentController = TextEditingController();

    return BlocProvider(
      create: (context) => ProfileAddressBloc(),
      child: BlocListener(
        bloc: profileAddressBloc,
        listener: (context, state) => {
          if (state is ProfileAddressSaved)
            {Navigator.pushNamed(context, '/edit-credit-card')}
        },
        child: Scaffold(
          floatingActionButton: Padding(
            padding: const EdgeInsets.only(left: 24, right: 24),
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
                          onPressed: () {
                            Navigator.pushNamedAndRemoveUntil(
                                context, '/bags-count-screen', (route) => false);
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
                        child: AddressTextfield(
                          labelText: 'Адрес',
                          controller: addressController,
                          onChanged: (value) {
                            profileAddressBloc.add(
                                ProfileAddressTextFieldChanged(value: value));
                          },
                        ),
                      ),
                      BlocBuilder<ProfileAddressBloc, ProfileAddressState>(
                          bloc: profileAddressBloc,
                          builder: (context, state) {
                            if (state is ProfileAddressListReceived) {
                              List<Widget> list = [];
                              for (var i = 0;
                                  i < state.listOfAddresses.length;
                                  i++) {
                                list.add(AddressSuggest(
                                  address: state.listOfAddresses[i].address,
                                  addressId: state.listOfAddresses[i].addressId,
                                  onTap: (addressId, address) => {
                                    addressController.text = address,
                                    state.listOfAddresses.clear,
                                    profileAddressBloc.add(
                                      ProfileAddressSomeFieldChanged(
                                        field: Fields.address,
                                        value: addressId,
                                      ),
                                    ),
                                  },
                                ));
                              }
                              return Column(
                                children: list,
                              );
                            } else {
                              return const SizedBox.shrink();
                            }
                          }),
                      const SizedBox(
                        height: 10,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 15),
                        child: Row(
                          children: [
                            Expanded(
                              child: Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 5),
                                child: AddressTextfield(
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
                                child: AddressTextfield(
                                  labelText: 'Этаж',
                                  controller: floorController,
                                  onChanged: (value) {},
                                ),
                              ),
                            ),
                            Expanded(
                              child: Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 5),
                                child: AddressTextfield(
                                  labelText: 'Кв/офис',
                                  controller: apartmentController,
                                  onChanged: (value) {},
                                ),
                              ),
                            ),
                            Expanded(
                              child: Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 5),
                                child: AddressTextfield(
                                  labelText: 'Домофон',
                                  controller: intercomController,
                                  onChanged: (value) {},
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
                            controller: commentController),
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

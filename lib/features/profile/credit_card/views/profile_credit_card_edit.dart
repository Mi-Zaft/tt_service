import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:tt_service/features/profile/credit_card/bloc/profile_credit_card_bloc.dart';
import 'package:tt_service/features/profile/credit_card/widgets/card_data_textfield.dart';

class ProfileCreditCardEdit extends StatelessWidget {
  const ProfileCreditCardEdit({super.key});

  @override
  Widget build(BuildContext context) {
    final profileCreditCardBloc = ProfileCreditCardBloc();
    final TextEditingController cardNumberController = TextEditingController();
    final TextEditingController cardDateController = TextEditingController();
    final TextEditingController cardCvvController = TextEditingController();
    final MaskTextInputFormatter cardMaskFormatter = MaskTextInputFormatter(
        mask: '####-####-####-####',
        filter: {"#": RegExp(r'[0-9]')},
        type: MaskAutoCompletionType.lazy);

    final MaskTextInputFormatter dateMaskFormatter = MaskTextInputFormatter(
        mask: '##/##',
        filter: {"#": RegExp(r'[0-9]')},
        type: MaskAutoCompletionType.lazy);

    final MaskTextInputFormatter cvvMaskFormatter = MaskTextInputFormatter(
        mask: '###',
        filter: {"#": RegExp(r'[0-9]')},
        type: MaskAutoCompletionType.lazy);

    return BlocProvider(
      create: (context) => ProfileCreditCardBloc(),
      child: Scaffold(
        floatingActionButton: Padding(
          padding: const EdgeInsets.only(left: 24, right: 24),
          child: Row(
            children: [
              Expanded(
                child:
                    BlocBuilder<ProfileCreditCardBloc, ProfileCreditCardState>(
                  bloc: profileCreditCardBloc,
                  builder: (context, state) {
                    if (state is ProfileCreditCardValidated) {
                      return ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          textStyle: const TextStyle(
                              fontSize: 24, fontFamily: "GT-Eesti-Pro-Display"),
                          backgroundColor: const Color.fromRGBO(97, 160, 69, 1),
                          foregroundColor: Colors.white,
                          elevation: 5.0,
                        ),
                        onPressed: () {
                          // profile.add(ProfileAddressRequestSave());
                        },
                        child: const Padding(
                          padding: EdgeInsets.symmetric(vertical: 16),
                          child: Text("Сохранить карту"),
                        ),
                      );
                    } else {
                      return ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          textStyle: const TextStyle(
                              fontSize: 24, fontFamily: "GT-Eesti-Pro-Display"),
                          backgroundColor:
                              const Color.fromRGBO(50, 50, 50, 0.89),
                          foregroundColor: Colors.white,
                          elevation: 5.0,
                        ),
                        onPressed: () {},
                        child: const Padding(
                          padding: EdgeInsets.symmetric(vertical: 16),
                          child: Text("Сохранить карту"),
                        ),
                      );
                    }
                  },
                ),
              ),
            ],
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        body: SafeArea(
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
                padding: EdgeInsets.only(bottom: 10, left: 25, right: 25),
                child: Text(
                  "Добавить карту",
                  style: TextStyle(
                    fontFamily: 'GT-Eesti-Pro-Display',
                    fontSize: 20,
                    fontWeight: FontWeight.w300,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
              const SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Container(
                  decoration: const BoxDecoration(
                    color: Color.fromRGBO(210, 239, 210, 1),
                    borderRadius: BorderRadius.all(
                      Radius.circular(10),
                    ),
                  ),
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: CardDataTextfield(
                          labelText: 'Номер карты',
                          maskFormatter: cardMaskFormatter,
                          controller: cardNumberController,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: Row(
                          children: [
                            Expanded(
                              child: CardDataTextfield(
                                labelText: 'Срок действия',
                                maskFormatter: dateMaskFormatter,
                                controller: cardDateController,
                              ),
                            ),
                            const SizedBox(width: 20),
                            Expanded(
                              child: CardDataTextfield(
                                labelText: 'CVV',
                                maskFormatter: cvvMaskFormatter,
                                controller: cardCvvController,
                              ),
                            )
                          ],
                        ),
                      ),
                      const SizedBox(height: 30)
                    ],
                  ),
                ),
              ),
              const Spacer()
            ],
          ),
        ),
      ),
    );
  }
}

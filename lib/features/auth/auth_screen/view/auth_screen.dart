import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tt_service/features/auth/auth_screen/bloc/auth_bloc.dart';
import 'package:tt_service/features/auth/auth_screen/widgets/auth_phone_number_textfield.dart';

// ignore: must_be_immutable
class AuthScreen extends StatelessWidget {
  AuthScreen({super.key});

  final _authBloc = AuthBloc();
  final TextEditingController _phoneController = TextEditingController();
  String unmaskedPhone = "";

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthBloc, AuthState>(
      bloc: _authBloc,
      listener: (context, state) {
        if (state is AuthPhoneSuccess) {
          Navigator.pushNamed(context, '/code-screen', arguments: {
            'phoneNumber': _phoneController.text,
            'unMaskedPhoneNumber': unmaskedPhone
          });
        }
      },
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: SafeArea(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 50),
                  child: Image.asset("assets/images/imgLogo2.png"),
                ),
                const Padding(
                  padding: EdgeInsets.only(bottom: 40),
                  child: Text(
                    "Введите свой номер телефона",
                    style: TextStyle(
                      fontFamily: 'GT-Eesti-Pro-Display',
                      fontSize: 20,
                      fontWeight: FontWeight.w300,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24),
                  child: PhoneNumberTextfield(
                    onChanged: (unmaskedNumber) => {
                      unmaskedPhone = unmaskedNumber,
                      _authBloc.add(AuthEventEditingPhone(phone: unmaskedPhone))
                    },
                    controller: _phoneController,
                  ),
                ),
                BlocBuilder<AuthBloc, AuthState>(
                  bloc: _authBloc,
                  builder: (context, state) {
                    if (state is AuthPhoneFail) {
                      return Padding(
                        padding: const EdgeInsets.only(top: 5),
                        child: Text(
                          state.errorMessage,
                          style: const TextStyle(color: Colors.red),
                        ),
                      );
                    } else {
                      return SizedBox.fromSize(size: null);
                    }
                  },
                ),
                const Spacer(),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 24),
                  child: Text(
                    "Вы получите на свой телефон сообщение с кодом, чтобы его подтвердить.",
                    style: TextStyle(
                      fontFamily: 'GT-Eesti-Pro-Display',
                      fontSize: 12,
                      fontWeight: FontWeight.w300,
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24),
                  child: RichText(
                    text: const TextSpan(
                      children: [
                        TextSpan(
                          text: 'Нажимая на кнопку, вы даете согласие на ',
                          style: TextStyle(
                              fontFamily: 'GT-Eesti-Pro-Display',
                              fontSize: 12,
                              fontWeight: FontWeight.w300,
                              color: Colors.black),
                        ),
                        TextSpan(
                          text: 'обработку персональных данных',
                          style: TextStyle(
                            fontFamily: 'GT-Eesti-Pro-Display',
                            fontSize: 12,
                            fontWeight: FontWeight.w300,
                            color: Color.fromRGBO(97, 160, 69, 1),
                          ),
                        ),
                        TextSpan(
                          text: ' и соглашаетесь с ',
                          style: TextStyle(
                              fontFamily: 'GT-Eesti-Pro-Display',
                              fontSize: 12,
                              fontWeight: FontWeight.w300,
                              color: Colors.black),
                        ),
                        TextSpan(
                          text: 'политикой конфиденциальности',
                          style: TextStyle(
                            fontFamily: 'GT-Eesti-Pro-Display',
                            fontSize: 12,
                            fontWeight: FontWeight.w300,
                            color: Color.fromRGBO(97, 160, 69, 1),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                Row(
                  children: [
                    const Padding(
                      padding: EdgeInsets.only(left: 24),
                    ),
                    Expanded(
                      child: BlocBuilder<AuthBloc, AuthState>(
                        bloc: _authBloc,
                        builder: (context, state) {
                          if (state is AuthStatePhoneWritten) {
                            return ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                textStyle: const TextStyle(
                                  fontSize: 24,
                                  fontFamily: "GT-Eesti-Pro-Display",
                                ),
                                backgroundColor:
                                    const Color.fromRGBO(97, 160, 69, 1),
                                foregroundColor: Colors.white,
                                elevation: 5.0,
                              ),
                              onPressed: () {
                                _authBloc.add(AuthEventSendCode(
                                    phone: _phoneController.text,
                                    unmaskedPhone: unmaskedPhone));
                              },
                              child: const Padding(
                                padding: EdgeInsets.symmetric(vertical: 16),
                                child: Text("Получить код"),
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
                                _authBloc.add(AuthEventSendCode(
                                    phone: _phoneController.text,
                                    unmaskedPhone: unmaskedPhone));
                              },
                              child: const Padding(
                                padding: EdgeInsets.symmetric(vertical: 16),
                                child: Text("Получить код"),
                              ),
                            );
                          }
                        },
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.only(right: 24),
                    ),
                  ],
                ),
                const SizedBox(height: 10)
              ],
            ),
          ),
        ),
      ),
    );
  }
}

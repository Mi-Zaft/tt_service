import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tt_service/features/auth/code_screen/bloc/auth_code_bloc.dart';

class CodeScreen extends StatelessWidget {
  const CodeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final _authCodeBloc = AuthCodeBloc();

    final Map<String, dynamic> args =
        ModalRoute.of(context)?.settings.arguments as Map<String, dynamic>;
    final String phoneNumber = args['phoneNumber'];
    final String unMaskedPhoneNumber = args['unMaskedPhoneNumber'];
    return BlocListener<AuthCodeBloc, AuthCodeState>(
      bloc: _authCodeBloc,
      listener: (context, state) {
        // TODO: implement listener
      },
      child: Scaffold(
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
              const Row(
                children: [
                  Padding(
                    padding: EdgeInsets.only(bottom: 10, left: 25, right: 25),
                    child: Text(
                      "Введите полученный код",
                      style: TextStyle(
                        fontFamily: 'GT-Eesti-Pro-Display',
                        fontSize: 20,
                        fontWeight: FontWeight.w300,
                      ),
                      textAlign: TextAlign.left,
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 0, left: 25),
                    child: Text(
                      "+7 $phoneNumber",
                      style: const TextStyle(
                        fontFamily: 'GT-Eesti-Pro-Display',
                        fontSize: 20,
                        fontWeight: FontWeight.w300,
                      ),
                      textAlign: TextAlign.left,
                    ),
                  ),
                ],
              ),
              const Spacer()
            ],
          ),
        ),
      ),
    );
  }
}

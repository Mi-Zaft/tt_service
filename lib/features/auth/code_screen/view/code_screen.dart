import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tt_service/features/auth/code_screen/bloc/auth_code_bloc.dart';
import 'package:tt_service/features/auth/code_screen/widgets/code_text_field.dart';

class CodeScreen extends StatefulWidget {
  const CodeScreen({Key? key}) : super(key: key);

  @override
  State<CodeScreen> createState() => _CodeScreen();
}

class _CodeScreen extends State<CodeScreen> {
  final double buttonHeight = 15; // Высота кнопок
  final double columnHorizontalPadding =
      24.0; // Отступы по бокам столбца кнопок
  final AuthCodeBloc _authCodeBloc = AuthCodeBloc();
  final _focus = FocusNode();
  final TextEditingController _codeTextFieldController =
      TextEditingController();
  bool isWrongCode = false;

  late List<TextEditingController> textControllers;
  late List<FocusNode> focusNodes;

  void _handleBoxPressed() {
    _focus.requestFocus();
  }

  void _controllerListener() {
    setState(() {});
  }

  @override
  void initState() {
    super.initState();

    _codeTextFieldController.addListener(_controllerListener);
  }

  @override
  void dispose() {
    _codeTextFieldController.removeListener(_controllerListener);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final code = _codeTextFieldController.text.padRight(6).split('');
    final Map<String, dynamic> args =
        ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;
    final String phoneNumber = args['phoneNumber'];
    final String unMaskedPhoneNumber = args['unMaskedPhoneNumber'];
    return BlocProvider(
      create: (BuildContext context) => AuthCodeBloc(),
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: BlocListener<AuthCodeBloc, AuthCodeState>(
          bloc: _authCodeBloc,
          listener: (context, state) => {
            if (state is AuthCodeRequestSuccessState)
              {
                Navigator.pushNamedAndRemoveUntil(
                    context, '/address-edit-screen', (route) => false)
              } else if (state is AuthCodeRequestFailState) {
                setState(() {
                  isWrongCode = true;
                })
              } else if (state is AuthCodeInitialState) {
                setState(() {
                  isWrongCode = false;
                })
              }
          },
          child: SafeArea(
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
                Offstage(
                  child: TextField(
                    focusNode: _focus,
                    controller: _codeTextFieldController,
                    onChanged: (value) => {
                      _authCodeBloc
                          .add(EditingCode(code: _codeTextFieldController.text))
                    },
                    autofocus: true,
                    keyboardType: TextInputType.number,
                    maxLength: 6,
                    inputFormatters: [
                      FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),
                    ],
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    BlocProvider.value(
                      value: _authCodeBloc,
                      child: Padding(
                        padding: EdgeInsets.only(
                          top: 12,
                          left: columnHorizontalPadding,
                          right: columnHorizontalPadding,
                        ),
                        child: Row(
                          children: [
                            Expanded(
                              child: CodeTextField(
                                onPressed: _handleBoxPressed,
                                value: code[0],
                                isWrong: isWrongCode,
                              ),
                            ),
                            const SizedBox(width: 5),
                            Expanded(
                              child: CodeTextField(
                                onPressed: _handleBoxPressed,
                                value: code[1],
                                isWrong: isWrongCode,
                              ),
                            ),
                            const SizedBox(width: 5),
                            Expanded(
                              child: CodeTextField(
                                onPressed: _handleBoxPressed,
                                value: code[2],
                                isWrong: isWrongCode,
                              ),
                            ),
                            const SizedBox(width: 5),
                            Expanded(
                              child: CodeTextField(
                                onPressed: _handleBoxPressed,
                                value: code[3],
                                isWrong: isWrongCode,
                              ),
                            ),
                            const SizedBox(width: 5),
                            Expanded(
                              child: CodeTextField(
                                onPressed: _handleBoxPressed,
                                value: code[4],
                                isWrong: isWrongCode,
                              ),
                            ),
                            const SizedBox(width: 5),
                            Expanded(
                              child: CodeTextField(
                                onPressed: _handleBoxPressed,
                                value: code[5],
                                isWrong: isWrongCode,
                              ),
                            ),
                          ],
                        ),
                      ),
                    )
                  ],
                ),
                Row(
                  children: [
                    BlocBuilder<AuthCodeBloc, AuthCodeState>(
                        bloc: _authCodeBloc,
                        builder: (context, state) {
                          if (state is AuthCodeRequestFailState ||
                              state is AuthCodeResendFailState) {
                            return Padding(
                              padding: const EdgeInsets.only(left: 25, top: 10),
                              child: Text(
                                state.errorMessage ?? '',
                                style: const TextStyle(
                                    color: Color.fromRGBO(255, 44, 44, 1),
                                    fontFamily: 'GT-Eesti-Pro-Display',
                                    fontSize: 12,
                                    fontWeight: FontWeight.w300),
                                textAlign: TextAlign.left,
                              ),
                            );
                          } else if (state is AuthCodeResendSuccessState) {
                            return const Padding(
                              padding: EdgeInsets.only(left: 25, top: 10),
                              child: Text(
                                'Код был успешно отправлен',
                                style: TextStyle(
                                    color: Color.fromRGBO(122, 122, 122, 1),
                                    fontFamily: 'GT-Eesti-Pro-Display',
                                    fontSize: 12,
                                    fontWeight: FontWeight.w300),
                                textAlign: TextAlign.left,
                              ),
                            );
                          } else {
                            return const SizedBox(
                              height: 27,
                            );
                          }
                        })
                  ],
                ),
                const SizedBox(height: 10),
                TextButton(
                  onPressed: () {
                    _authCodeBloc.add(
                        LoadingResendCode(unmaskedPhone: unMaskedPhoneNumber));
                  },
                  child: const Text(
                    'Отправить код повторно',
                    style: TextStyle(
                        color: Color.fromRGBO(56, 144, 208, 1),
                        fontFamily: 'GT-Eesti-Pro-Display',
                        fontSize: 12,
                        fontWeight: FontWeight.w300),
                  ),
                ),
                const Spacer(),
                Row(
                  children: [
                    const SizedBox(
                      width: 24,
                    ),
                    Expanded(
                      child: BlocBuilder<AuthCodeBloc, AuthCodeState>(
                        bloc: _authCodeBloc,
                        builder: (context, state) {
                          if (state is AuthCodeWrittenState) {
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
                                _authCodeBloc.add(
                                  LoadingConfirmCodeRequest(
                                    unMaskedPhone: unMaskedPhoneNumber,
                                    code: _codeTextFieldController.text,
                                  ),
                                );
                              },
                              child: const Padding(
                                padding: EdgeInsets.symmetric(vertical: 16),
                                child: Text("Войти"),
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
                              onPressed: () {},
                              child: const Padding(
                                padding: EdgeInsets.symmetric(vertical: 16),
                                child: Text("Войти"),
                              ),
                            );
                          }
                        },
                      ),
                    ),
                    const SizedBox(
                      width: 24,
                    )
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

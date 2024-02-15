import 'package:flutter/material.dart';
import 'package:tt_service/router/router.dart';
import 'package:tt_service/theme/theme.dart';

class TTServiceApp extends StatelessWidget {
  const TTServiceApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Мусор заберу",
      theme: classicTheme,
      routes: routes,
    );
  }
}

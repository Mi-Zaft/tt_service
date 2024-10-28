import 'package:flutter/material.dart';
import 'package:tt_service/tt_service_app.dart';
import 'package:provider/provider.dart';
import 'package:tt_service/models/user_data_provider.dart';

void main() {
  runApp(ChangeNotifierProvider(
    create: (context) => UserDataProvider(),
    child: const TTServiceApp(),
    )
  );
}
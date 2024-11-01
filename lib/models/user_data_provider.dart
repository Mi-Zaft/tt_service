import 'package:flutter/material.dart';
import 'user_data.dart';

class UserDataProvider extends ChangeNotifier {
  UserData? _userData;

  UserData? get userData => _userData;

  void setUserData(UserData data) {
    _userData = data;
    notifyListeners();
  }

  void clearUserData() {
    _userData = null;
    notifyListeners();
  }
}
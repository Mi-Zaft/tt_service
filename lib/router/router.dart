import 'package:tt_service/features/auth/auth_screen.dart/view/auth_screen.dart';
import 'package:tt_service/features/auth/check_auth/view/check_auth_screen.dart';
import 'package:tt_service/features/auth/first_screen/view/auth_first_screen.dart';

final routes = {
  '/': (context) => const CheckAuthScreen(),
  '/first-screen': (context) => const AuthFirstScreen(),
  '/auth-screen': (context) => AuthScreen()
};

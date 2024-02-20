import 'package:tt_service/features/auth/auth_screen/view/auth_screen.dart';
import 'package:tt_service/features/auth/check_auth/view/check_auth_screen.dart';
import 'package:tt_service/features/auth/code_screen/view/code_screen.dart';
import 'package:tt_service/features/auth/first_screen/view/auth_first_screen.dart';

final routes = {
  '/': (context) => const CheckAuthScreen(),
  '/first-screen': (context) => const AuthFirstScreen(),
  '/auth-screen': (context) => AuthScreen(),
  '/code-screen': (context) => const CodeScreen(),
};

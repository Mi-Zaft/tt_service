import 'package:tt_service/features/auth/auth_screen/view/auth_screen.dart';
import 'package:tt_service/features/auth/check_auth/view/check_auth_screen.dart';
import 'package:tt_service/features/auth/code_screen/view/code_screen.dart';
import 'package:tt_service/features/auth/first_screen/view/auth_first_screen.dart';
import 'package:tt_service/features/main/choose_bags_count/view/choose_bags_count_screen.dart';
import 'package:tt_service/features/main/main_menu/view/main_menu_screen.dart';
import 'package:tt_service/features/profile/address/views/profile_address_edit.dart';
import 'package:tt_service/features/profile/credit_card/views/profile_credit_card_edit.dart';
import 'package:tt_service/features/main/order_history/view/order_history_screen.dart';
import 'package:tt_service/features/profile/my_profile_screen/view/my_profile_screen.dart';
import 'package:tt_service/features/profile/profile_editor/overview.dart';

final routes = {
  '/': (context) => const CheckAuthScreen(),
  '/first-screen': (context) => const AuthFirstScreen(),
  '/auth-screen': (context) => AuthScreen(),
  '/code-screen': (context) => const CodeScreen(),
  '/address-edit-screen': (context) => const  ProfileAddressEdit(),
  '/edit-credit-card': (context) => const ProfileCreditCardEdit(),
  '/bags-count-screen': (context) => const ChooseBagsCountScreen(),
  '/main-menu-screen': (context) => const MainMenuScreen(),
  '/order-history-screen': (context) => const OrderHistoryScreen(),
  '/my-profile-screen': (context) => const MyProfileScreen()
};

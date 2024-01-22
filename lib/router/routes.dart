import 'package:start_app/features/crypto_list/crypto_list.dart';
import 'package:start_app/router/LoginPage.dart';

final routes = {
  "/": (context) => const LoginPage(title: 'Log in',),
  "/coinList": (context) => const MainPageApp(),
  "/coin" : (context) => const CryptoCoinScreen()
};
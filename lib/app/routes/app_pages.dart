import 'package:get/get.dart';
import 'package:kiosk_app/app/modules/language/view/language_view.dart';
import 'package:kiosk_app/app/modules/splash/view/splash.dart';
import 'package:kiosk_app/app/modules/start_order/view/start_order.dart';

import '../modules/home/bindings/home_binding.dart';
import '../modules/home/views/home_view.dart';
import '../modules/login/bindings/login_binding.dart';
import '../modules/login/views/login_view.dart';
import '../modules/select_terminal/bindings/select_terminal_binding.dart';
import '../modules/select_terminal/views/select_terminal_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.HOME;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => const HomeView(),
      binding: HomeBinding(),
      children: [
        GetPage(
          name: _Paths.HOME,
          page: () => const HomeView(),
          binding: HomeBinding(),
        ),
      ],
    ),
    GetPage(
      name: _Paths.LOGIN,
      page: () => const LoginView(),
      binding: LoginBinding(),
    ),
    GetPage(
      name: _Paths.SELECT_TERMINAL,
      page: () => const SelectionTerminalView(),
      binding: SelectTerminalBinding(),
    ),
    GetPage(name: _Paths.SPLASH, page: () => const SplashView()),
    GetPage(name: _Paths.START_ORDER, page: () => const StartOrderView()),
    GetPage(name: _Paths.LANGUAGE, page: () => const LanguageView()),
  ];
}

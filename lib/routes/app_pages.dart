import 'package:fident_app/core/bindings/login_binding.dart';
import 'package:fident_app/core/bindings/main_binding.dart';
import 'package:fident_app/main/main_page.dart';
import 'package:fident_app/main/splash_screen.dart';
import 'package:fident_app/page/auth/login/login_page.dart';
import 'package:fident_app/page/auth/login/login_page_success.dart';
import 'package:fident_app/page/auth/register/register_page.dart';
import 'package:fident_app/page/auth/register/register_page_success.dart';
import 'package:get/get.dart';

class AppPages {
  static const initial = Routes.splash;

  static final routes = [
    GetPage(name: Routes.splash, page: () => SplashScreen()),
    GetPage(
      name: Routes.login,
      page: () => LoginPage(),
      binding: LoginBinding(),
    ),
    GetPage(name: Routes.loginSuccess, page: () => const LoginSuccessPage()),
    GetPage(
      name: Routes.register,
      page: () => RegisterPage(),
      binding: LoginBinding(),
    ),
    GetPage(name: Routes.registerSuccess, page: () => RegisterSuccessPage()),
    GetPage(
      name: Routes.mainPage,
      page: () => const MainPage(),
      participatesInRootNavigator: true,
      binding: MainBinding(),
    ),
  ];
}

class Routes {
  static const splash = '/splash';
  static const login = '/login';
  static const loginSuccess = '/login-success';
  static const register = '/register';
  static const registerSuccess = '/register-success';
  static const mainPage = '/main';
}

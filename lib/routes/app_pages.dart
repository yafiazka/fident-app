import 'package:fident_app/main/main_page.dart';
import 'package:fident_app/main/splash_screen.dart';
import 'package:fident_app/page/auth/bindings/login_binding.dart';
import 'package:fident_app/page/auth/bindings/register_binding.dart';
import 'package:fident_app/page/auth/pages/login_page.dart';
import 'package:fident_app/page/auth/pages/login_page_success.dart';
import 'package:fident_app/page/auth/pages/register_page.dart';
import 'package:fident_app/page/auth/pages/register_page_success.dart';
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
      binding: RegisterBinding(),
    ),
    GetPage(name: Routes.registerSuccess, page: () => RegisterSuccessPage()),
    GetPage(name: Routes.mainPage, page: () => MainPage()),
  ];
}

class Routes {
  static const splash = '/splash';
  static const login = '/login';
  static const loginSuccess = '/login-success';
  static const register = '/register';
  static const registerSuccess = '/register-success';
  static const mainPage = '/main-page';
}

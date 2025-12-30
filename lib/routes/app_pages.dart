import 'package:fident_app/core/bindings/login_binding.dart';
import 'package:fident_app/core/bindings/main_binding.dart';
import 'package:fident_app/core/bindings/register_binding.dart';
import 'package:fident_app/core/controller/attendance_controller.dart';
import 'package:fident_app/main/main_page.dart';
import 'package:fident_app/main/splash_screen.dart';
import 'package:fident_app/page/attendance/attendance_scan_page.dart';
import 'package:fident_app/page/attendance/attendance_scan_success.dart';
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
      binding: RegisterBinding(),
    ),

    // GetPage(
    //   name: "/face-register",
    //   page: () => const FaceRegisterPage(),
    //   binding: FaceRegisterBinding(),
    // ),
    GetPage(name: Routes.registerSuccess, page: () => RegisterSuccessPage()),

    GetPage(
      name: Routes.mainPage,
      page: () => const MainPage(),
      binding: MainBinding(),
    ),

    GetPage(
      name: Routes.attendanceScan,
      page: () => const AttendanceScanPage(),
      binding: BindingsBuilder(() {
        Get.put(AttendanceController());
      }),
    ),
    GetPage(
      name: Routes.attendanceSuccess,
      page: () => AttendanceSuccessPage(),
    ),
  ];
}

class Routes {
  static const splash = '/splash';
  static const login = '/login';
  static const loginSuccess = '/login-success';
  static const register = '/register';
  static const registerFace = '/register-face';
  static const registerSuccess = '/register-success';
  static const mainPage = '/main';
  static const attendanceScan = '/attendance/scan';
  static const attendanceSuccess = '/attendance/success';
  static const attendanceHistory = '/attendance/history';
}

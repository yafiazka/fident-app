import 'package:fident_app/core/controller/face_register_controller.dart';
import 'package:get/get.dart';

class FaceRegisterBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => FaceRegisterController());
  }
}

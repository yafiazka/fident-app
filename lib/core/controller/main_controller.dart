import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class MainController extends GetxController {
  final firestore = FirebaseFirestore.instance;
  final box = GetStorage();

  RxString name = "".obs;
  RxString role = "".obs;

  RxInt tabIndex = 0.obs;

  @override
  void onInit() {
    super.onInit();
    loadUser();
  }

  Future<void> loadUser() async {
    String? uid = box.read("uid");

    if (uid == null) {
      Get.offAllNamed("/login");
      return;
    }

    final doc = await firestore.collection("users").doc(uid).get();

    if (doc.exists) {
      name.value = doc["name"];
      role.value = doc["role"];
    }
  }

  void changeTab(int index) {
    tabIndex.value = index;
  }
}

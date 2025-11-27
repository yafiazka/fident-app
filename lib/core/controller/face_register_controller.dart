import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class FaceRegisterController extends GetxController {
  final _picker = ImagePicker();

  Rx<File?> faceFile = Rx<File?>(null);
  RxBool isLoading = false.obs;

  Future<void> pickCamera() async {
    final x = await _picker.pickImage(source: ImageSource.camera);
    if (x != null) faceFile.value = File(x.path);
  }

  Future<void> pickGallery() async {
    final x = await _picker.pickImage(source: ImageSource.gallery);
    if (x != null) faceFile.value = File(x.path);
  }

  Future<void> saveFace(String uid) async {
    if (faceFile.value == null || !faceFile.value!.existsSync()) {
      Get.snackbar("Error", "Silakan ambil foto terlebih dahulu");
      return;
    }

    isLoading.value = true;

    try {
      final fileName = "face_${DateTime.now().millisecondsSinceEpoch}.jpg";
      final ref = FirebaseStorage.instance.ref().child("faces/$uid/$fileName");

      await ref.putFile(faceFile.value!);
      final url = await ref.getDownloadURL();

      await FirebaseFirestore.instance.collection("users").doc(uid).update({
        "face_url": url,
        "face_registered": true,
      });

      Get.offAllNamed("/register-success");
    } catch (e) {
      Get.snackbar("Upload Error", e.toString());
    } finally {
      isLoading.value = false;
    }
  }
}

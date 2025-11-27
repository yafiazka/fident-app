import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class MainController extends GetxController {
  final firestore = FirebaseFirestore.instance;
  final box = GetStorage();

  RxString name = "".obs;
  RxString role = "".obs;
  RxString email = "".obs;
  RxString uid = "".obs;
  RxString faceBase64 = "".obs;

  RxInt tabIndex = 0.obs;

  @override
  void onInit() {
    super.onInit();
    loadUser();
  }

  Future<void> loadUser() async {
    final box = GetStorage();
    final storedUid = box.read("uid");

    if (storedUid == null || storedUid == "") {
      Get.offAllNamed("/login");
      return;
    }

    uid.value = storedUid;

    final doc = await FirebaseFirestore.instance
        .collection("users")
        .doc(uid.value)
        .get();

    if (doc.exists) {
      name.value = doc["name"];
      email.value = doc["email"];
      role.value = doc["role"];
      faceBase64.value = doc["face_base64"];
    }
  }

  void changeTab(int index) {
    tabIndex.value = index;
  }

  RxList<Map<String, dynamic>> history = <Map<String, dynamic>>[].obs;

  Stream<List<Map<String, dynamic>>> streamHistory() {
    final uid = FirebaseAuth.instance.currentUser!.uid;

    return firestore
        .collection("attendance")
        .doc(uid)
        .collection("history")
        .orderBy("timestamp", descending: true)
        .snapshots()
        .map((snapshot) {
          return snapshot.docs.map((doc) {
            final data = doc.data();
            final date = (data["timestamp"] as Timestamp).toDate();
            final day =
                "${_weekday(date.weekday)} (${date.day} ${_month(date.month)} ${date.year})";
            final time = _formatTime(date);

            return {
              "title": data["title"] ?? "Attendance",
              "day": day,
              "time": time,
              "similarity": data["similarity"]?.toStringAsFixed(1) ?? "-",
            };
          }).toList();
        });
  }

  String _weekday(int w) {
    const list = [
      "Monday",
      "Tuesday",
      "Wednesday",
      "Thursday",
      "Friday",
      "Saturday",
      "Sunday",
    ];
    return list[w - 1];
  }

  String _month(int m) {
    const months = [
      "January",
      "February",
      "March",
      "April",
      "May",
      "June",
      "July",
      "August",
      "September",
      "October",
      "November",
      "December",
    ];
    return months[m - 1];
  }

  String _formatTime(DateTime d) {
    return "${d.hour.toString().padLeft(2, "0")}:${d.minute.toString().padLeft(2, "0")}";
  }
}

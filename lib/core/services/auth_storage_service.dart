import 'package:firebase_auth/firebase_auth.dart';
import 'package:get_storage/get_storage.dart';

class AuthStorageService {
  final box = GetStorage();
  final _key = "user_session";

  void saveUser(String uid) {
    box.write(_key, uid);
  }

  String? getUser() {
    return box.read(_key);
  }

  bool get isLoggedIn {
    final uid = getUser();
    final firebaseUser = FirebaseAuth.instance.currentUser;
    return uid != null && firebaseUser != null;
  }

  void clear() {
    box.remove(_key);
    FirebaseAuth.instance.signOut();
  }
}

final authStorage = AuthStorageService();

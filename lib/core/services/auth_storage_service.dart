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

  void clear() {
    box.remove(_key);
  }

  bool get isLoggedIn => getUser() != null;
}

final authStorage = AuthStorageService();

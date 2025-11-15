class UserModel {
  String uid;
  String email;
  DateTime createdAt;

  UserModel({required this.uid, required this.email, required this.createdAt});

  Map<String, dynamic> toJson() => {
    "uid": uid,
    "email": email,
    "created_at": createdAt.toIso8601String(),
  };
}

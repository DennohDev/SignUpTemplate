class AppUser {
  final String uid;
  final String email;

  AppUser({required this.uid, required this.email});

  // Convert appuser into json
  Map<String, dynamic> toJson() {
    return {'uid': uid, 'email': email};
  }

  // Convert  json to appuser

  factory AppUser.fromJson(Map<String, dynamic> jsonUser) {
    return AppUser(uid: jsonUser['uid'], email: jsonUser['email']);
  }
}

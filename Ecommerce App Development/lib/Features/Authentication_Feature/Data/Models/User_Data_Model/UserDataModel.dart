// ignore_for_file: file_names

class UserData {
  late String username;
  late String email;
  late String uid;
  late String phone;
  late String profileURL;

  UserData({required this.email, required this.username, required this.phone, required this.uid, required this.profileURL});

  factory UserData.fromFireStore(dynamic data) {
    return UserData(email: data['email'], username: data['username'], phone: data['phone'], uid: data['uid'], profileURL: data['profileURL']);
  }

  Map<String, dynamic> toMap() {
    return {
      'email': email,
      'username': username,
      'phone': phone,
      'uid': uid,
      'profileURL': profileURL,
    };
  }
}

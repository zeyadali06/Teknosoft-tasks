// ignore_for_file: file_names

class LoginData {
  String? username;
  String? email;
  final String password;
  bool usingUserName = false;
  bool usingemail = false;

  LoginData({required String usernameOrEmail, required this.password}) {
    if (usernameOrEmail.contains('@') && usernameOrEmail.contains('.')) {
      email = usernameOrEmail;
      usingemail = true;
    } else {
      username = usernameOrEmail;
      usingUserName = true;
    }
  }

  Map<String, dynamic> toMap() {
    if (usingUserName) {
      return {"username": username, "password": password};
    } else {
      return {"email": email, "password": password};
    }
  }
}

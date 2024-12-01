class SignUpData {
  SignUpData({required this.username, required this.email, required this.phone, required this.password});

  final String username;
  final String email;
  final String phone;
  final String password;

  Map<String, dynamic> toMap() {
    return {"username": username, "email": email, "phone": phone, "password": password};
  }
}

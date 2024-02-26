class User {
  String address;
  String phone;
  String token;

  User({required this.address, required this.phone, required this.token});

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      address: json['address'],
      phone: json['phone'],
      token: json['token'],
    );
  }
}
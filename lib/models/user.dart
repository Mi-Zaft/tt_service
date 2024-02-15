class User {
  String name;
  String address;
  String phone;

  User({required this.name, required this.address, required  this.phone});

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      name: json['name'],
      address: json['address'],
      phone: json['phone']
    );
  }
}
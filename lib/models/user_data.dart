class UserData {
  final String id;
  final String name;
  final String entrance;
  final String floor;
  final String apartment;
  final String comment;
  final String intercom;

  UserData({
    required this.id,
    required this.name,
    required this.entrance,
    required this.floor,
    required this.apartment,
    required this.comment,
    required this.intercom,
  });

  factory UserData.fromJson(Map<String, dynamic> json) {
    return UserData(
      id: json['id'] ?? '',
      name: json['name'] ?? '',
      entrance: json['entrance'] ?? '',
      floor: json['floor'] ?? '',
      apartment: json['apartment'] ?? '',
      comment: json['comment'] ?? '',
      intercom: json['intercom'] ?? '',
    );
  }
}
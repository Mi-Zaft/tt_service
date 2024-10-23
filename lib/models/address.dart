class Address {
  String? id;
  int? entrance;
  int? floor;
  int? apartment;
  String? intercom;
  String? comment;
}

class AddressApi {
  final String address;
  final String addressId;

  AddressApi({required this.address, required this.addressId});

  factory AddressApi.fromJson(Map<String, dynamic> json) {
    return AddressApi(
      address: json['name'],
      addressId: json['id'],
    );
  }
}

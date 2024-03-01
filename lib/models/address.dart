class Address {
  String? id;
  String? name;
  int? entrance;
  int? floor;
  int? apartment;
  String? intercom;
  String? comment;

  // Address({
  //   this.name,
  //   this.entrance,
  //   this.floor,
  //   this.apartment,
  //   this.intercom,
  //   this.comment,
  // });
}

class AddressApi {
  final String address;
  final String addressId;

  AddressApi({required this.address, required this.addressId});

  factory AddressApi.fromJson(Map<String, dynamic> json) {
    return AddressApi(
      address: json['address'],
      addressId: json['addressId'],
    );
  }
}

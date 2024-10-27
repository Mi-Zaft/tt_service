class Address {
  String? id;
  String? name;
  String? entrance;
  String? floor;
  String? apartment;
  String? intercom;
  String? comment;

  Future<Map<String, dynamic>> toJson() async {
    return {
      "id": this.id,
      "name": this.name,
      "entrance": this.entrance,
      "floor": this.floor,
      "apartment": this.apartment,
      "intercom": this.intercom,
      "comment": this.comment,
    };
  }
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



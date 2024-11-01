import 'package:flutter/material.dart';
import 'package:tt_service/features/profile/address/bloc/profile_address_bloc.dart';

class AddressField extends StatefulWidget {
  final String? addressName;
  final String? apartmentName;

  const AddressField({
    Key? key,
    required this.addressName,
    required this.apartmentName,
  }) : super(key: key);

  @override
  _AddressFieldState createState() => _AddressFieldState();
}

class _AddressFieldState extends State<AddressField> {
  String? getAddress;
  String? getApartment;

  late String address;
  late String apartment;

  @override
  void initState() {
    super.initState();

    // Предполагается, что ProfileAddressBloc предоставляет текущий адрес
    getAddress = ProfileAddressBloc.getAddress;
    getApartment = ProfileAddressBloc.getApartment;

    if (getAddress == null || getAddress!.isEmpty || getApartment == null || getApartment!.isEmpty) {
      address = widget.addressName ?? '';
      apartment = widget.apartmentName ?? '';
    } else {
      address = getAddress!;
      apartment = getApartment ?? '';
    }
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.pushNamedAndRemoveUntil(
          context,
          '/address-edit-screen',
              (route) => false,
        );
      },
      child: Container(
        padding: EdgeInsets.fromLTRB(0, 16, 0, 16), // Добавил отступы для улучшения UI
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            // Проверяем, есть ли адрес и квартира
            if (address.isNotEmpty && apartment.isNotEmpty)
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Адрес',
                    style: TextStyle(
                      color: Color(0xFF7A7A7A),
                      fontSize: 18,
                      fontFamily: 'GT-Eesti-Pro-Display',
                      fontWeight: FontWeight.w300,
                    ),
                  ),
                  SizedBox(height: 4.0),
                  Text(
                    '$address, кв. $apartment',
                    style: TextStyle(
                      color: Color(0xFF000000),
                      fontSize: 18,
                      fontFamily: 'GT-Eesti-Pro-Display',
                      fontWeight: FontWeight.w300,
                    ),
                  ),
                ],
              )
            else
              Text(
                'Адрес не указан',
                style: TextStyle(
                  color: Color(0xFF7A7A7A),
                  fontSize: 18,
                  fontFamily: 'GT-Eesti-Pro-Display',
                  fontWeight: FontWeight.w300,
                ),
              ),
            Icon(Icons.arrow_forward_ios),
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';

class AddressSuggest extends StatelessWidget {
  final String address;
  final String addressId;
  final Function(String, String) onTap;
  const AddressSuggest({
    super.key,
    required this.address,
    required this.addressId,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        children: [
          const SizedBox(
            height: 20,
          ),
          GestureDetector(
            onTap: () => {onTap(addressId, address)},
            child: Row(
              children: [
                Image.asset(
                  "assets/images/iconpoint.png",
                  height: 20,
                  width: 20,
                ),
                const SizedBox(
                  width: 10,
                ),
                Text(
                  address,
                  style: const TextStyle(
                      fontFamily: "GT-Eesti-Pro-Display",
                      fontSize: 18,
                      fontWeight: FontWeight.w300),
                )
              ],
            ),
          ),
          const Divider()
        ],
      ),
    );
  }
}

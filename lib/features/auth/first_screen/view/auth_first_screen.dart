import 'package:flutter/material.dart';

class AuthFirstScreen extends StatelessWidget {
  const AuthFirstScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          children: [
            Expanded(
              child: Image.asset(
                "assets/images/imgLogo.png",
                width: 180,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 24, right: 24, bottom: 50),
              child: Row(
                children: [
                  Expanded(
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        textStyle: const TextStyle(
                            fontSize: 24, fontFamily: "GT-Eesti-Pro-Display"),
                        backgroundColor: const Color.fromRGBO(50, 50, 50, 0.89),
                        foregroundColor: Colors.white,
                        elevation: 5.0,
                      ),
                      onPressed: () {
                        Navigator.pushNamedAndRemoveUntil(
                            context, '/auth-screen', (route) => false);
                      },
                      child: const Padding(
                        padding: EdgeInsets.symmetric(vertical: 16),
                        child: Text("Вход"),
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

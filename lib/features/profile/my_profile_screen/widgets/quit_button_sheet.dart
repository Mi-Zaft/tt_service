import 'package:flutter/material.dart';

class QuitButtonSheet extends StatelessWidget {
  const QuitButtonSheet({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(25),
          topRight: Radius.circular(25),
        ),
      ),
      height: 300,
      width: MediaQuery.sizeOf(context).width,
      child: Column(
        children: [
          const SizedBox(
            height: 36,
          ),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 64),
            child: Center(
              child: Text(
                'Вы уверены, что хотите выйти из своего профиля?',
                style: TextStyle(
                  fontFamily: 'GT-Eesti-Pro-Display',
                  fontSize: 20,
                  fontWeight: FontWeight.w300,
                ),
              ),
            ),
          ),
          const SizedBox(height: 12),
        Padding(
          padding: const EdgeInsets.fromLTRB(36, 16, 36, 8),
          child: InkWell(
          onTap: () {},
          child: AspectRatio(
            aspectRatio: 19 / 3,
            child: Container(
              decoration: BoxDecoration(
                color: Color(0xFFBAE7BA),
                borderRadius: BorderRadius.circular(10),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.2),
                    blurRadius: 15,
                    spreadRadius: 1,
                  ),
                ],
              ),
              child: Center(
                  child: Text('Выйти',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Color(0xFF505050),
                      fontSize: 20,
                      fontFamily: 'GT-Eesti-Pro-Display',
                      fontWeight: FontWeight.w300,
                    ),
                  )
              ),
            ),
          ),
          ),
        ),
          Padding(
            padding: const EdgeInsets.fromLTRB(35, 16, 35, 8),
            child: InkWell(
              onTap: () {},
              child: AspectRatio(
                aspectRatio: 19 / 3,
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.2),
                        blurRadius: 15,
                        spreadRadius: 1,
                      ),
                    ],
                  ),
                  child: Center(
                      child: Text('Отмена',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Color(0xFF505050),
                          fontSize: 20,
                          fontFamily: 'GT-Eesti-Pro-Display',
                          fontWeight: FontWeight.w300,
                        ),
                      )
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';

class TakeOutTheTrash extends StatelessWidget {
  const TakeOutTheTrash({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(24.0),
      child: AspectRatio(
        aspectRatio: 16 / 6, // Пропорции контейнера (ширина/высота)
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.2),
                blurRadius: 10,
                spreadRadius: 1,
              ),
            ],
          ),
          child: Stack(
            children: [
              // Изображение слева
              Align(
                alignment: Alignment(-1, -0),
                child: FractionallySizedBox(
                  widthFactor: 0.8, // Ширина 60% от контейнера
                  heightFactor: 0.9, // Высота 80% от контейнера
                  child: Container(
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage(
                            "assets/images/imgTakeOut.png"),
                        fit: BoxFit.fill,
                      ),
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
              ),
              // Заголовок
              Align(
                alignment: Alignment(0.7, -0.8),
                child: Text(
                  'Вынос мусора',
                  style: TextStyle(
                    color: Color(0xFF596D5C),
                    fontSize: 24,
                    fontFamily: 'GT-Eesti-Pro-Display',
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              // Цена
              Align(
                alignment: Alignment(0.9, 0.9),
                child: Text(
                  'от 130₽',
                  style: TextStyle(
                    color: Color(0xFF1A7D2A),
                    fontSize: 20,
                    fontFamily: 'GT-Eesti-Pro-Display',
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

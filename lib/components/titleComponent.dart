import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TitleComponent extends StatefulWidget {
  const TitleComponent({super.key});

  @override
  State<TitleComponent> createState() => _TitleComponentState();
}

class _TitleComponentState extends State<TitleComponent> {

  static const Color orangeColor = Color.fromRGBO(225, 101, 46, 0.81);
  static const Color orangeColorLight = Color.fromRGBO(225, 101, 46, 0.50);
  static const Color greyColor = Color.fromRGBO(136, 178, 164, 100);
  static const Color breakWhite = Color(0xFFF5F5F5);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(15.0),
          child: Container(
            decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                    color: Colors.black.withOpacity(0.3),
                    spreadRadius: 3,// Étendue de l'ombre vers l'extérieur
                    blurRadius: 12,// Flou de l'ombre
                    offset: Offset(1, 5)// Déplacement de l'ombre (horizontal, vertical)
                )
              ],
              color: breakWhite,
              border: Border.all(
                color: orangeColorLight,
                width: 3,
              ),
              //borderRadius: BorderRadius.circular(50),
            ),
            child: Padding(
              padding: const EdgeInsets.all(5.0), // This padding controls the space between the two borders
              child: Container(
                decoration: BoxDecoration(
                  border: Border.all(
                    color: orangeColorLight, // Inner border color
                    width: 4,
                  ),
                  //borderRadius: BorderRadius.circular(50),
                ),
                child: const Center(
                  child: Padding(
                    padding: EdgeInsets.all(10.0),
                    child: Text(
                      'Pand\'Orga',
                      style: TextStyle(fontSize: 60,
                          color: orangeColor,
                          fontFamily: 'billabong',
                          fontWeight: FontWeight.w500
                      ),
                    ),
                  ),
                ),
              ),
            ),
          )
          ,
        )
      ],
    );
  }
}

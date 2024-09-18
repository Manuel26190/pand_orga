import 'package:flutter/material.dart';
import 'package:pand_orga/components/dateNow.dart';
import 'package:pand_orga/components/footerBanner.dart';
import 'package:pand_orga/components/header.dart';
import 'package:pand_orga/components/titleComponent.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: "Pand'orga",
      home: MyHomePage(title: "Pand'orga"),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  static const Color orangeColor = Color.fromRGBO(225, 101, 46, 0.81);
  static const Color greyColor = Color.fromRGBO(136, 178, 164, 100);
  static const Color greenColor = Color.fromRGBO(147, 184, 169, 1);
  static const Color pastelGreen = Color(0xFFE6F4EA);
  static const Color lightGrey = Color(0xFFECEFF1);
  static const Color lightBlue = Color(0xFFE0F7FA);
  static const Color cream = Color(0xFFFFF1E6);
  static const Color breakWhite = Color(0xFFF5F5F5);
  static const Color darkGreyColor = Color.fromRGBO(
      67, 103, 90, 0.4823529411764706);
  static const Color orangeColorLight = Color.fromRGBO(225, 101, 46, 0.70);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: lightBlue,
      body: SafeArea(
        child: Column(
          children: [
            //const Header(),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                    color: Colors.transparent, // Couleur de fond du container si nécessaire

                    child: Image.asset(
                      'assets/image_header_2.png',
                      color: orangeColorLight, // Couleur que tu veux appliquer à l'image
                      colorBlendMode: BlendMode.modulate, // Mode de fusion pour appliquer la couleur
                    ),
                  ),

                  const TitleComponent(),
                  Container(
                    width: MediaQuery.of(context).size.width * 0.90,
                    child: Image.asset('assets/panda-agenda.jpg'),
                    decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                            color: Colors.black.withOpacity(0.3),
                            spreadRadius: 3,
                            // Étendue de l'ombre vers l'extérieur
                            blurRadius: 12,
                            // Flou de l'ombre
                            offset: Offset(1,
                                5) // Déplacement de l'ombre (horizontal, vertical)
                            )
                      ],
                    ),
                  ),
                  const DateNow(),
                ],
              ),
            ),
            const FooterBanner(),
          ],
        ),
      ),
    );
  }
}

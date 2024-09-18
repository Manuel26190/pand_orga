import 'package:flutter/material.dart';
import 'package:pand_orga/main.dart';
import 'package:pand_orga/pages/notePage.dart';

class Header extends StatefulWidget {
  const Header({super.key});

  @override
  State<Header> createState() => _HeaderState();
}

class _HeaderState extends State<Header> {
  static const Color orangeColor = Color.fromRGBO(225, 101, 46, 0.81);
  static const Color greyColor = Color.fromRGBO(136, 178, 164, 100);
  static const Color darkGreyColor = Color.fromRGBO(
      246, 72, 0, 0.5843137254901961);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          //height: 70,
          color: orangeColor,
          width: double.infinity,
        )
      ],
    );
  }
}

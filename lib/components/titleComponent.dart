import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TitleComponent extends StatefulWidget {
  const TitleComponent({super.key});

  @override
  State<TitleComponent> createState() => _TitleComponentState();
}

class _TitleComponentState extends State<TitleComponent> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(15.0),
          child: Container(
            decoration: BoxDecoration(
                border: Border.all(
                  color: const Color.fromRGBO(225, 101, 46, 0.81),
                  width: 10,
                ),
                borderRadius: BorderRadius.circular(10)),
            height: 120,
            child: const Center(
              child: Text(
                "Pand'Orga",
                style: TextStyle(
                  fontSize: 50,
                  color: Colors.blueGrey,
                ),
              ),
            ),
          ),
        )
      ],
    );
  }
}

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


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            const Header(),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  const TitleComponent(),
                  Image.asset('assets/panda-agenda.jpg'),
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


// children: [
// const Flexible(
// flex: 1,
// child: Header(),
// ),
// const Flexible(
// flex: 1,
// child: TitleComponent(),
// ),
// Flexible(
// flex: 1,
// child: Image.asset('assets/panda-agenda.jpg'),
// ),
// const Flexible(
// flex: 1,
// child: DateNow(),
// ),
// const Flexible(
// flex: 1,
// child: FooterBanner(),
// ),
// ],
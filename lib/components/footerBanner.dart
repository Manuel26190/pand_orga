import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pand_orga/pages/calendarPage.dart';

class FooterBanner extends StatefulWidget {
  const FooterBanner({super.key});

  @override
  State<FooterBanner> createState() => _FooterBannerState();
}

class _FooterBannerState extends State<FooterBanner> {
  static const Color mySecondColor = Color.fromRGBO(136, 178, 164, 100);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
            color: mySecondColor,
            height: 118,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    GestureDetector(
                        // onTap: () {
                        //   Navigator.push(
                        //     context,
                        //     MaterialPageRoute(
                        //         builder: (context) => const CalendarPage()),
                        //   );
                        // },
                        child: const Image(
                      image: AssetImage('assets/plus.png'),
                      fit: BoxFit.cover,
                      height: 40,
                    )),
                    Text('Ajouter'),
                  ],
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const CalendarPage()),
                          );
                        },
                        child: const Image(
                          image: AssetImage('assets/calendar.png'),
                          fit: BoxFit.cover,
                          height: 40,
                        )),
                    Text('Calendrier'),
                  ],
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    GestureDetector(
                        // onTap: () {
                        //   Navigator.push(
                        //     context,
                        //     MaterialPageRoute(
                        //         builder: (context) => const CalendarPage()),
                        //   );
                        // },
                        child: const Image(
                      image: AssetImage('assets/only-today.png'),
                      fit: BoxFit.cover,
                      height: 40,
                    )),
                    Text('Today'),
                  ],
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    GestureDetector(
                        // onTap: () {
                        //   Navigator.push(
                        //     context,
                        //     MaterialPageRoute(
                        //         builder: (context) => const CalendarPage()),
                        //   );
                        // },
                        child: const Image(
                      image: AssetImage('assets/weather-app.png'),
                      fit: BoxFit.cover,
                      height: 40,
                    )),
                    Text('Météo'),
                  ],
                ),
              ],
            )),
      ],
    );
  }
}

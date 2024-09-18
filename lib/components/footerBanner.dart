import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pand_orga/pages/calendarPage.dart';
import 'package:pand_orga/pages/notePage.dart';
import 'package:url_launcher/url_launcher.dart';

class FooterBanner extends StatefulWidget {
  const FooterBanner({super.key});

  @override
  State<FooterBanner> createState() => _FooterBannerState();
}

class _FooterBannerState extends State<FooterBanner> {
  static const Color greyColor = Color.fromRGBO(136, 178, 164, 100);
  static const Color darkGreyColor = Color.fromRGBO(
      85, 147, 126, 0.7215686274509804);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
            color: darkGreyColor,
            height: 70,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
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
                        child: Container(
                      decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                              color: Colors.black.withOpacity(0.2),
                              spreadRadius: 2,
                              // Étendue de l'ombre vers l'extérieur
                              blurRadius: 15,
                              // Flou de l'ombre
                              offset: Offset(0,
                                  6) // Déplacement de l'ombre (horizontal, vertical)
                              )
                        ],
                      ),
                      child: const Image(
                        image: AssetImage('assets/plus.png'),
                        fit: BoxFit.cover,
                        height: 35,
                      ),
                    )),
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
                        child: Container(
                          decoration: BoxDecoration(
                            boxShadow: [
                              BoxShadow(
                                  color: Colors.black.withOpacity(0.2),
                                  spreadRadius: 2,
                                  // Étendue de l'ombre vers l'extérieur
                                  blurRadius: 15,
                                  // Flou de l'ombre
                                  offset: Offset(0,
                                      6) // Déplacement de l'ombre (horizontal, vertical)
                                  )
                            ],
                          ),
                          child: const Image(
                            image: AssetImage('assets/calendar.png'),
                            fit: BoxFit.cover,
                            height: 35,
                          ),
                        )),
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
                        child: Container(
                      decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                              color: Colors.black.withOpacity(0.1),
                              spreadRadius: 2,
                              // Étendue de l'ombre vers l'extérieur
                              blurRadius: 15,
                              // Flou de l'ombre
                              offset: Offset(0,
                                  6) // Déplacement de l'ombre (horizontal, vertical)
                              )
                        ],
                      ),
                      child: const Image(
                        image: AssetImage('assets/today_calendar.png'),
                        fit: BoxFit.cover,
                        height: 35,
                      ),
                    )),
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
                                builder: (context) => const NotePage()),
                          );
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            boxShadow: [
                              BoxShadow(
                                  color: Colors.black.withOpacity(0.2),
                                  spreadRadius: 2,
                                  // Étendue de l'ombre vers l'extérieur
                                  blurRadius: 15,
                                  // Flou de l'ombre
                                  offset: Offset(0,
                                      6) // Déplacement de l'ombre (horizontal, vertical)
                                  )
                            ],
                          ),
                          child: Image(
                            image: AssetImage('assets/bloc_note.png'),
                            fit: BoxFit.cover,
                            height: 35,
                          ),
                        )),
                  ],
                ),
                Column(
                  // Weather link icon
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    GestureDetector(
                      onTap: () async {
                        const url =
                            'https://meteofrance.com/previsions-meteo-france/pont-en-royans/38680';
                        if (await canLaunch(url)) {
                          await launch(url);
                        } else {
                          throw 'Could not launch $url';
                        }
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          boxShadow: [
                            BoxShadow(
                                color: Colors.black.withOpacity(0.2),
                                spreadRadius: 2,
                                // Étendue de l'ombre vers l'extérieur
                                blurRadius: 15,
                                // Flou de l'ombre
                                offset: Offset(0,
                                    6) // Déplacement de l'ombre (horizontal, vertical)
                                )
                          ],
                        ),
                        child: const Image(
                          image: AssetImage('assets/weather-app.png'),
                          fit: BoxFit.cover,
                          height: 35,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            )),
      ],
    );
  }
}

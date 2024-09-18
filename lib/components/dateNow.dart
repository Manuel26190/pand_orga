import 'package:flutter/material.dart';

class DateNow extends StatefulWidget {
  const DateNow({super.key});

  @override
  State<DateNow> createState() => _DateNowState();
}

class _DateNowState extends State<DateNow> {
  static const Color greenColor = Color.fromRGBO(
      147, 184, 169,0.7);
  static const Color greyColor = Color.fromRGBO(136, 178, 164, 100);
  static const Color breakWhite = Color(0xFFF5F5F5);

  String _getFrenchDayOfWeek(int weekday) {
    switch (weekday) {
      case 1:
        return 'lundi';
      case 2:
        return 'mardi';
      case 3:
        return 'mercredi';
      case 4:
        return 'jeudi';
      case 5:
        return 'vendredi';
      case 6:
        return 'samedi';
      case 7:
        return 'dimanche';
      default:
        return '';
    }
  }

  String _getFrenchMouthOfYear(int mouth) {
    switch (mouth) {
      case 1:
        return 'Janvier';
      case 2:
        return 'Février';
      case 3:
        return 'Mars';
      case 4:
        return 'Avril';
      case 5:
        return 'Mai';
      case 6:
        return 'Juin';
      case 7:
        return 'Juillet';
      case 8:
        return 'Août';
      case 9:
        return 'Septembre';
      case 10:
        return 'Octobre';
      case 11:
        return 'Novembre';
      case 12:
        return 'Décembre';
      default:
        return '';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          width: MediaQuery.of(context).size.width,
          child: Center(
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: Container(
                width: double.infinity,
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
                    color: greenColor,
                    width: 3,
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: Container(
                    decoration: BoxDecoration(
                      border: Border.all(color: greyColor,
                          width: 4),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            '${_getFrenchDayOfWeek(DateTime.now().weekday)}',
                            style: const TextStyle(
                                fontSize: 30,
                                color: Colors.teal,
                                fontWeight: FontWeight.bold,
                                fontFamily: 'billabong'
                            ),

                          ),
                          Text(
                            '${DateTime.now().toLocal().day.toString().padLeft(2, '0')} ' +
                                '${_getFrenchMouthOfYear(DateTime.now().toLocal().month).toString().padLeft(2, '0')} ' +
                                '${DateTime.now().toLocal().year.toString().replaceAll('-', '')}',
                            style:
                                TextStyle(fontSize: 28, color: Colors.blueGrey,fontFamily: 'billabong'),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

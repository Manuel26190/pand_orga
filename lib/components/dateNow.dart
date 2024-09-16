import 'package:flutter/material.dart';

class DateNow extends StatefulWidget {
  const DateNow({super.key});

  @override
  State<DateNow> createState() => _DateNowState();
}

class _DateNowState extends State<DateNow> {

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
          height: 140,
          child: Center(
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: Container(

                // decoration: BoxDecoration(
                //     border: Border.all(
                //       color: const Color.fromRGBO(156, 166, 77, 1),
                //       width: 5,
                //     ),
                //     borderRadius: BorderRadius.circular(10)),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,

                  children: [
                    Text(
                      '${_getFrenchDayOfWeek(DateTime.now().weekday).toUpperCase()}',
                      style: const TextStyle(
                          fontSize: 30,
                          color: Colors.teal,
                          fontWeight: FontWeight.bold),
                    ),
                    Text(
                      '${DateTime.now().toLocal().day.toString().padLeft(2, '0')} ' +
                          '${_getFrenchMouthOfYear(DateTime.now().toLocal().month).toString().padLeft(2, '0')} ' +
                          '${DateTime.now().toLocal().year.toString().replaceAll('-', '')}',
                      style: TextStyle(fontSize: 28, color: Colors.blueGrey),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

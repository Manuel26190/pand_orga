import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:intl/intl.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:shared_preferences/shared_preferences.dart'; // Importez SharedPreferences
import 'dart:convert'; // Pour encoder et décoder les événements

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      locale: Locale('fr', 'FR'), // Set locale to French
      supportedLocales: [
        Locale('fr', 'FR'),
      ],

      home: CalendarPage(),
    );
  }
}

class CalendarPage extends StatefulWidget {
  const CalendarPage({super.key});
  static const Color greyColor = Color.fromRGBO(136, 178, 164, 100);
  static const Color orangeColor = Color.fromRGBO(225, 101, 46, 0.8156862745098039);

  @override
  State<CalendarPage> createState() => _CalendarPageState();
}

class _CalendarPageState extends State<CalendarPage> {
  CalendarFormat _calendarFormat = CalendarFormat.month;
  DateTime _focusedDay = DateTime.now();
  DateTime? _selectedDay;
  Map<String, List<String>> _events = {};

  final TextEditingController _eventController = TextEditingController();
  String? _eventToEdit; // Pour stocker l'événement à modifier
  int? _eventIndex; // Pour stocker l'index de l'événement à modifier

  @override
  void initState() {
    super.initState();
    initializeDateFormatting('fr_FR', null).then((_) {
      setState(() {
        _focusedDay = DateTime.now();
      });
    });
    _loadEvents(); // Charger les événements sauvegardés
  }

  // Fonction pour charger les événements
  Future<void> _loadEvents() async {
    final prefs = await SharedPreferences.getInstance();
    final eventsString = prefs.getString('events');
    if (eventsString != null) {
      print('Événements chargés : $eventsString'); // Débogage
      final Map<String, dynamic> decoded = jsonDecode(eventsString);
      final Map<String, List<String>> loadedEvents = {};
      decoded.forEach((key, value) {
        loadedEvents[key] = List<String>.from(value);
      });
      setState(() {
        _events = loadedEvents;
      });
    } else {
      print('Aucun événement trouvé dans SharedPreferences');
    }
  }

  // Fonction pour sauvegarder les événements
  Future<void> _saveEvents() async {
    final prefs = await SharedPreferences.getInstance();
    final eventsString =
        jsonEncode(_events.map((key, value) => MapEntry(key, value)));
    print('Événements sauvegardés : $eventsString'); // Débogage
    prefs.setString('events', eventsString);
  }

  // Fonction pour supprimer un événement
  void _deleteEvent(String date, int index) {
    setState(() {
      _events[date]!.removeAt(index);
      if (_events[date]!.isEmpty) {
        _events.remove(date);
      }
      _saveEvents(); // Sauvegarder après suppression
    });
  }

  // Fonction pour modifier un événement
  void _editEvent(String date, int index) {
    setState(() {
      _eventController.text = _events[date]![index];
      _eventToEdit = date;
      _eventIndex = index;
    });
  }

  // Widget pour changer le style du marker events
  Widget _buildCustomMarker(int eventCount) {
    return Container(
      width: 20, // Size of the custom marker
      height: 20,
      decoration: BoxDecoration(
        shape: BoxShape.circle, // Circle shape
        color: CalendarPage.orangeColor // Change the color
      ),
      child: Center(
        child: Text(
          '$eventCount', // Display the number of events (optional)
          style: TextStyle(
            color: Colors.white,
            fontSize: 10,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Calendrier 2024/2025'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            TableCalendar(
              firstDay: DateTime.utc(2010, 10, 16),
              lastDay: DateTime.utc(2030, 3, 14),
              focusedDay: _focusedDay,
              calendarFormat: _calendarFormat,
              selectedDayPredicate: (day) {
                return isSameDay(_selectedDay, day);
              },
              onDaySelected: (selectedDay, focusedDay) {
                setState(() {
                  _selectedDay = selectedDay;
                  _focusedDay = focusedDay;
                });
              },
              eventLoader: (day) {
                return _events[DateFormat('yyyy-MM-dd').format(day)] ?? [];
              },
              headerStyle: HeaderStyle(
                formatButtonVisible: false, // Hide the calendar format button
                titleTextStyle: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                leftChevronIcon: Icon(Icons.chevron_left),
                rightChevronIcon: Icon(Icons.chevron_right),
              ),
              daysOfWeekStyle: DaysOfWeekStyle(
                weekdayStyle: TextStyle(fontSize: 14, color: Colors.black),
                weekendStyle: TextStyle(fontSize: 14, color: Colors.red),
              ),
              calendarBuilders: CalendarBuilders(
                headerTitleBuilder: (context, day) {
                  return Center(
                    child: Text(
                      DateFormat('MMMM yyyy', 'fr_FR').format(day),
                      style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                  );
                },
                dowBuilder: (context, day) {
                  final daysOfWeek = [
                    'Lun', 'Mar', 'Mer', 'Jeu', 'Ven', 'Sam', 'Dim'
                  ];
                  final text = daysOfWeek[day.weekday - 1]; // Convert to French
                  return Center(
                    child: Text(
                      text,
                      style: TextStyle(color: Colors.black),
                    ),
                  );
                },
                markerBuilder: (context, day, events) {
                  if (events.isNotEmpty) {
                    return Positioned(
                      right: 1,
                      bottom: 1,
                      child: _buildCustomMarker(events.length),
                    );
                  }
                  return SizedBox.shrink(); // No event, return empty widget
                },
              ),
            ),
            const SizedBox(height: 8.0),
            if (_selectedDay != null) ...[
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  'Événements pour ${DateFormat('dd MMMM yyyy', 'fr_FR').format(_selectedDay!)}',
                  style: const TextStyle(
                      fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ),
              ...(_events[DateFormat('yyyy-MM-dd').format(_selectedDay!)] ?? [])
                  .asMap()
                  .entries
                  .map((entry) {
                final index = entry.key;
                final event = entry.value;
                return ListTile(
                  title: Text(event),
                  trailing: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      IconButton(
                        icon: const Icon(Icons.edit),
                        onPressed: () => _editEvent(
                            DateFormat('yyyy-MM-dd').format(_selectedDay!),
                            index),
                      ),
                      IconButton(
                        icon: const Icon(Icons.delete),
                        onPressed: () => _deleteEvent(
                            DateFormat('yyyy-MM-dd').format(_selectedDay!),
                            index),
                      ),
                    ],
                  ),
                );
              }).toList(),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextField(
                  controller: _eventController,
                  decoration: InputDecoration(
                    labelText: _eventToEdit == null
                        ? 'Ajouter un événement'
                        : 'Modifier l\'événement',
                    border: OutlineInputBorder(),
                  ),
                ),
              ),
              ElevatedButton(
                onPressed: () {
                  if (_eventController.text.isEmpty) {
                    return;
                  }
                  setState(() {
                    final formattedDate =
                        DateFormat('yyyy-MM-dd').format(_selectedDay!);
                    if (_eventToEdit == null) {
                      if (_events[formattedDate] == null) {
                        _events[formattedDate] = [];
                      }
                      _events[formattedDate]!.add(_eventController.text);
                    } else {
                      _events[_eventToEdit!]![_eventIndex!] =
                          _eventController.text;
                      _eventToEdit = null;
                      _eventIndex = null;
                    }
                    _eventController.clear();
                    _saveEvents(); // Sauvegarder après ajout ou modification d'un événement
                  });
                },
                child: Text(_eventToEdit == null
                    ? 'Ajouter l\'événement'
                    : 'Modifier l\'événement'),
              ),
            ]
          ],
        ),
      ),
    );
  }
}

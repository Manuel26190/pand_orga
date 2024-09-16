import 'dart:convert'; // Import nécessaire pour jsonDecode
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../utils/request.dart'; // Assurez-vous que connect est correctement défini ici

class NotePage extends StatefulWidget {
  const NotePage({super.key});

  @override
  State<NotePage> createState() => _NotePageState();
}

class _NotePageState extends State<NotePage> {
  final _formKey = GlobalKey<FormState>();
  final _noteController = TextEditingController();
  List<String> _notes = [];
  String response = "";

  @override
  void initState() {
    super.initState();
    _loadNotes();
  }

  Future<void> _loadNotes() async {
    final prefs = await SharedPreferences.getInstance();
    final notes = prefs.getStringList('notes');
    if (notes != null) {
      setState(() {
        _notes = notes;
      });
    }
  }

  Future<void> _saveNotes() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setStringList('notes', _notes);
  }

  void _fetchAndShowNotes() async {
    try {
      final resBody = await connect(""); // Passer un argument approprié si nécessaire
      print("Response body: $resBody");

      final decodedResponse = jsonDecode(resBody); // Décodage de la réponse JSON
      print("Decoded response: $decodedResponse");

      setState(() {
        response = decodedResponse["content"] ?? "No content"; // Utilisez une valeur par défaut si "content" n'existe pas
      });


      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text('Notes'),
            content: SingleChildScrollView(
              child: Text(response),
            ),
            actions: <Widget>[
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: const Text('OK'),
              ),
            ],
          );
        },
      );
    } catch (e) {
      // Gérer les exceptions ou erreurs ici
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Failed to fetch notes: $e')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Bloc Note'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                controller: _noteController,
                decoration: const InputDecoration(
                  labelText: 'Note',
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Entrez votre note';
                  }
                  return null;
                },
              ),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    setState(() {
                      _notes.add(_noteController.text);
                      _noteController.clear();
                      _saveNotes();
                    });
                  }
                },
                child: const Text('Ajouter une note'),
              ),
              ElevatedButton(
                onPressed: _fetchAndShowNotes,
                child: const Text("Afficher les notes"),
              ),
              const SizedBox(height: 16),
              Text(response),
              const SizedBox(height: 16),
              Expanded(
                child: ListView.builder(
                  itemCount: _notes.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      title: Text(_notes[index]),
                      subtitle: Text('This is a sample note'),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

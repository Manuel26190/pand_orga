import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class NotePage extends StatefulWidget {
  const NotePage({super.key});

  @override
  State<NotePage> createState() => _NotePageState();
}

class _NotePageState extends State<NotePage> {
  final _formKey = GlobalKey<FormState>();
  final _noteController = TextEditingController();
  List<String> _notes = [];

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

  // Fonction pour supprimer une note
  void _deleteNoteAt(int index) {
    setState(() {
      _notes.removeAt(index);
      _saveNotes(); // Sauvegarder la liste après suppression
    });
  }

  // Fonction pour modifier une note
  void _editNoteAt(int index) {
    _noteController.text = _notes[index]; // Remplir le contrôleur avec la note actuelle
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text("Modifier la note"),
          content: TextFormField(
            controller: _noteController,
            decoration: const InputDecoration(
              labelText: 'Modifier la note',
            ),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'La note ne peut pas être vide';
              }
              return null;
            },
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(); // Fermer le dialogue sans enregistrer
              },
              child: const Text("Annuler"),
            ),
            TextButton(
              onPressed: () {
                setState(() {
                  _notes[index] = _noteController.text; // Mettre à jour la note
                  _saveNotes(); // Sauvegarder les notes modifiées
                });
                _noteController.clear(); // Vider le contrôleur
                Navigator.of(context).pop(); // Fermer le dialogue après l'édition
              },
              child: const Text("Enregistrer"),
            ),
          ],
        );
      },
    );
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
              const SizedBox(height: 16),
              const SizedBox(height: 16),
              Expanded(
                child: ListView.builder(
                  itemCount: _notes.length,
                  itemBuilder: (context, index) {
                    return Dismissible(
                      key: Key(_notes[index]),
                      direction: DismissDirection.endToStart,
                      onDismissed: (direction) {
                        _deleteNoteAt(index);
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(content: Text('Note supprimée')),
                        );
                      },
                      background: Container(
                        color: Colors.red,
                        alignment: Alignment.centerRight,
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: const Icon(Icons.delete, color: Colors.white),
                      ),
                      child: ListTile(
                        title: Text(_notes[index]),
                        subtitle: const Text('Appuyez pour modifier'),
                        onTap: () {
                          _editNoteAt(index); // Ouvrir la boîte de dialogue pour modifier la note
                        },
                      ),
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

import 'package:flutter/material.dart';
import 'package:notes_app/data/notes/notes.dart';
import 'package:notes_app/screens/add_note.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Notes"),
        actions: [
          TextButton(
            onPressed: () async {
              await NotesService().findAll();
            },
            child: const Text('Read'),
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const AddNoteScreen(),
            ),
          );
        },
        child: const Icon(Icons.add),
      ),
      body: ListView(
        children: const [
          ListTile(),
        ],
      ),
    );
  }
}

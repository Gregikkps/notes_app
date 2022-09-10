import 'package:flutter/material.dart';
import 'package:notes_app/data/notes/notes.dart';
import 'package:notes_app/screens/add_note.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  Future<List<Note>> _fetchNotes() async {
    await Future.delayed(const Duration(seconds: 2));
    final notes = NotesService.findAll();
    return notes;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Notes"),
        actions: [
          TextButton(
            onPressed: () async {
              await NotesService.findAll();
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

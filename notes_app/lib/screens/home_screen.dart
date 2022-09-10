import 'dart:async';

import 'package:flutter/material.dart';
import 'package:notes_app/data/notes/notes.dart';
import 'package:notes_app/database/database_helper.dart';
import 'package:notes_app/screens/add_note.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  StreamController streamController = StreamController();
  List<Note> notes = [];

  Future<List<Note>> _fetchNotes() async {
    await Future.delayed(const Duration(milliseconds: 500));
    final notes = await NotesService.findAll();
    return notes;
  }

  void initialFetch() async {
    notes = await _fetchNotes();
    setState(() {});
  }

  @override
  void initState() {
    initialFetch();
    super.initState();
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
          ),
          TextButton(
            onPressed: () async {
              await DatabaseHelper.destroy();
            },
            child: const Text('Destroy'),
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          final note = await Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const AddNoteScreen(),
            ),
          );
          if (note != null) {
            initialFetch();
          }
        },
        child: const Icon(Icons.add),
      ),
      body: ListView.separated(
        separatorBuilder: (context, index) {
          return const Divider();
        },
        itemCount: notes.length,
        itemBuilder: (BuildContext context, int index) {
          final note = notes[index];

          return ListTile(
            tileColor: Colors.grey,
            title: Text(note.id),
            subtitle: Text(note.content),
          );
        },
      ),
    );
  }
}

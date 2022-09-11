import 'package:notes_app/database/database_helper.dart';

import 'note_model.dart';

class NotesService {
  static Future<Note> create(String content) async {
    final db = await DatabaseHelper.connect();

    final note = Note(
      content: content,
      createdAt: DateTime.now(),
    );

    await db.insert('notes', note.toJson());

    return note;
  }

  static Future<Note> createWithError(String content) async {
    final db = await DatabaseHelper.connect();

    final note = Note(
      content: content,
      // ignore: null_check_always_fails
      createdAt: null!,
    );

    // ignore: dead_code
    await db.insert('notes', note.toJson());

    return note;
  }

  static Future<List<Note>> findAll() async {
    final db = await DatabaseHelper.connect();
    final notes = await db.query(
      'notes',
      columns: ['content', 'createdAt'],
    );

    return notes.map((note) => Note.fromJson(note)).toList();
  }
}

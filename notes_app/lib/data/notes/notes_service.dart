import 'package:notes_app/database/database_helper.dart';

import 'note_model.dart';

class NotesService {
  static Future<Note> create(String content) async {
    final db = await DatabaseHelper.connect();

    final note = Note(
      id: DateTime.now().microsecondsSinceEpoch.toString(),
      content: content,
      createdAt: DateTime.now(),
    );

    await db.insert('notes', note.toJson());
    return note;
  }

  static Future<List<Note>> findAll() async {
    final db = await DatabaseHelper.connect();
    final notes = await db.query(
      'notes',
      columns: ['id', 'content', 'createdAt'],
    );

    return notes.map((note) => Note.fromJson(note)).toList();
  }
}

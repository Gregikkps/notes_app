import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DatabaseHelper {
  static Future<void> init() async {
    final databasesPath = await getDatabasesPath();
    final path = join(databasesPath, 'notes.db');
    await openDatabase(
      path,
      version: 1,
      onCreate: _onCreate,
    );
  }

  static void _onCreate(Database db, int version) async {
    await db.execute('''
      CREATE TABLE notes(
          id TEXT,
          content TEXT,
          createdAt TEXT
      )
      ''');
  }

  static Future<Database> connect() async {
    final databasesPath = await getDatabasesPath();
    final path = join(databasesPath, 'notes.db');
    final db = await openDatabase(
      path,
      version: 1,
    );
    return db;
  }
}

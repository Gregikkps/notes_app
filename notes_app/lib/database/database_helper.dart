import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DatabaseHelper {
  static Future<String> getDatabasePath() async {
    final databasesPath = await getDatabasesPath();
    final path = join(databasesPath, 'notes.db');
    return path;
  }

  static Future<void> init() async {
    final path = await getDatabasePath();
    await openDatabase(
      path,
      version: 1,
      onCreate: _onCreate,
    );
  }

  static void _onCreate(Database db, int version) async {
    await db.execute('''
      CREATE TABLE notes(         
          content TEXT,
          createdAt TEXT
      )
      ''');
  }

  static Future<Database> connect() async {
    final path = await getDatabasePath();
    final db = await openDatabase(
      path,
      version: 1,
    );
    return db;
  }

  static Future destroy() async {
    final path = await getDatabasePath();
    await deleteDatabase(path);
  }
}

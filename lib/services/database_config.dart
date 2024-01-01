import 'package:gratitude_diary/models/note.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseService {
  static final DatabaseService _database = DatabaseService._internal();
  late Future<Database> database;

  factory DatabaseService() => _database;

  DatabaseService._internal() {
    databaseConfig();
  }

  Future<bool> databaseConfig() async {
    try {
      database = openDatabase(
        join(await getDatabasesPath(), 'notes_database.db'),
        onCreate: (db, version) {
          return db.execute(
            'CREATE TABLE notes(id INTEGER PRIMARY KEY , content TEXT, tag TEXT, time TEXT)',
          );
        },
        version: 1,
      );
      return true;
    } catch (err) {
      print(err.toString());
      return false;
    }
  }

  Future<bool> insertNote(Note note) async {
    final Database db = await database;
    try {
      db.insert('notes', note.toMap(),
          conflictAlgorithm: ConflictAlgorithm.replace);
      return true;
    } catch (err) {
      print(err.toString());
      return false;
    }
  }

  Future<List<Note>> getNotes() async {
    final Database db = await database;
    final List<Map<String, dynamic>> data = await db.query('notes');
    return List.generate(data.length, (i) {
      return Note(
        id: data[i]['id'],
        content: data[i]['content'],
        tag: data[i]['tag'],
        time: data[i]['time'],
      );
    });
  }

  Future<Note> getNoteById(int id) async {
    final Database db = await database;
    final List<Map<String, dynamic>> data =
        await db.query('notes', where: 'id = ?', whereArgs: [id]);
    return Note(
      id: data[0]['id'],
      content: data[0]['content'],
      tag: data[0]['tag'],
      time: data[0]['time'],
    );
  }

  Future<bool> updateNoteById(Note note) async {
    final Database db = await database;
    try {
      db.update('notes', note.toMap(), where: 'id = ?', whereArgs: [note.id]);
      return true;
    } catch (err) {
      print(err.toString());
      return false;
    }
  }

  Future<bool> deleteNoteById(int id) async {
    final Database db = await database;
    try {
      db.delete('notes', where: 'id = ?', whereArgs: [id]);
      return true;
    } catch (err) {
      print(err.toString());
      return false;
    }
  }
}

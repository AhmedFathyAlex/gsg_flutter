import 'package:gsg_flutter/todo/data/note_model.dart';
import 'package:sqflite/sqflite.dart';

class NotesSqliteDb {
  // Notes table ( id - title - content - date)

  static late Database _database;

  static String dbPath = 'notes.db';
  static String tableName = 'notes';
  static String columnId = 'id';
  static String columnTitle = 'title';
  static String columnContent = 'content';
  static String columnDate = 'date';

  static Future<void> init() async {
    _database = await openDatabase(
      dbPath,
      version: 1,
      onCreate: (db, version) {
        // where you creat tables (one time only)
        print('onCreate DB called');
        db.execute(
          'CREATE TABLE $tableName ($columnId INTEGER PRIMARY KEY, $columnTitle TEXT, $columnContent TEXT, $columnDate TEXT)',
        );
      },
      onOpen: (db) {
        // read existing data
        print('onOpen DB called');
      },
    );
  }

  // operations (CRUD)

  // insert 

   static Future<int> insertNoteToDb(NoteModel noteModel)async{
      int id = await _database.rawInsert('INSERT INTO $tableName($columnTitle, $columnContent, $columnDate) VALUES("${noteModel.title}", "${noteModel.content}","${noteModel.date}")');
      return id;
    }

  // read 

  static Future<List<NoteModel>> getNotesFromDb ()async{
    var result =await _database.rawQuery('SELECT * FROM $tableName');
    print(result);

    List<NoteModel> notes = [];

    for(var map in result){
      NoteModel note = NoteModel.fromJson(map);
      notes.add(note);
    }

    return notes;

  }

  // update 

  // delete

  static deleteNoteFromDb(NoteModel note)async{
    int result = await _database.rawDelete('DELETE FROM $tableName WHERE $columnId = ${note.id}');
    print('note deleted $result');
  }
}

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
}

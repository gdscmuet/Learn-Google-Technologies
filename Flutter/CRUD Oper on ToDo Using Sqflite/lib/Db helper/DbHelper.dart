import 'package:sqflite/sqflite.dart';
import 'package:to_do/task.dart';

class DbHelper {
  static Database? db;
  static final int _version = 1;
  static final String _tablename = "Tasks";

  static Future<void> initDb() async {
    if (db != null) {
      return;
    }
    try {
      String _path = await getDatabasesPath() + 'task.db';
      db = await openDatabase(_path, version: _version,
          onCreate: (db, _version) {
        return db.execute('''CREATE TABLE $_tablename(
        id INTEGER PRIMARY KEY AUTOINCREMENT, 
            title String , note TEXT , isCompleted INTEGER, 
            date STRING , startTime STRING , endTime STRING, 
            Color INTEGER, remind INTEGER , repeat STRING);''');
      });
    } catch (e) {
      print(e);
    }
  }

  static Future<int?> insert(task? Task) async {
    return await db?.insert(_tablename, Task!.tojson()) ?? 1;
  }

  static Future<List<Map<String, dynamic>>> query() async {
    return await db!.query(_tablename);
  }

  static delete(task t) async {
    await db!.delete(_tablename, where: 'id=?', whereArgs: [t.id]);

  }

  static update(int id) async {
    return await db!.rawUpdate('''
      update tasks SET isCompleted=?
      WHERE id =?
''', [1, id]);
  }
  
}

import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class SqlDb {
  static Database? _db;

  Future<Database?> get db async {
    if (_db == null) {
      _db = await initalDb();
      return _db;
    } else {
      return _db;
    }
  }

  initalDb() async {
    String databasepath = await getDatabasesPath();
    String path = join(databasepath, 'youssef.db');
    Database mydb = await openDatabase(path,
        onCreate: _oncreate, version: 1, onUpgrade: _onUpgrade);
    return mydb;
  }

  _onUpgrade(Database db, int oldversion, newvesion) {
    print('onUpgrade =========================');
  }

  _oncreate(Database db, int version) async {
    await db.execute('''   
    CREATE TABLE "notes"( 
    "id"  INTEGER  NOT NULL PRIMARY KEY AUTOINCREMENT  ,
    "note"  TEXT NOT NULL    
    )
 
 ''');
    print(' oncreated ================');
  }

  readData(String sql) async {
    Database? mydb = await db;
    List<Map> response = await mydb!.rawQuery(sql);
    return response;
  }

  insertData(String sql) async {
    Database? mydb = await db;
    int response = await mydb!.rawInsert(sql);
    return response;
  }

  updateData(String sql) async {
    Database? mydb = await db;
    int response = await mydb!.rawUpdate(sql);
    return response;
  }

  deleteData(String sql) async {
    Database? mydb = await db;
    int response = await mydb!.rawDelete(sql);
    return response;
  }

  deletemydatabase() async {
    String databasepath = await getDatabasesPath();
    String path = join(databasepath, 'youssef.db');
    await deleteDatabase(path);
  }
}

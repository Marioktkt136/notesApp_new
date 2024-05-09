import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
class SqlDb{
  static Database? _db;
  Future<Database?> get db async{
    if(_db == null){
      _db = await initialDb();
      return _db;
    }else{
      return _db;
    }
  }

initialDb() async{
  String dataBasePath = await getDatabasesPath();
  String path = join(dataBasePath,'Notes.DB');
  Database myDb = await openDatabase(path,onCreate: _onCreate , version: 8 , onUpgrade: _onUpgrade);
  return myDb;
}
_onUpgrade(Database db , int oldVersion, int newVersion){
  db.execute("DROP TABLE IF EXISTS notes");
  _onCreate(db,newVersion);
  print("onUpgrade =================================");
}


_onCreate(Database db , int version)async{
await db.execute(
'''
CREATE TABLE notes (
  id INTEGER PRIMARY KEY AUTOINCREMENT,
  userName TEXT NOT NULL,
  fnName TEXT NOT NULL,
  errMessage TEXT NOT NULL,
  createdAt TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP
)
'''
);
print("_onCreate ===========================");
}


readData(String sql)async{
  Database? myDb = await db;
  List<Map> response = await myDb!.rawQuery(sql);
  return response;
}

insertData(String sql)async{
  Database? myDb = await db;
  int response = await myDb!.rawInsert(sql);
  return response;
}

updateData(String sql)async{
  Database? myDb = await db;
  int response = await myDb!.rawUpdate(sql);
  return response;
}

deleteData(String sql)async{
  Database? myDb = await db;
  int response = await myDb!.rawDelete(sql);
  return response;
}

}
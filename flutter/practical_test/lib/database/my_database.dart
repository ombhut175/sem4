import 'package:practical_test/utils/string_const.dart';
import 'package:sqflite/sqflite.dart';

class MyDatabase {
  static const String TBL_USER = "UserTable";

  static int version = 1;

  static Future<Database> initDatabase() async {
    Database db = await openDatabase(
      "${await getDatabasesPath()}/Crud.db",
      version: version,
      onCreate: (db, version) async {
        await db.execute("CREATE TABLE $TBL_USER("
            "$ID INTEGER PRIMARY KEY AUTOINCREMENT,"
            "$NAME TEXT NOT NULL,"
            "$EMAIL TEXT NOT NULL"
            ")");
      },
    );

    return db;
  }
}

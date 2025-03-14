import 'package:sqflite/sqflite.dart';

class MyDatabase {
  static const String TBL_USER = 'Tbl_User';
  static const String USER_ID = 'UserID';
  static const String NAME = 'Name';
  static const String AGE = 'Age';
  static const String EMAIL = 'Email';
  static const String CITY = 'City';

  int DB_VERSION = 1;

  Future<Database> initDatabase() async {
    print("from initDatabase");
    Database db = await openDatabase(
      '${await getDatabasesPath()}/userList.db', // Add .db extension
      onCreate: (db, version) {
        db.execute(
            "CREATE TABLE $TBL_USER ($USER_ID INTEGER PRIMARY KEY AUTOINCREMENT, $NAME TEXT, $AGE INTEGER, $EMAIL TEXT, $CITY TEXT)");
      },
      version: DB_VERSION,
    );

    return db;
  }
}

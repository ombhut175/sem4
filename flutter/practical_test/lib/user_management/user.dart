import 'package:practical_test/database/my_database.dart';
import 'package:practical_test/utils/string_const.dart';
import 'package:sqflite/sqflite.dart';

class User {
  static Future<List<Map<String, dynamic>>> getUsers() async {
    Database db = await MyDatabase.initDatabase();

    List<Map<String, dynamic>> users = await db.query(MyDatabase.TBL_USER);

    return users;
  }

  static Future<int> addUser({required Map<String, dynamic> user}) async {
    Database db = await MyDatabase.initDatabase();

    int userId = await db.insert(MyDatabase.TBL_USER, user);

    return userId;
  }

  static Future<int> editUser({required Map<String, dynamic> user}) async {
    Database db = await MyDatabase.initDatabase();

    print("::: from edit user");

    print(user);
    int userId = await db.update(MyDatabase.TBL_USER, user,
        where: "$ID = ?", whereArgs: [user[ID]]);

    return userId;
  }

  static Future<int> deleteUser({required int id}) async {
    Database db = await MyDatabase.initDatabase();

    int userId = await db.delete(MyDatabase.TBL_USER,
        where: "$ID = ?", whereArgs: [id]);

    return userId;
  }
}

import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:practical_test/utils/string_const.dart';

class UserApi {
  static const String BASE_URL = "https://66fbe4af8583ac93b40daa0e.mockapi.io/practical";

  static Future<List<dynamic>> getUsers() async {
    try {
      http.Response response = await http.get(Uri.parse(BASE_URL));

      print(response.body);

      return jsonDecode(response.body);
    } catch (error) {
      print(error);

      rethrow;
    }
  }

  static Future<void> addUser({required Map<String, dynamic> user}) async {
    http.Response response = await http.post(
        Uri.parse(BASE_URL), body: jsonEncode(user), headers: {
      "Content-Type": "application/json"
    });
  }

  static Future<void> editUser({required Map<String, dynamic> user}) async {
    http.Response response = await http.put(
        Uri.parse('$BASE_URL/${user[ID]}'), body: jsonEncode(user), headers: {
      "Content-Type": "application/json"
    });
  }

  static Future<void> deleteUser({required dynamic userId}) async {
    print("::: from deleteUser :::");

    print(userId);

    http.Response response = await http.delete(
        Uri.parse('$BASE_URL/$userId'), headers: {
      "Content-Type": "application/json"
    });

  }

}
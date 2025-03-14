import 'package:flutter/material.dart';
import 'package:lecture_work/database/my_database.dart';
import 'package:lecture_work/design/login/login_page.dart';
import 'package:lecture_work/design/login/register_page.dart';
import 'package:lecture_work/design/tabular_view.dart';
import 'package:lecture_work/list/list_view.dart';
import 'package:lecture_work/page_view/flutter_page_view.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      debugShowCheckedModeBanner: false,
      home: FutureBuilder(
        future: MyDatabase().initDatabase(),
        builder: (context, snapshot) {
          return snapshot.hasData
              ? const ListViewDemo()
              : const Center(
                  child: CircularProgressIndicator(),
                );
        },
      ),
    );
  }
}

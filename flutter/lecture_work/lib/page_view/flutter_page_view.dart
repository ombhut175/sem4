import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lecture_work/page_view/quiz_page.dart';

class PageViewDemo extends StatefulWidget {
  const PageViewDemo({super.key});

  @override
  State<PageViewDemo> createState() => _PageViewDemoState();
}

class _PageViewDemoState extends State<PageViewDemo> {
  List<Map<String, dynamic>> quiz = [
    {
      'Question': 'Hello World Program',
      'Ans1': 'A',
      'Ans2': 'c',
      'Ans3': 'B',
      'Ans4': 'D'
    },
    {
      'Question': 'Hello Data Program',
      'Ans1': 'Abc',
      'Ans2': 'cde',
      'Ans3': 'Btk',
      'Ans4': 'Dgh'
    },
    {
      'Question': 'Hello 3rd Program',
      'Ans1': 'A',
      'Ans2': 'c',
      'Ans3': 'B',
      'Ans4': 'D'
    },
    {
      'Question': 'Hello 4th Program',
      'Ans1': 'A',
      'Ans2': 'c',
      'Ans3': 'B',
      'Ans4': 'D'
    }
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Quiz Demo"),
      ),
      drawer: Drawer(
        child: ListView(
          children: [
            DrawerHeader(child: Text("Hello")),
          ],
        ),
      ),
      body: PageView.builder(
        itemBuilder: (context, index) {
          return QuizPage(
            quiz: quiz[index],
          );
        },
        itemCount: quiz.length,
      ),
    );
  }
}

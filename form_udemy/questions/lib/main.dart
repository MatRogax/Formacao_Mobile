import 'package:flutter/material.dart';

import 'Pages/questions_page.dart';

void main() => runApp(const QuizApp());

class QuizApp extends StatelessWidget {

  const QuizApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: QuizPage(),
    );
  }
}


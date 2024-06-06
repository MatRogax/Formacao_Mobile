import 'package:flutter/material.dart';
import 'package:questions/widgets/questionnaire.dart';
import 'package:questions/widgets/result.dart';

class QuizPage extends StatefulWidget {
  const QuizPage({Key? key}) : super(key: key);

  @override
  State<QuizPage> createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  int selectedQuestion = 0;
  int totalScore = 0;

  final List<Map<String, Object>> questions = const [
    {
      'question': 'Qual é o nome completo do Harry?',
      'responses': [
        {'alternative': 'Harry James Potter', 'score': 10},
        {'alternative': 'Harry Edward Styles', 'score': 0},
        {'alternative': 'Harry S. Truman', 'score': 0},
        {'alternative': 'Harry Houdini', 'score': 0},
        {'alternative': 'Harry Nilsson', 'score': 0},
      ],
    },
    {
      'question': 'Qual é o nome da escola de magia frequentada por Harry Potter e seus amigos?',
      'responses': [
        {'alternative': 'Hogwarts', 'score': 10},
        {'alternative': 'Beauxbatons', 'score': 0},
        {'alternative': 'Durmstrang', 'score': 0},
        {'alternative': 'Ilvermorny', 'score': 0},
        {'alternative': 'Castelobruxo', 'score': 0},
      ],
    },
    {
      'question': 'Qual é o nome da casa em Hogwarts em que Harry Potter foi selecionado?',
      'responses': [
        {'alternative': 'Grifinória', 'score': 10},
        {'alternative': 'Sonserina', 'score': 0},
        {'alternative': 'Lufa-Lufa', 'score': 0},
        {'alternative': 'Corvinal', 'score': 0},
        {'alternative': 'Beauxbatons', 'score': 0},
      ],
    },
    {
      'question': 'Quem é o professor de Transfiguração em Hogwarts?',
      'responses': [
        {'alternative': 'Minerva McGonagall', 'score': 10},
        {'alternative': 'Severus Snape', 'score': 0},
        {'alternative': 'Filius Flitwick', 'score': 0},
        {'alternative': 'Horace Slughorn', 'score': 0},
        {'alternative': 'Remus Lupin', 'score': 0},
      ],
    },
    {
      'question': 'Qual é o nome da espada que é usada por Harry Potter para destruir a Horcrux de Slytherin?',
      'responses': [
        {'alternative': 'Espada de Gryffindor', 'score': 10},
        {'alternative': 'Espada de Excalibur', 'score': 0},
        {'alternative': 'Espada de Slytherin', 'score': 0},
        {'alternative': 'Espada de Godric', 'score': 0},
        {'alternative': 'Espada de Merlin', 'score': 0},
      ],
    },
  ];

  void respond(int score) {
    setState(() {
      selectedQuestion++;
      totalScore += score;
    });
  }

  bool get hasSelectedQuestion {
    return selectedQuestion < questions.length;
  }

  void restartQuestionaire(){
    setState(() {
      totalScore = 0;
      selectedQuestion = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(
          child: Text(
            'Questions',
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 22,
            ),
          ),
        ),
        backgroundColor: Colors.blue,
      ),
      body: hasSelectedQuestion
          ? Questionnaire(
              questions: questions,
              selectedQuestion: selectedQuestion,
              onAnswer: respond,
            )
          : Result(totalScore,restartQuestionaire), //
    );
  }
}

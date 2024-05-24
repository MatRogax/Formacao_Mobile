import 'package:flutter/material.dart';
import 'package:questions/widgets/question.dart';
import 'package:questions/widgets/response.dart';

class Questionnaire extends StatelessWidget {

  final int selectedQuestion;
  final List<Map<String,Object>> questions;
  final void Function(int) onAnswer;
  
  const Questionnaire({

    required this.questions,
    required this.selectedQuestion,
    required this.onAnswer,

    });

    bool get haveSelectedQuestion{

      bool validQuestion = selectedQuestion < questions.length;
      return  validQuestion;

  }

  @override
  Widget build(BuildContext context) {
    List<Map<String,Object>> responseQuestions = haveSelectedQuestion 
    ? questions[selectedQuestion]['responses'] as List<Map<String, Object>>
        : [];
    return Column(
      children: 
        <Widget>[
           Questions(text: questions[selectedQuestion]['question'] as String),
           ...responseQuestions.map((responseText) {
              return Responses(
              responseTxt: responseText['alternative'] as String,
              selectedResponse: () => onAnswer(responseText['score'] as int),
           );
          }).toList(),
        ],
    );
  }
}
import 'package:flutter/material.dart';

class Result extends StatelessWidget {
  final int? pontuationScore;
  Function() restartQuestionaire;

  Result(this.pontuationScore,this.restartQuestionaire);

  String get resultScore {
    if (pontuationScore == null || pontuationScore! < 8) {
      return 'voce é um mago iniciante';
    } else if (pontuationScore! < 12) {
      return 'você é um bom mago';
    } else if (pontuationScore! < 16) {
      return 'você é um mago ';
    } else {
      return 'você é outro nível';
    }
  }
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Center(
          child: Text(
            resultScore,
            style: const TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
        ),
        Center(
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: ElevatedButton(
              onPressed: restartQuestionaire,
              child: const Text('Reiniciar'),
            ),
          ),
        ),
      ],
    );
  }


}

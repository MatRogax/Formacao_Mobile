import 'package:flutter/material.dart';

class Responses extends StatelessWidget {
  
  final String responseTxt;
  void Function() selectedResponse;

  Responses({required this.responseTxt,required this.selectedResponse});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.all(10),
      child: ElevatedButton(
        onPressed: () => selectedResponse(),
        style:ElevatedButton.styleFrom(
          backgroundColor: Colors.blue,
          foregroundColor: Colors.white
        ),//selectedResponse(),
        child: Text(
          responseTxt,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 16,
          ),
        ),
      ),
    );
  }
}

 
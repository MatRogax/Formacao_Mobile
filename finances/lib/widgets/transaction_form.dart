import 'package:flutter/material.dart';

class TransactionForm extends StatelessWidget {
  const TransactionForm({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: const Color.fromARGB(255, 51, 49, 49),
      ),
      padding: EdgeInsets.all(10),
      child: TextFormField(
      ),
    );
  }
}

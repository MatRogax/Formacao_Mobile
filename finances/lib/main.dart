import 'package:finances/pages/transaction_user.dart';
import 'package:flutter/material.dart';

void main() => runApp(FinanceApp());

class FinanceApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class HomePage extends StatelessWidget {
  HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 0, 0, 2),
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 0, 0, 2),
        foregroundColor: Colors.white,
        title: const Padding(
          padding: EdgeInsets.only(top: 25),
          child: Text('Finance App'),
        ),
      ),
      body: const Column(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Padding(
            padding: EdgeInsets.all(10),
            child: Text(
              "Histórico",
              style: TextStyle(
                color: Colors.white,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          TransactionUser(),
        ],
      ),
    );
  }
}

import 'package:finances/models/transaction.dart';
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
  final transactions = [
    Transaction(
        id: 't1',
        title: 'tenis de corrida',
        value: 320.87,
        date: DateTime.now()),
    Transaction(
        id: 't2',
        title: 'maquina de lavar',
        value: 880.50,
        date: DateTime.now()),
  ];

  HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 0, 0, 2),
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255,0, 0, 2),
        foregroundColor: Colors.white,
        title: Center(
          child: Padding(
            padding: const EdgeInsets.only(top: 25),
            child: Text(
              'Finance App'),
          ),
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          
          Column(
            children: transactions.map((tr) {
              return Card(
                shape:ContinuousRectangleBorder(borderRadius: BorderRadius.circular(30)),
                color: Color.fromARGB(255,13, 13, 13),
              
                child: Row(
                  children: <Widget>[
                    Container(
                      padding: const EdgeInsets.all(10),
                      margin: const EdgeInsets.symmetric(
                          horizontal: 15, vertical: 10),
                      decoration: BoxDecoration(
                        color: const Color.fromARGB(255, 51, 49, 49),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: const Icon(
                        Icons.currency_bitcoin_sharp,
                        color: Colors.white,
                      ),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Padding(
                          padding: EdgeInsets.only(top: 20, right: 0),
                          child: Text(
                            tr.title,
                            style: const TextStyle(
                              color:Colors.white,
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: 175),
                          child: Text(
                            '-\$${tr.value.toStringAsFixed(2)}', // formata com 2 casas decimais
                            style: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w800,
                              color: Color.fromARGB(255, 252, 252, 252),
                            ),
                          ),
                        ),
                        Center(
                          child: Text(
                            tr.date.toString(),
                            style: const TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.bold,
                              color: Color.fromARGB(255, 55, 55, 55),
                            ),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              );
            }).toList(),
          )
        ],
      ),
    );
  }
}

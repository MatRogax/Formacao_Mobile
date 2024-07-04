import 'package:finances/models/transaction_model.dart';
import 'package:finances/widgets/Transaction_list.dart';
import 'package:finances/widgets/transaction_form.dart';
import 'package:flutter/material.dart';

class TransactionUser extends StatefulWidget {
  const TransactionUser({super.key});

  @override
  State<TransactionUser> createState() => _TransactionUserState();
}

class _TransactionUserState extends State<TransactionUser> {

  final List<Transaction> transactions = [
    Transaction(
        id: 't1',
        title: 'Tênis de Corrida',
        value: 320.87,
        date: DateTime.now()),
    Transaction(
        id: 't2',
        title: 'Máquina de Lavar',
        value: 880.50,
        date: DateTime.now()),
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        TransactionList(transactions),
      ],
    );
  }
}
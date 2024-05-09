import 'package:flutter/material.dart';

void main(List<String> args) {
  runApp(const MaterialApp(
    debugShowCheckedModeBanner: false,
    home: Home(),
  ));
}

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Calculadaroda de IMC"),
        centerTitle: true,
        backgroundColor: Colors.green,
        actions: [
          IconButton(
            onPressed: () => refreshPage(),
            icon: const Icon(Icons.refresh),
          ),
        ],
      ),
      backgroundColor: Colors.white,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: const [
          Icon(
            Icons.person,
            size: 100,
            color: Colors.green,
          ),
          TextField(
            keyboardType: TextInputType.number,
            decoration: InputDecoration(
                labelText: "Peso em (KG)",
                labelStyle: TextStyle(color: Color.fromARGB(255, 55, 131, 57))),
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Color.fromARGB(255, 55, 131, 57),
            ),
          ),
        ],
      ),
    );
  }

  void refreshPage() => print("refreshing");
}

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
  String _infoText = "informe seus dados";
  TextEditingController weightController = TextEditingController();
  TextEditingController heightController = TextEditingController();

  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Calculadaroda de IMC"),
        centerTitle: true,
        backgroundColor: Colors.green,
        actions: [
          IconButton(
            onPressed: () => _refreshPage(),
            icon: const Icon(Icons.refresh),
          ),
        ],
      ),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        padding: const EdgeInsets.only(left: 10.0, right: 10.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const Icon(
                Icons.person,
                size: 100,
                color: Colors.green,
              ),
              TextFormField(
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                      labelText: "Peso em (KG)",
                      labelStyle:
                          TextStyle(color: Color.fromARGB(255, 55, 131, 57))),
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    color: Color.fromARGB(255, 55, 131, 57),
                  ),
                  controller: weightController,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Informe seu peso";
                    }
                  }),
              TextFormField(
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                    labelText: "Altura (cm)",
                    labelStyle:
                        TextStyle(color: Color.fromARGB(255, 55, 131, 57))),
                textAlign: TextAlign.center,
                style: const TextStyle(
                  color: Color.fromARGB(255, 55, 131, 57),
                ),
                controller: heightController,
                validator: (value) {
                  if (value!.isEmpty) {
                    return "Informe sua altura";
                  }
                },
              ),
              Padding(
                padding: const EdgeInsets.only(top: 10.0, bottom: 10.0),
                child: Container(
                  height: 50.0,
                  child: ElevatedButton(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        calculateButton();
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.green,
                    ),
                    child: const Text(
                      "Calcular",
                      style: TextStyle(
                        fontSize: 25.0,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ),
              Text(
                _infoText,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  color: Colors.green,
                  fontSize: 25.0,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _refreshPage() {
    heightController.text = "";
    weightController.text = "";

    setState(() {
      _infoText = "Informe seus dados";
      _formKey = GlobalKey<FormState>();
    });
  }

  void calculateButton() {
    
    setState(() {

      double weight = double.parse(weightController.text);
      double height = double.parse(heightController.text) / 100;
      double imc = weight / (height * height);
      bool underweight      = imc >= 18.6 && imc <= 24.9;
      bool idealweight      = imc >= 24.9 && imc <= 29.9;
      bool overweightGrade1 = imc >= 29.9 && imc <= 34.9;
      bool overweightGrade2 = imc >= 34.9 && imc <= 39.9;

      if (underweight) {
        _infoText = "Você está abaixo do peso (${imc.toStringAsPrecision(3)})";
      } else if (idealweight) {
        _infoText = "Você está no peso ideal (${imc.toStringAsPrecision(3)})";
      } else if (overweightGrade1) {
        _infoText = "Obesidade grau I (${imc.toStringAsPrecision(3)})";
      } else if (overweightGrade2) {
        _infoText = "Obesidade grau II(${imc.toStringAsPrecision(3)})";
      } else {
        _infoText = "Obesidade grau III(${imc.toStringAsPrecision(3)})";
      }
    });
  }
}

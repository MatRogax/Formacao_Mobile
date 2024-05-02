import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int count = 0;
  bool get localVazio => count == 0;
  bool get localLotado => count >= 20;
  Color backgroundButtonExit = Colors.white;
  Color backgroundButtonEnter = Colors.white;

  @override
  void initState() {
    super.initState();
    colorState();
  }

  void increment() {
    if (localLotado) {
      count = 20;
    } else {
      setState(() => count++);
    }
    colorState();
  }

  void decrement() {
    if (localVazio) {
      count = 0;
    } else {
      setState(() => count--);
    }
    colorState();
  }

  void colorState() {
    bool isButtonExit = !localLotado && localVazio;
    bool isButtonEnter = localLotado && !localVazio;

    Color colorDisable = Colors.white.withOpacity(0.2);
    Color colorEnable = Colors.white;

    setState(() => isButtonExit
        ? backgroundButtonExit = colorDisable
        : backgroundButtonExit = colorEnable);

    setState(() => isButtonEnter
        ? backgroundButtonEnter = colorDisable
        : backgroundButtonEnter = colorEnable);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 22, 22, 22),
      ),
      backgroundColor: Colors.black,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            localLotado ? "Local Cheio" : "Pode entrar",
            style: const TextStyle(
              fontSize: 30,
              color: Colors.white,
              fontWeight: FontWeight.w700,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(42),
            child: Text(
              '$count',
              style: const TextStyle(
                fontSize: 50,
                color: Colors.white,
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextButton(
                onPressed: () => decrement(),
                style: TextButton.styleFrom(
                  backgroundColor: backgroundButtonExit,
                  fixedSize: const Size(80, 80),
                  foregroundColor: Colors.black,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                    side: const BorderSide(
                      color: Color.fromARGB(255, 37, 39, 37),
                      width: 1.8,
                    ),
                  ),
                ),
                child: const Text(
                  'saiu',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 18,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
              const SizedBox(width: 20),
              TextButton(
                onPressed: () => increment(),
                style: TextButton.styleFrom(
                  backgroundColor: backgroundButtonEnter,
                  fixedSize: const Size(80, 80),
                  foregroundColor: Colors.black,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                    side: const BorderSide(
                      color: Color.fromARGB(255, 37, 39, 37),
                      width: 1.8,
                    ),
                  ),
                ),
                child: const Text(
                  'entrou',
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.black,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

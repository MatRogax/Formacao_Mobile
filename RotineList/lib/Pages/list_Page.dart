import 'package:flutter/material.dart';


import '../widgets/task_List_Itens.dart';

class ListPage extends StatefulWidget {
  ListPage({super.key});

  @override
  State<ListPage> createState() => _ListPageState();
}

class _ListPageState extends State<ListPage> {
  final TextEditingController emailController = TextEditingController();

  final TextEditingController taskController = TextEditingController();

  List<String> tasks = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                children: [
                  Expanded(
                    child: TextField(
                      controller: taskController,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Adicione uma Tarefa',
                        hintText: 'Ex: Estudar Flutter',
                      ),
                    ),
                  ),
                  const SizedBox(width: 8),
                  ElevatedButton(
                    onPressed: () => buttonTaskAction(),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blue,
                      padding: const EdgeInsets.all(14),
                    ),
                    child: const Icon(
                      Icons.add,
                      color: Colors.white,
                      size: 30,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 16),
              Flexible(
                child: ListView(
                  shrinkWrap: true,
                  scrollDirection: Axis.vertical,
                  addAutomaticKeepAlives: false,
                  children: [
                    for (String task in tasks) 
                    taskListItens(
                      title:task,
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 16),
              Row(
                children: [
                  const Expanded(
                    child: Text(
                      'Voce Possui 0 Tarefas',
                    ),
                  ),
                  const SizedBox(width: 8),
                  ElevatedButton(
                    onPressed: () => cleanAll,
                    child: const Text(
                      'Limpar Tudo',
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  void buttonTaskAction() {
    String task = taskController.text;
    setState(() => tasks.add(task));
    taskController.clear();
  }

  void cleanAll(String text) {
    print('Limpou tudo');
  }

  void countTasks() {}
}

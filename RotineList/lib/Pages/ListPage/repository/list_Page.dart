import 'package:flutter/material.dart';
import '../../../constants/Utils.dart';
import '../../../widgets/task_List_Itens.dart';
import '../models/TaskDescription.dart';

class ListPage extends StatefulWidget {
  ListPage({super.key});

  @override
  State<ListPage> createState() => _ListPageState();
}

class _ListPageState extends State<ListPage> {
  
  final TextEditingController emailController = TextEditingController();
  final TextEditingController taskController  = TextEditingController();

  List<TaskDescription> tasks = [];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: Padding(
            padding: const EdgeInsets.all(16),
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
                          hintText: 'Ex: Reunião ás 14 horas',
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
                      for (TaskDescription task in tasks)
                        TaskListItens(
                          task:task,
                        ),
                    ],
                  ),
                ),
                const SizedBox(height: 16),
                Row(
                  children: [
                    Expanded(
                      child: Text(
                        'Voce Possui ${tasks.length} Tarefas',
                      ),
                    ),
                    const SizedBox(width: 8),
                    ElevatedButton(
                      onPressed: () => cleanAll(),
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
      ),
    );
  }

 void buttonTaskAction() {

  String task = taskController.text;
  
  setState(() {
    
    TaskDescription newTask = TaskDescription(
      title: task,
      datetime: utils.convertDate(),
    );
    
    tasks.add(newTask); 
  });

  taskController.clear();
  
}

  void cleanAll(){
    String task = taskController.text;
    setState(() => tasks.clear());
  }

  void countTasks() {}
}

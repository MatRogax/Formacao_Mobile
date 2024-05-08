import 'package:flutter/material.dart';
import 'package:listrotine/repositories/task_repository.dart';

import '../../constants/Utils.dart';
import '../../widgets/task_List_Itens.dart';
import 'models/TaskDescription.dart';

class ListPage extends StatefulWidget {
  ListPage({super.key});

  @override
  State<ListPage> createState() => _ListPageState();
}

class _ListPageState extends State<ListPage> {
  final TextEditingController taskController = TextEditingController();
  final TaskRepository taskRepository = TaskRepository();

  List<TaskDescription> tasks = [];
  TaskDescription? deletedTask;
  int? deletedTaskPos;
  String? errorText;

  @override
  void initState() {
    super.initState();
    taskRepository.getTaskList().then((value) {
      setState(() => tasks = value);
    });
  }

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
                        decoration: InputDecoration(
                          border: const OutlineInputBorder(),
                          labelText: 'Adicione uma Tarefa',
                          hintText: 'Ex: Reunião ás 14 horas',
                          errorText: errorText,
                          focusedBorder:const OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Colors.blue,
                              width: 2,
                            ),
                          )
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
                          task: task,
                          deleteTask: deleteTask,
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
                      onPressed: () => showOptionsClean(),
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

    if (task.isNotEmpty && task.length > 5) {
      setState(() {
        TaskDescription newTask = TaskDescription(
          title: task,
          datetime: utils.convertDate(),
        );
        tasks.add(newTask);
        errorText = null;
      });

      taskController.clear();
      taskRepository.saveTaskList(tasks);
    } else {
      setState(() => errorText = "Insira uma Tarefa válida");
    }
  }

  void showOptionsClean() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text("Deseja apagar todas as tarefas?"),
        actions: [
          TextButton(
            style: TextButton.styleFrom(
              foregroundColor: Colors.blue,
            ),
            onPressed: () => Navigator.of(context).pop(),
            child: const Text(
              'Cancelar',
              style: TextStyle(fontSize: 15, fontWeight: FontWeight.w800),
            ),
          ),
          TextButton(
            style: TextButton.styleFrom(
              foregroundColor: Colors.red,
            ),
            onPressed: () => cleanAll(),
            child: const Text(
              'Limpar Tudo',
              style: TextStyle(fontSize: 15, fontWeight: FontWeight.w800),
            ),
          )
        ],
      ),
    );
  }

  void deleteTask(TaskDescription task) {
    deletedTask = task;
    deletedTaskPos = tasks.indexOf(task);
    setState(() => tasks.remove(task));
    taskRepository.saveTaskList(tasks);
    ScaffoldMessenger.of(context).clearSnackBars();
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        duration: const Duration(seconds: 5),
        content: Text(
          'Tarefa ${task.title} foi removido com sucesso!',
          style: const TextStyle(
            color: Color(0xff060708),
          ),
        ),
        backgroundColor: Colors.white,
        action: SnackBarAction(
          label: 'Desfazer',
          textColor: Colors.blue,
          onPressed: () => unMakeButton(),
        ),
      ),
    );
  }

  void cleanAll() {
    setState(() => tasks.clear());
    taskRepository.saveTaskList(tasks);
    Navigator.of(context).pop();
  }

  void alertButtonClicked() => Navigator.of(context).pop();

  void unMakeButton() {
    setState(() => tasks.insert(deletedTaskPos!, deletedTask!));
    taskRepository.saveTaskList(tasks);
  }
}

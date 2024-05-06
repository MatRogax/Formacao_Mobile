import 'package:flutter/material.dart';
import '../Pages/ListPage/models/TaskDescription.dart';
import '../constants/Utils.dart';

class TaskListItens extends StatelessWidget {
  const TaskListItens({super.key, required this.task});
  final TaskDescription task;

  @override
  Widget build(BuildContext context) {
    return Slidable(
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 5.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color: Colors.grey[200],
        ),
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              utils.convertDate(),
              style: const TextStyle(
                fontSize: 12,
              ),
            ),
            Text(
              task.title,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
      ),
      //actionPane: const startActionPane(),
    );
  }
}

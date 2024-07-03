import 'package:flutter/material.dart';
import 'package:taskaty/widgets/list_tile.dart';
import 'package:provider/provider.dart';

import '../models/task_data.dart';

class TasksList extends StatelessWidget {
  const TasksList({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Consumer<TaskData>(
      builder: (BuildContext context, taskData, Widget? child) {
        return Padding(
          padding: const EdgeInsets.all(3.0),
          child: ListView.builder(
            itemBuilder: (context, index) {
              return ListTileCheck(
                taskTitle: taskData.tasks[index].name,
                isChecked: taskData.tasks[index].isDone,
                date: DateTime.parse(taskData.tasks[index].date),
                checkboxChange: (bool? newValue) {
                  taskData.updateTask(taskData.tasks[index]);
                },
                listTileDelete: () {
                  taskData.deleteTask(taskData.tasks[index]);
                },
              );
            },
            itemCount: Provider.of<TaskData>(context).tasks.length,
          ),
        );
      },
    );
  }
}

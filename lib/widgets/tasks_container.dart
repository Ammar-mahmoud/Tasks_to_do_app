import 'package:flutter/material.dart';
import 'package:taskaty/models/task_data.dart';
import 'package:taskaty/widgets/clear_list.dart';
import 'package:taskaty/widgets/task_list.dart';
import 'package:provider/provider.dart';

class TasksContainer extends StatelessWidget {
  const TasksContainer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        decoration: BoxDecoration(
            color: Colors.white, borderRadius: BorderRadius.circular(25)),
        child: Provider.of<TaskData>(context).tasks.length == 0
            ? Center(
                child: Text(
                'لسه مفيش تاسكات',
                style: TextStyle(fontFamily: 'ElMessiri', fontSize: 20),
              ))
            : Column(
                children: [
                  ClearList(),
                  Expanded(child: TasksList()),
                ],
              ),
      ),
    );
  }
}

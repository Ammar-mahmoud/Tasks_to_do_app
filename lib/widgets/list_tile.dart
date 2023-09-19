import 'package:flutter/material.dart';

class ListTileCheck extends StatelessWidget {
  const ListTileCheck({
    super.key,
    required this.isChecked,
    required this.taskTitle,
    required this.checkboxChange,
    required this.listTileDelete,
    required this.date,
  });

  final bool isChecked;
  final String taskTitle;
  final DateTime date;
  final void Function(bool?) checkboxChange;
  final void Function() listTileDelete;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            taskTitle,
            style: TextStyle(
                fontSize: 18,
                fontFamily: 'ElMessiri',
                decoration: isChecked ? TextDecoration.lineThrough : null),
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Text(
                '${date.day}/${date.month}/${date.year} - ${date.hour}: ${date.minute}',
                style: TextStyle(color: Colors.grey[600], fontSize: 10),
              ),
              Checkbox(
                activeColor: Colors.indigo,
                value: isChecked,
                onChanged: checkboxChange,
              ),
            ],
          ),
        ],
      ),
      onLongPress: listTileDelete,
    );
  }
}

class TaskCheckBox extends StatelessWidget {
  const TaskCheckBox({
    super.key,
    required this.isChecked,
    required this.checkBoxChanged,
  });
  final bool isChecked;
  final Function(bool?) checkBoxChanged;
  @override
  Widget build(BuildContext context) {
    return Checkbox(
      activeColor: Colors.indigo,
      value: isChecked,
      onChanged: checkBoxChanged,
    );
  }
}

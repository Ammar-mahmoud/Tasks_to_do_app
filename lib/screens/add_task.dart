import 'package:flutter/material.dart';
import 'package:hazaker/models/task_data.dart';
import 'package:provider/provider.dart';

class AddTask extends StatelessWidget {
  AddTask(this.addCallback);
  final Function addCallback;
  @override
  Widget build(BuildContext context) {
    String? newTask;
    return Container(
      child: Padding(
        padding: const EdgeInsets.all(30.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              'تاسك جديدة',
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontFamily: 'ElMessiri',
                  fontSize: 28,
                  fontWeight: FontWeight.w600,
                  color: Colors.indigo[900]),
            ),
            TextField(
              autofocus: true,
              textAlign: TextAlign.center,
              maxLength: 20,
              onChanged: (value) {
                newTask = value;
              },
              style: TextStyle(fontSize: 18, fontFamily: 'ElMessiri'),
            ),
            SizedBox(
              height: 20,
            ),
            TextButton(
              onPressed: () {
                Provider.of<TaskData>(context, listen: false)
                    .addTask(newTask!, DateTime.now().toString());
                Navigator.pop(context);
              },
              child: Text(
                'زود',
                style: TextStyle(fontFamily: 'ElMessiri', fontSize: 18),
              ),
              style: TextButton.styleFrom(
                foregroundColor: Colors.white,
                backgroundColor: Colors.teal[400],
              ),
            )
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:taskaty/models/task_data.dart';
import 'package:provider/provider.dart';

class ClearList extends StatelessWidget {
  const ClearList({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: ElevatedButton(
          onPressed: () {
            showDialog(
              context: context,
              builder: (BuildContext context) {
          return AlertDialog(
            title: Text('مسح الكل',textAlign: TextAlign.end, style: TextStyle(fontFamily: 'ElMessiri',color: Colors.red),),
            content: Text('هل انت متأكد من مسح كل التاسكات؟', textAlign: TextAlign.end, style: TextStyle(fontFamily: 'ElMessiri',),),
            actions: [
              TextButton(
                child: Text('متمسحش', style: TextStyle(fontSize: 16,color: Colors.green),),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
              TextButton(
                child: Text('امسح', style: TextStyle(fontSize: 16,color: Colors.red),),
                onPressed: () {
                  Provider.of<TaskData>(context, listen: false).removeTasks();
                  Navigator.of(context).pop();
                },
              ),
            ],
          );
              },
            );
          },
          style: ElevatedButton.styleFrom(
            primary: const Color.fromARGB(255, 223, 29, 15),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.all(5.0),
            child: Text(
              'مسح الكل',
              style: TextStyle(fontSize: 18, fontFamily: 'ElMessiri', color: Colors.black),
            ),
          ),
        ),
        )

      ],
    );
  }
}

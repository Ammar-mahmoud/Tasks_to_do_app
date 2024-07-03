import 'package:flutter/material.dart';
import 'package:taskaty/screens/add_task.dart';
class AddButton extends StatelessWidget {
  const AddButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: () {
        showModalBottomSheet(
            isScrollControlled: true,
            context: context,
            builder: (context) => SingleChildScrollView(
                child: Container(
                    padding: EdgeInsets.only(
                        bottom: MediaQuery.of(context).viewInsets.bottom),
                    child: AddTask((newTask) {}))));
      },
      backgroundColor: Colors.indigo[400],
      child: Icon(Icons.add,size: 28,),
    );
  }
}
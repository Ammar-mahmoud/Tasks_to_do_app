import 'package:flutter/material.dart';
import 'package:taskaty/models/task_data.dart';
import 'package:taskaty/widgets/add_button.dart';
import 'package:taskaty/widgets/tasks_container.dart';
import 'package:taskaty/widgets/timer_button.dart';
import 'package:provider/provider.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          TimerButton(),
          AddButton(),
        ],
      ),
      backgroundColor: Colors.teal[400],
      body: SafeArea(
        child: Container(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Icon(
                        Icons.playlist_add_check,
                        size: 40,
                        color: Colors.white,
                      ),
                      Text(
                        'هتعمل ايه انهاردة ؟',
                        style: TextStyle(
                            fontFamily: 'ElMessiri',
                            fontWeight: FontWeight.w700,
                            fontSize: 30,
                            color: Colors.white),
                      ),
                      Container()
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Text(
                          '${Provider.of<TaskData>(context).tasks.length} Tasks',
                          style: TextStyle(
                              fontSize: 18, color: Colors.indigo[900])),
                      Text(
                        'اضغط ضغطه مطولة علي التاسك الي عايز تحذفها',
                        textAlign: TextAlign.left,
                        style: TextStyle(
                            fontFamily: 'ElMessiri',
                            fontSize: 12,
                            color: Colors.grey[900]),
                      )
                    ],
                  ),
                ),
                TasksContainer(),
                SizedBox(
                  height: 50,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}


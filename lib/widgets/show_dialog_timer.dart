import 'package:flutter/material.dart';

Future<dynamic> showDialogTimer(
  BuildContext context,
  String title,
  String subtitle,
  Color mainColor,
  String but1,
  String but2,
  Function fun1,
  Function fun2,
) {
  return showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Text(
                title,
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontFamily: 'ElMessiri',
                    color: mainColor,
                    fontSize: 20,
                    fontWeight: FontWeight.w700),
              ),
              Image.asset(
                'assets/Pomodoro.png',
                height: 80,
                width: 80,
              )
            ],
          ),
          content: Text(
            subtitle,
            textAlign: TextAlign.end,
            style: TextStyle(
              fontFamily: 'ElMessiri',
            ),
          ),
          actions: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                TextButton(
                  child: Text(
                    but1,
                    style: TextStyle(
                      color: Colors.red,
                      fontWeight: FontWeight.w600,
                      fontSize: 18,
                    ),
                  ),
                  onPressed: () {
                    fun1();
                    Navigator.of(context).pop();
                  },
                ),
                TextButton(
                  child: Text(
                    but2,
                    style: TextStyle(
                      color: Colors.green[700],
                      fontWeight: FontWeight.w600,
                      fontSize: 18,
                    ),
                  ),
                  onPressed: () {
                    fun2();
                    Navigator.of(context).pop();
                  },
                ),
              ],
            ),
          ],
        );
      });
  
}

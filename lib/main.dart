import 'package:flutter/material.dart';
import 'package:taskaty/models/Timer.dart';
import 'package:taskaty/models/task_data.dart';
import 'package:taskaty/screens/home.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => TaskData()),
        ChangeNotifierProvider(create: (context) => TimerProvider()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Home(),
      ),
    );
  }
}

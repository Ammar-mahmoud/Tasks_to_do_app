import 'package:flutter/material.dart';
import 'package:hazaker/models/task_data.dart';
import 'package:hazaker/screens/home.dart';
import 'package:provider/provider.dart';
void main() {
  runApp(
    const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (BuildContext context) => TaskData(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Home(),
        ),
    );
  }
}

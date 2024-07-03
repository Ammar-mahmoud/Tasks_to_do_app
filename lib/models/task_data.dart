import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:taskaty/models/task.dart';
import 'package:shared_preferences/shared_preferences.dart';


class TaskData extends ChangeNotifier {
  List<Task> tasks = [];
  

  // Initialize shared preferences
  SharedPreferences? _prefs;


  TaskData() {
    _initPrefs();
  }

  Future<void> _initPrefs() async {
    try {
      _prefs = await SharedPreferences.getInstance();
      _loadTasks();
    } catch (e) {
      print('Error initializing shared preferences: $e');
    }
  }

  void _loadTasks() {
    try {
      final taskList = _prefs?.getStringList('tasks') ?? [];
      tasks = taskList.map((taskJson) {
        final Map<String, dynamic> map = Map<String, dynamic>.from(
            Map<String, dynamic>.from(json.decode(taskJson)));
        return Task.fromMap(map);
      }).toList();
      notifyListeners();
    } catch (e) {
      print('Error loading tasks from shared preferences: $e');
    }
  }

  // Save tasks to shared preferences
  Future<void> _saveTasks() async {
    try {
      final taskList = tasks.map((task) => json.encode(task.toMap())).toList();
      await _prefs?.setStringList('tasks', taskList);
    } catch (e) {
      print('Error saving tasks to shared preferences: $e');
    }
  }

// date: DateTime.now(), time: TimeOfDay.now()
  void addTask(String title, String date) {
    tasks.add(Task(name: title, date: date));
    _saveTasks();
    notifyListeners();
  }

  void deleteTask(Task task) {
    tasks.remove(task);
    _saveTasks();
    notifyListeners();
  }

  void removeTasks() {
    tasks.clear();
    _saveTasks();
    notifyListeners();
  }



  void updateTask(Task task) {
    task.doneChange();
    _saveTasks();
    notifyListeners();
  }
}

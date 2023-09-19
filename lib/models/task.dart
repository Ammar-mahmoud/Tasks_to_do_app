class Task {
  final String name, date;
  bool isDone;
  Task({
    required this.name,
    this.isDone = false,
    required this.date,
  });

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'isDone': isDone,
      'date': date,
    };
  }

  // Create a Task from a Map when loading from shared preferences
  factory Task.fromMap(Map<String, dynamic> map) {
    return Task(
      name: map['name'],
      isDone: map['isDone'],
      date: map['date'],
    );
  }

  void doneChange() {
    isDone = !isDone;
  }
}

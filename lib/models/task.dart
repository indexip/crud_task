class Task {
  final int id;
  final String title;
  bool done;

  Task({required this.id, required this.title, this.done = false});

  factory Task.fromMap(Map mapTasks) {
    return Task(
        id: mapTasks['id'], title: mapTasks['title'], done: mapTasks['done']);
  }

  getToggle() {
    done = !done;
  }
}

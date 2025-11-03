import 'task.dart';

class Plan {
  String name;
  final List<Task> tasks;

  Plan({required this.name, required this.tasks});

  String get completenessMessage {
    if (tasks.isEmpty) return 'No tasks';
    final completed = tasks.where((task) => task.isComplete).length;
    return '$completed out of ${tasks.length} tasks';
  }
}

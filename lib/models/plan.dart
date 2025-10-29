import './task.dart';

// Model Plan berisi nama dan daftar tugas
class Plan {
  final String name; // nama plan
  final List<Task> tasks; // daftar tugas
  
  const Plan({this.name = '', this.tasks = const []}); // konstruktor
}

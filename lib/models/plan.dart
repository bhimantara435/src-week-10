import './task.dart';

// Model Plan berisi nama dan daftar tugas
class Plan {
  final String name; // nama plan
  final List<Task> tasks; // daftar tugas

  const Plan({this.name = '', this.tasks = const []}); // konstruktor

  // Menghitung jumlah tugas yang sudah selesai
  int get completedCount =>
      tasks.where((task) => task.complete).length;

  // Pesan ringkasan progres penyelesaian tugas
  String get completenessMessage =>
      '$completedCount out of ${tasks.length} tasks';
}

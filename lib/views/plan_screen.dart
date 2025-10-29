import '../models/data_layer.dart';
import 'package:flutter/material.dart';

// Langkah 6: Membuat StatefulWidget bernama PlanScreen
class PlanScreen extends StatefulWidget {
  const PlanScreen({super.key});

  @override
  State createState() => _PlanScreenState();
}

// Langkah 7: Inisialisasi objek Plan dan mulai membangun tampilan dasar
class _PlanScreenState extends State<PlanScreen> {
  Plan plan = const Plan();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Langkah 8: Menambahkan AppBar, ListView, dan FloatingActionButton
      appBar: AppBar(title: const Text('Master Plan Bhimantara')),
      body: _buildList(),
      floatingActionButton: _buildAddTaskButton(),
    );
  }

  // Langkah 7: Membuat method tombol tambah task baru
  Widget _buildAddTaskButton() {
    return FloatingActionButton(
      child: const Icon(Icons.add),
      onPressed: () {
        setState(() {
          plan = Plan(
            name: plan.name,
            tasks: List<Task>.from(plan.tasks)
              ..add(const Task()),
          );
        });
      },
    );
  }

  // Langkah 8: Menampilkan daftar task secara dinamis menggunakan ListView
  Widget _buildList() {
    return ListView.builder(
      itemCount: plan.tasks.length,
      itemBuilder: (context, index) =>
          _buildTaskTile(plan.tasks[index], index),
    );
  }

  // Langkah 9: Membuat widget ListTile untuk setiap item task
  Widget _buildTaskTile(Task task, int index) {
    return ListTile(
      // Checkbox untuk menandai status selesai/tidak
      leading: Checkbox(
        value: task.complete,
        onChanged: (selected) {
          setState(() {
            plan = Plan(
              name: plan.name,
              tasks: List<Task>.from(plan.tasks)
                ..[index] = Task(
                  description: task.description,
                  complete: selected ?? false,
                ),
            );
          });
        },
      ),
      // TextFormField untuk menulis/mengubah deskripsi task
      title: TextFormField(
        initialValue: task.description,
        onChanged: (text) {
          setState(() {
            plan = Plan(
              name: plan.name,
              tasks: List<Task>.from(plan.tasks)
                ..[index] = Task(
                  description: text,
                  complete: task.complete,
                ),
            );
          });
        },
      ),
    );
  }
}

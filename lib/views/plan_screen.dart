import 'package:flutter/material.dart';
import '../models/data_layer.dart';
import '../provider/plan_provider.dart';

class PlanScreen extends StatefulWidget {
  const PlanScreen({super.key});

  @override
  State createState() => _PlanScreenState();
}

class _PlanScreenState extends State<PlanScreen> {
  // ⚠️ Langkah 4: variabel plan lokal DIHAPUS
  // Plan plan = const Plan();

  late ScrollController scrollController;

  @override
  void initState() {
    super.initState();
    scrollController = ScrollController()
      ..addListener(() {
        FocusScope.of(context).requestFocus(FocusNode());
      });
  }

  @override
  void dispose() {
    scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // 🔹 Ambil data Plan dari PlanProvider (Langkah 5/6)
    final plan = PlanProvider.of(context);

    return Scaffold(
      appBar: AppBar(title: const Text('Master Plan Bhimantara')),
      body: _buildList(plan),
      floatingActionButton: _buildAddTaskButton(plan),
    );
  }

  // Tombol untuk menambah task baru
  Widget _buildAddTaskButton(Plan plan) {
    return FloatingActionButton(
      child: const Icon(Icons.add),
      onPressed: () {
        final tasks = List<Task>.from(plan.tasks)..add(const Task());
        PlanProvider.of(context, listen: false).value =
            Plan(name: plan.name, tasks: tasks);
      },
    );
  }

  // ListView yang menampilkan semua task
  Widget _buildList(Plan plan) {
    return ListView.builder(
      controller: scrollController,
      keyboardDismissBehavior:
          Theme.of(context).platform == TargetPlatform.iOS
              ? ScrollViewKeyboardDismissBehavior.onDrag
              : ScrollViewKeyboardDismissBehavior.manual,
      itemCount: plan.tasks.length,
      itemBuilder: (context, index) =>
          _buildTaskTile(plan, plan.tasks[index], index),
    );
  }

  // Tiap item daftar task
  Widget _buildTaskTile(Plan plan, Task task, int index) {
    return ListTile(
      leading: Checkbox(
        value: task.complete,
        onChanged: (selected) {
          final tasks = List<Task>.from(plan.tasks)
            ..[index] = Task(
              description: task.description,
              complete: selected ?? false,
            );
          PlanProvider.of(context, listen: false).value =
              Plan(name: plan.name, tasks: tasks);
        },
      ),
      title: TextFormField(
        initialValue: task.description,
        onChanged: (text) {
          final tasks = List<Task>.from(plan.tasks)
            ..[index] = Task(description: text, complete: task.complete);
          PlanProvider.of(context, listen: false).value =
              Plan(name: plan.name, tasks: tasks);
        },
      ),
    );
  }
}

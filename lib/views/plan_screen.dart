import 'package:flutter/material.dart';
import '../models/data_layer.dart';
import '../provider/plan_provider.dart';

class PlanScreen extends StatefulWidget {
  const PlanScreen({super.key});

  @override
  State createState() => _PlanScreenState();
}

class _PlanScreenState extends State<PlanScreen> {
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
    final plan = PlanProvider.of(context).value; // gunakan .value karena PlanProvider memakai ValueNotifier

    return Scaffold(
      appBar: AppBar(title: const Text('Master Plan Bhimantara')),
      body: _buildList(context, plan),
      floatingActionButton: _buildAddTaskButton(context),
    );
  }

  // Langkah 5: versi baru dengan parameter BuildContext dan PlanProvider
  Widget _buildAddTaskButton(BuildContext context) {
    ValueNotifier<Plan> planNotifier = PlanProvider.of(context);
    return FloatingActionButton(
      child: const Icon(Icons.add),
      onPressed: () {
        Plan currentPlan = planNotifier.value;
        planNotifier.value = Plan(
          name: currentPlan.name,
          tasks: List<Task>.from(currentPlan.tasks)..add(const Task()),
        );
      },
    );
  }

  // ListView yang menampilkan semua task
  Widget _buildList(BuildContext context, Plan plan) {
    return ListView.builder(
      controller: scrollController,
      keyboardDismissBehavior:
          Theme.of(context).platform == TargetPlatform.iOS
              ? ScrollViewKeyboardDismissBehavior.onDrag
              : ScrollViewKeyboardDismissBehavior.manual,
      itemCount: plan.tasks.length,
      itemBuilder: (context, index) =>
          _buildTaskTile(context, plan, plan.tasks[index], index),
    );
  }

  // Tiap item daftar task
  Widget _buildTaskTile(
      BuildContext context, Plan plan, Task task, int index) {
    ValueNotifier<Plan> planNotifier = PlanProvider.of(context);

    return ListTile(
      leading: Checkbox(
        value: task.complete,
        onChanged: (selected) {
          final tasks = List<Task>.from(plan.tasks)
            ..[index] = Task(
              description: task.description,
              complete: selected ?? false,
            );
          planNotifier.value = Plan(name: plan.name, tasks: tasks);
        },
      ),
      title: TextFormField(
        initialValue: task.description,
        onChanged: (text) {
          final tasks = List<Task>.from(plan.tasks)
            ..[index] = Task(description: text, complete: task.complete);
          planNotifier.value = Plan(name: plan.name, tasks: tasks);
        },
      ),
    );
  }
}

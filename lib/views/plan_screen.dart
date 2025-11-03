import 'package:flutter/material.dart';
import '../models/data_layer.dart';
import '../provider/plan_provider.dart';

class PlanScreen extends StatefulWidget {
  final Plan plan; // Menyimpan plan yang sedang digunakan

  const PlanScreen({super.key, required this.plan});

  @override
  State createState() => _PlanScreenState();
}

class _PlanScreenState extends State<PlanScreen> {
  late ScrollController scrollController;

  // Langkah 5 – Getter untuk mengakses plan dengan mudah
  Plan get plan => widget.plan;

  @override
  void initState() {
    super.initState();

    // Langkah 6 – Inisialisasi ScrollController
    // ScrollController digunakan untuk memantau pergerakan daftar (ListView)
    // addListener() memastikan keyboard akan otomatis tertutup saat pengguna menggulir layar
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
    // Langkah 7 – Gunakan ValueNotifier<List<Plan>> untuk menampung beberapa plan
    // Kode ini mengambil data plan dari PlanProvider dalam bentuk list,
    // lalu menampilkan plan yang sedang aktif menggunakan ValueListenableBuilder
    ValueNotifier<List<Plan>> plansNotifier = PlanProvider.of(context);

    return Scaffold(
      appBar: AppBar(title: Text(plan.name)),
      body: ValueListenableBuilder<List<Plan>>(
        valueListenable: plansNotifier,
        builder: (context, plans, child) {
          // Mengambil plan yang sesuai dengan plan saat ini dari daftar plans
          Plan currentPlan = plans.firstWhere((p) => p.name == plan.name);
          return Column(
            children: [
              Expanded(child: _buildList(currentPlan)),
              SafeArea(
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Text(
                    currentPlan.completenessMessage,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
            ],
          );
        },
      ),
      floatingActionButton: _buildAddTaskButton(context),
    );
  }

  Widget _buildAddTaskButton(BuildContext context) {
    ValueNotifier<List<Plan>> plansNotifier = PlanProvider.of(context);
    return FloatingActionButton(
      child: const Icon(Icons.add),
      onPressed: () {
        List<Plan> currentPlans = List.from(plansNotifier.value);
        int index = currentPlans.indexWhere((p) => p.name == plan.name);

        if (index != -1) {
          Plan updatedPlan = Plan(
            name: currentPlans[index].name,
            tasks: List<Task>.from(currentPlans[index].tasks)..add(const Task()),
          );
          currentPlans[index] = updatedPlan;
          plansNotifier.value = currentPlans;
        }
      },
    );
  }

  Widget _buildList(Plan plan) {
    return ListView.builder(
      controller: scrollController,
      itemCount: plan.tasks.length,
      itemBuilder: (context, index) =>
          _buildTaskTile(plan.tasks[index], index, context),
    );
  }

  // Langkah 8 – Ubah method _buildTaskTile agar sesuai dengan List<Plan>
  // Sekarang perubahan task langsung memperbarui daftar List<Plan> di PlanProvider
  Widget _buildTaskTile(Task task, int index, BuildContext context) {
    ValueNotifier<List<Plan>> planNotifier = PlanProvider.of(context);

    return ListTile(
      leading: Checkbox(
        value: task.complete,
        onChanged: (selected) {
          Plan currentPlan = plan;
          int planIndex =
              planNotifier.value.indexWhere((p) => p.name == currentPlan.name);

          // Perbarui daftar plan dengan menyalin seluruh data lalu ubah task sesuai index
          planNotifier.value = List<Plan>.from(planNotifier.value)
            ..[planIndex] = Plan(
              name: currentPlan.name,
              tasks: List<Task>.from(currentPlan.tasks)
                ..[index] = Task(
                  description: task.description,
                  complete: selected ?? false,
                ),
            );
        },
      ),
      title: TextFormField(
        initialValue: task.description,
        onChanged: (text) {
          Plan currentPlan = plan;
          int planIndex =
              planNotifier.value.indexWhere((p) => p.name == currentPlan.name);

          // Setiap kali teks berubah, buat salinan daftar plan baru dengan task yang diperbarui
          planNotifier.value = List<Plan>.from(planNotifier.value)
            ..[planIndex] = Plan(
              name: currentPlan.name,
              tasks: List<Task>.from(currentPlan.tasks)
                ..[index] = Task(
                  description: text,
                  complete: task.complete,
                ),
            );
        },
      ),
    );
  }
}

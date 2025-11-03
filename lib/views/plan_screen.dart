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
    final plan = PlanProvider.of(context).value;

    return Scaffold(
      appBar: AppBar(title: const Text('Master Plan Bhimantara')),
      //  Langkah 8: Ubah body menjadi Column
      body: Column(
        children: [
          //  membungkus daftar task dengan Expanded agar ListView mengisi ruang tersisa
          Expanded(child: _buildList(plan)),

          // menambahkan footer progress di bagian bawah layar
          Container(
            padding: const EdgeInsets.all(16),
            color: Colors.purple.shade50, // warna latar lembut
            width: double.infinity,
            child: Text(
              plan.completenessMessage, // menampilkan "x out of y tasks"
              textAlign: TextAlign.center,
              style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
            ),
          ),
        ],
      ),
      floatingActionButton: _buildAddTaskButton(context),
    );
  }

  //  Langkah 5: Tombol tambah task baru
  Widget _buildAddTaskButton(BuildContext context) {
    ValueNotifier<Plan> planNotifier = PlanProvider.of(context);
    return FloatingActionButton(
      child: const Icon(Icons.add),
      onPressed: () {
        Plan currentPlan = planNotifier.value;
        // setiap kali tombol ditekan, tambahkan task kosong baru ke daftar
        planNotifier.value = Plan(
          name: currentPlan.name,
          tasks: List<Task>.from(currentPlan.tasks)..add(const Task()),
        );
      },
    );
  }

  // Langkah 7: ListView builder
  Widget _buildList(Plan plan) {
    return ListView.builder(
      controller: scrollController,
      itemCount: plan.tasks.length,
      itemBuilder: (context, index) =>
          _buildTaskTile(plan.tasks[index], index, context), // kirim context ke _buildTaskTile
    );
  }

  //  Langkah 6: Tiap item daftar task
  Widget _buildTaskTile(Task task, int index, BuildContext context) {
    ValueNotifier<Plan> planNotifier = PlanProvider.of(context);
    return ListTile(
      // Checkbox untuk menandai task selesai atau belum
      leading: Checkbox(
        value: task.complete,
        onChanged: (selected) {
          Plan currentPlan = planNotifier.value;
          planNotifier.value = Plan(
            name: currentPlan.name,
            // perbarui status task ke true/false sesuai input user
            tasks: List<Task>.from(currentPlan.tasks)
              ..[index] = Task(
                description: task.description,
                complete: selected ?? false,
              ),
          );
        },
      ),
      // TextFormField untuk mengubah deskripsi task
      title: TextFormField(
        initialValue: task.description,
        onChanged: (text) {
          Plan currentPlan = planNotifier.value;
          planNotifier.value = Plan(
            name: currentPlan.name,
            // simpan teks baru ke task sesuai index
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

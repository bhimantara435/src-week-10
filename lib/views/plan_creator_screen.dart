import 'package:flutter/material.dart';
import '../models/data_layer.dart';
import '../models/plan_provider.dart';
import 'plan_screen.dart';

class PlanCreatorScreen extends StatefulWidget {
  const PlanCreatorScreen({super.key});

  @override
  State<PlanCreatorScreen> createState() => _PlanCreatorScreenState();
}

// Langkah 10 – Tambahkan class _PlanCreatorScreenState
class _PlanCreatorScreenState extends State<PlanCreatorScreen> {
  // Langkah 10 – Membuat controller untuk mengatur input teks
  final textController = TextEditingController();

  // Langkah 13 – Tambahkan method addPlan()
  void addPlan() {
    final text = textController.text;

    if (text.isEmpty) {
      return;
    }

    final plan = Plan(name: text, tasks: []);
    ValueNotifier<List<Plan>> planNotifier = PlanProvider.of(context);

    planNotifier.value = List<Plan>.from(planNotifier.value)..add(plan);

    textController.clear();
    FocusScope.of(context).requestFocus(FocusNode());
    setState(() {});
  }

  // Langkah 11 – Tambahkan method build()
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Ganti "Namaku" dengan nama kamu sendiri
      appBar: AppBar(title: const Text('Master Plans Bhimantara')),
      body: Column(
        children: [
          _buildListCreator(),
          Expanded(child: _buildMasterPlans()),
        ],
      ),
    );
  }

  // Langkah 12 – Tambahkan widget _buildListCreator()
  Widget _buildListCreator() {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Material(
        color: Theme.of(context).cardColor,
        elevation: 10,
        child: TextField(
          controller: textController,
          decoration: const InputDecoration(
            labelText: 'Add a plan',
            contentPadding: EdgeInsets.all(20),
          ),
          onEditingComplete: addPlan,
        ),
      ),
    );
  }

  @override
  void dispose() {
    // Langkah 10 – Membersihkan controller untuk mencegah kebocoran memori
    textController.dispose();
    super.dispose();
  }
}
  

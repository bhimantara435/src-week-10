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

  @override
  void dispose() {
    // Langkah 10 – Membersihkan controller untuk mencegah kebocoran memori
    textController.dispose();
    super.dispose();
  }
}

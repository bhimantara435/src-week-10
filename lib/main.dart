import 'package:flutter/material.dart';
import './views/plan_screen.dart';

// Fungsi utama menjalankan aplikasi
void main() => runApp(MasterPlanApp());

// Widget utama aplikasi
class MasterPlanApp extends StatelessWidget {
  const MasterPlanApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(primarySwatch: Colors.purple), // tema utama
      home: PlanScreen(), // halaman awal
    );
  }
}

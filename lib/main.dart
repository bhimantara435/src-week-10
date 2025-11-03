import 'package:flutter/material.dart';
import './views/plan_creator_screen.dart';
import './models/data_layer.dart';
import './provider/plan_provider.dart';

void main() => runApp(const MasterPlanApp());

class MasterPlanApp extends StatelessWidget {
  const MasterPlanApp({super.key});

  @override
  Widget build(BuildContext context) {
    return PlanProvider(
      notifier: ValueNotifier<List<Plan>>(const []), // menggunakan List<Plan>
      child: MaterialApp(
        title: 'State management app',
        theme: ThemeData(primarySwatch: Colors.purple),
        home: const PlanCreatorScreen(), // halaman utama aplikasi
      ),
    );
  }
}

import 'package:flutter/material.dart';
import '../models/data_layer.dart';

class PlanScreen extends StatelessWidget {
  final Plan plan;
  const PlanScreen({super.key, required this.plan});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(plan.name)),
      body: Center(
        child: Text(plan.completenessMessage),
      ),
    );
  }
}

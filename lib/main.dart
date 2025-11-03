import 'package:flutter/material.dart';
import './models/data_layer.dart';
import './provider/plan_provider.dart';
import './views/plan_creator_screen.dart';

void main() => runApp(const MasterPlanApp());

class MasterPlanApp extends StatelessWidget {
  const MasterPlanApp({super.key});

  @override
  Widget build(BuildContext context) {
    return PlanProvider(
      notifier: ValueNotifier<List<Plan>>([
        Plan(
          name: 'Try to take over the world',
          tasks: [
            Task(isComplete: true),
            Task(isComplete: false),
            Task(isComplete: false),
          ],
        ),
        Plan(
          name: 'Invent New Form of Cheese',
          tasks: List.generate(14, (_) => Task(isComplete: false)),
        ),
        Plan(
          name: 'Learn Flutter',
          tasks: List.generate(14, (i) => Task(isComplete: i < 6)),
        ),
      ]),
      child: MaterialApp(
        title: 'State management app',
        theme: ThemeData(primarySwatch: Colors.purple),
        home: const PlanCreatorScreen(),
      ),
    );
  }
}

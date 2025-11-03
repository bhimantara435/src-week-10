import 'package:flutter/material.dart';
import '../models/data_layer.dart';

class PlanProvider extends InheritedNotifier<ValueNotifier<List<Plan>>> {
  const PlanProvider({
    super.key,
    required super.notifier,
    required super.child,
  });

  static ValueNotifier<List<Plan>> of(BuildContext context) {
    final PlanProvider? provider =
        context.dependOnInheritedWidgetOfExactType<PlanProvider>();
    return provider!.notifier!;
  }
}

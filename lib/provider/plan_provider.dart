import 'package:flutter/material.dart';
import '../models/data_layer.dart';

// Mendukung daftar (List) dari beberapa Plan
class PlanProvider extends InheritedNotifier<ValueNotifier<List<Plan>>> {
  const PlanProvider({
    super.key,
    required super.notifier,
    required super.child,
  });

  // Method 'of' digunakan untuk mengambil data dari provider di widget tree
  static ValueNotifier<List<Plan>> of(BuildContext context) {
    final PlanProvider? provider =
        context.dependOnInheritedWidgetOfExactType<PlanProvider>();
    return provider!.notifier!;
  }
}

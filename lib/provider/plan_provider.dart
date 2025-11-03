import 'package:flutter/material.dart';
import '../models/data_layer.dart';

// Langkah 1: Ubah PlanProvider agar mendukung daftar (List) dari beberapa Plan
class PlanProvider extends InheritedNotifier<ValueNotifier<List<Plan>>> {
  const PlanProvider({
    super.key,
    required Widget child,
    required ValueNotifier<List<Plan>> notifier,
  }) : super(child: child, notifier: notifier);

  // Method 'of' digunakan untuk mengambil data dari provider di widget tree
  static ValueNotifier<List<Plan>> of(BuildContext context) {
    return context
        .dependOnInheritedWidgetOfExactType<PlanProvider>()!
        .notifier!;
  }
}

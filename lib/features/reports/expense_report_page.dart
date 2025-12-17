import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../core/constants/app_strings.dart';
import '../../navigation/drawer_menu.dart';

class ExpenseReportPage extends ConsumerWidget {
  const ExpenseReportPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(AppStrings.expenseReport),
      ),
      drawer: const DrawerMenu(),
      body: const Center(
        child: Text('Expense Report - Coming Soon'),
      ),
    );
  }
}

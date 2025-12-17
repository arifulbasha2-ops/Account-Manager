import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../core/constants/app_strings.dart';
import '../../navigation/drawer_menu.dart';

class LoanDirectoryPage extends ConsumerWidget {
  const LoanDirectoryPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(AppStrings.loanManagement),
      ),
      drawer: const DrawerMenu(),
      body: const Center(
        child: Text('Loan Directory - Coming Soon'),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Add new loan
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}

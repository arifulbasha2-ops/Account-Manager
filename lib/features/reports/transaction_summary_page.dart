import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../core/constants/app_strings.dart';
import '../../navigation/drawer_menu.dart';

class TransactionSummaryPage extends ConsumerWidget {
  const TransactionSummaryPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Transaction Summary'),
      ),
      drawer: const DrawerMenu(),
      body: const Center(
        child: Text('Transaction Summary - Coming Soon'),
      ),
    );
  }
}

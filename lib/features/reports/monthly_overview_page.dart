import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../core/constants/app_strings.dart';
import '../../navigation/drawer_menu.dart';

class MonthlyOverviewPage extends ConsumerWidget {
  const MonthlyOverviewPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(AppStrings.monthlyOverview),
      ),
      drawer: const DrawerMenu(),
      body: const Center(
        child: Text('Monthly Overview - Coming Soon'),
      ),
    );
  }
}

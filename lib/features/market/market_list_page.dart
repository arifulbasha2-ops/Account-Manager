import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../core/constants/app_strings.dart';
import '../../navigation/drawer_menu.dart';

class MarketListPage extends ConsumerWidget {
  const MarketListPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(AppStrings.market),
      ),
      drawer: const DrawerMenu(),
      body: const Center(
        child: Text('Market List - Coming Soon'),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Add new market item
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}

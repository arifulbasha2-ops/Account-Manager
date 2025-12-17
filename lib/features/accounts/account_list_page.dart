import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../core/constants/app_strings.dart';
import '../../navigation/drawer_menu.dart';

class AccountListPage extends ConsumerWidget {
  const AccountListPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(AppStrings.accountsList),
      ),
      drawer: const DrawerMenu(),
      body: const Center(
        child: Text('Accounts List - Coming Soon'),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Add new account
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}

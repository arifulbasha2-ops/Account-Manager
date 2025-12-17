import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../core/constants/app_strings.dart';
import '../core/constants/route_names.dart';
import '../providers/providers.dart';

class DrawerMenu extends ConsumerWidget {
  const DrawerMenu({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isDarkMode = ref.watch(themeProvider);

    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          DrawerHeader(
            decoration: BoxDecoration(
              color: Theme.of(context).primaryColor,
            ),
            child: const Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  AppStrings.appName,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 8),
                Text(
                  'v${AppStrings.appVersion}',
                  style: TextStyle(
                    color: Colors.white70,
                    fontSize: 12,
                  ),
                ),
              ],
            ),
          ),
          ListTile(
            leading: const Icon(Icons.calendar_today),
            title: const Text(AppStrings.monthlyOverview),
            onTap: () {
              Navigator.pop(context);
              // Navigate to monthly overview
            },
          ),
          ListTile(
            leading: const Icon(Icons.calendar_view_month),
            title: const Text(AppStrings.yearlyOverview),
            onTap: () {
              Navigator.pop(context);
              // Navigate to yearly overview
            },
          ),
          ListTile(
            leading: const Icon(Icons.people),
            title: const Text(AppStrings.loanManagement),
            onTap: () {
              Navigator.pop(context);
              // Navigate to loan management
            },
          ),
          const Divider(),
          ListTile(
            leading: const Icon(Icons.account_balance_wallet),
            title: const Text(AppStrings.accountsList),
            onTap: () {
              Navigator.pop(context);
              // Navigate to accounts
            },
          ),
          const Divider(),
          ListTile(
            leading: const Icon(Icons.brightness_4),
            title: Text(isDarkMode ? AppStrings.lightMode : AppStrings.darkMode),
            onTap: () {
              ref.read(themeProvider.notifier).state = !isDarkMode;
              Navigator.pop(context);
            },
          ),
          ListTile(
            leading: const Icon(Icons.info),
            title: const Text('About'),
            onTap: () {
              Navigator.pop(context);
              showAboutDialog(
                context: context,
                applicationName: AppStrings.appName,
                applicationVersion: AppStrings.appVersion,
              );
            },
          ),
        ],
      ),
    );
  }
}

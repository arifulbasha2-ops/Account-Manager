import 'package:flutter/material.dart';
import '../core/constants/app_strings.dart';

class BottomNavBar extends StatelessWidget {
  final int currentIndex;
  final Function(int) onTap;

  const BottomNavBar({
    Key? key,
    required this.currentIndex,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: currentIndex,
      onTap: onTap,
      items: const [
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: AppStrings.transactions,
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.shopping_bag),
          label: AppStrings.market,
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.assessment),
          label: 'Report',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.show_chart),
          label: 'Summary',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.more_vert),
          label: 'More',
        ),
      ],
    );
  }
}

import 'package:flutter/material.dart';

class CendNavBar extends StatelessWidget {
  final int selectedIndex;
  final ValueChanged<int> onTap;

  const CendNavBar({Key? key, required this.onTap, required this.selectedIndex})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      elevation: 10,
      showSelectedLabels: false,
      showUnselectedLabels: false,
      selectedIconTheme: const IconThemeData(size: 30),
      unselectedIconTheme: const IconThemeData(size: 25),
      currentIndex: selectedIndex,
      onTap: onTap,
      items: const [
        BottomNavigationBarItem(icon: Icon(Icons.messenger_outline), label: ''),
        BottomNavigationBarItem(icon: Icon(Icons.view_list_outlined), label: ''),
        BottomNavigationBarItem(icon: Icon(Icons.assignment_ind_outlined), label: ''),
        BottomNavigationBarItem(icon: Icon(Icons.settings_outlined), label: '')
      ],
    );
  }
}

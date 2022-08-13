import 'package:flutter/material.dart';

class BottomNavigation extends StatelessWidget {
  const BottomNavigation({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      backgroundColor: Colors.black,
      selectedItemColor: Colors.white,
      unselectedItemColor: Colors.grey,
      items: [
        bottomItems(icn: Icons.home, label: 'Home'),
        bottomItems(icn: Icons.collections, label: 'New & Hot'),
        bottomItems(icn: Icons.emoji_emotions, label: 'Fast Laughs'),
        bottomItems(icn: Icons.search_sharp, label: 'Search'),
        bottomItems(icn: Icons.arrow_circle_down_sharp, label: 'Downloads')
      ],
    );
  }

  bottomItems({required IconData icn, required String label}) {
    return BottomNavigationBarItem(icon: Icon(icn), label: label);
  }
}

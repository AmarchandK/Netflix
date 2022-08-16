import 'package:flutter/material.dart';

ValueNotifier<int> indexnotifier = ValueNotifier(0);

class BottomNavigation extends StatelessWidget {
  const BottomNavigation({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
        valueListenable: indexnotifier,
        builder: (BuildContext context, int screenIndex, _) {
          return BottomNavigationBar(
            currentIndex: screenIndex,
            onTap: (curentIndex) {
              indexnotifier.value = curentIndex;
            },
            type: BottomNavigationBarType.fixed,
            backgroundColor: Colors.black,
            selectedItemColor: Colors.white,
            unselectedItemColor: Colors.grey,
            items: [
              bottomItems(icn: Icons.home, label: 'Home'),
              bottomItems(
                  icn: Icons.video_collection_outlined, label: 'New & Hot'),
              bottomItems(
                  icn: Icons.emoji_emotions_outlined, label: 'Fast Laughs'),
              bottomItems(icn: Icons.search_sharp, label: 'Search'),
              bottomItems(
                  icn: Icons.arrow_circle_down_sharp, label: 'Downloads')
            ],
          );
        });
  }

  bottomItems({required IconData icn, required String label}) {
    return BottomNavigationBarItem(icon: Icon(icn), label: label);
  }
}

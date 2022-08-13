import 'package:flutter/material.dart';
import 'package:netflix/core/colors/colors.dart';
import 'package:netflix/presentaion/downloads/downlods.dart';
import 'package:netflix/presentaion/fast_laugh_page/fast_laugh.dart';
import 'package:netflix/presentaion/home_page/homepage.dart';
import 'package:netflix/presentaion/main_page/bottom_nav/bottom_nav.dart';
import 'package:netflix/presentaion/new&hot/new&hot_page.dart';
import 'package:netflix/presentaion/serch_page/search_page.dart';

class MainPageScreen extends StatelessWidget {
  const MainPageScreen({Key? key}) : super(key: key);
  final List screens = const [
    HomeScreen(),
    NewAndHotScreen(),
    FastLaughScreen(),
    SearchScreen(),
    DownloadScreen()
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgColor,
      body: SafeArea(
        child: ValueListenableBuilder(
          valueListenable: indexnotifier,
          builder: (BuildContext context, int screenIndex, Widget? child) {
            return screens[screenIndex];
          },
        ),
      ),
      bottomNavigationBar: const BottomNavigation(),
    );
  }
}

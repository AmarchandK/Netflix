import 'package:flutter/material.dart';
import 'package:netflix/presentaion/fast_laugh_page/widgets/video_lists.dart';

class FastLaughScreen extends StatelessWidget {
  const FastLaughScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        scrollDirection: Axis.vertical,
        children: List.generate(
          10,
          (index) => VideoItems(
            index: index,
          ),
        ),
      ),
    );
  }
}

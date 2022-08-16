import 'package:flutter/cupertino.dart';
import 'package:netflix/core/const.dart';
import 'package:netflix/presentaion/widget_refactories/title.dart';

class SearchIdleWidget extends StatelessWidget {
  const SearchIdleWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const MainTitles(
          title: 'Top Searches',
        ),
        Expanded(
          child: ListView.separated(
              shrinkWrap: true,
              itemBuilder: (context, index) => const TopSearchItemTile(),
              separatorBuilder: (context, index) => heightGap,
              itemCount: 10),
        ),
      ],
    );
  }
}

class TopSearchItemTile extends StatelessWidget {
  const TopSearchItemTile({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;

    return Row(
      children: [
        Container(
          width: width / 3,
          height: 65,
          decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage('assets/search/netflix-logo.png'),
                fit: BoxFit.fill),
          ),
        ),
        const Expanded(
          child: Text(
            'Movie Name',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
        ),
        const Icon(
          CupertinoIcons.play_circle,
          color: colorWhite,
          size: 50,
        ),
      ],
    );
  }
}

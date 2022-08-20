// ignore_for_file: no_leading_underscores_for_local_identifiers

import 'package:flutter/material.dart';
import 'package:netflix/core/const.dart';
import 'package:netflix/core/const_strings.dart';
import 'package:netflix/domain/home/model/home_repo.dart';
import 'package:netflix/presentaion/widget_refactories/title.dart';

class MainCardsHome extends StatelessWidget {
  final String title;
  final List<HomeData> data;
  const MainCardsHome({
    required this.title,
    Key? key,
    required this.data,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        MainTitles(title: title),
        heightGap,
        LimitedBox(
          maxHeight: 250,
          child: ListView(
            scrollDirection: Axis.horizontal,
            children: List.generate(
              data.length,
              (index) {
                final newData = data[index];
                return HomeCard(
                  data: newData,
                );
              },
            ),
          ),
        )
      ],
    );
  }
}

class HomeCard extends StatelessWidget {
  final HomeData data;
  const HomeCard({
    Key? key,
    required this.data,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _height = MediaQuery.of(context).size.height;
    final _width = MediaQuery.of(context).size.width;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Container(
        height: _height / 2.5,
        width: _width / 2,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          image: DecorationImage(
            fit: BoxFit.fill,
            image: NetworkImage('$imageAppendURL${data.posterPath}'),
          ),
        ),
      ),
    );
  }
}

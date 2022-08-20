// ignore_for_file: no_leading_underscores_for_local_identifiers

import 'package:flutter/material.dart';
import 'package:netflix/core/const.dart';
import 'package:netflix/presentaion/home_page/widgets/baground_card.dart';
import 'package:netflix/presentaion/new&hot/widgets/coming_soon.dart';
import 'package:netflix/presentaion/new&hot/widgets/video_widget.dart';

class EveryoneWatching extends StatelessWidget {
  final String posterPath;
  final String movieName;
  final String description;
  const EveryoneWatching(
      {Key? key,
      required this.posterPath,
      required this.movieName,
      required this.description})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _width = MediaQuery.of(context).size.width;
    final _height = MediaQuery.of(context).size.height;
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            movieName,
            style: const TextStyle(fontSize: 25, fontWeight: FontWeight.w900),
          ),
          heightGap,
          SizedBox(width: _width - 50, child: textSyle(title: description)),
          const SizedBox(
            height: 40,
          ),
          VideoWidget(
            imageaurl: posterPath,
            width: _width,
            height: _height,
          ),
          heightGap,
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: const [
              CustomButtonWidget(icn: Icons.send, name: 'Share'),
              widthGaps,
              CustomButtonWidget(icn: Icons.add, name: 'My List'),
              widthGaps,
              CustomButtonWidget(icn: Icons.play_arrow, name: 'Play'),
              widthGaps,
            ],
          )
        ],
      ),
    );
  }
}

// ignore_for_file: no_leading_underscores_for_local_identifiers

import 'package:flutter/material.dart';
import 'package:netflix/core/const.dart';
import 'package:netflix/presentaion/home_page/widgets/baground_card.dart';
import 'package:netflix/presentaion/new&hot/widgets/video_widget.dart';

class ComingSoonWidget extends StatelessWidget {
  final String id;
  final String month;
  final String day;
  final String posterPath;
  final String movieName;
  final String description;
  const ComingSoonWidget(
      {Key? key,
      required this.id,
      required this.month,
      required this.day,
      required this.posterPath,
      required this.movieName,
      required this.description})
      : super(key: key);

  // @override
  @override
  Widget build(BuildContext context) {
    final _height = MediaQuery.of(context).size.height;
    final _width = MediaQuery.of(context).size.width;
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          width: 50,
          height: _height / 1.7,
          child: Column(
            children: [
              Text(
                month,
                style: const TextStyle(
                    color: colorGrey,
                    fontWeight: FontWeight.bold,
                    fontSize: 15),
              ),
              Text(
                day,
                style: const TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 5),
              )
            ],
          ),
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              child: VideoWidget(
                imageaurl: posterPath,
                width: _width - 50,
                height: _height,
              ),
            ),
            SizedBox(
              width: _width - 50,
              child: Row(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Text(
                      movieName,
                      style: const TextStyle(
                          fontSize: 30,
                          overflow: TextOverflow.fade,
                          fontFamily: 'sans',
                          fontWeight: FontWeight.w900,
                          letterSpacing: -2),
                    ),
                  ),
                  const CustomButtonWidget(
                      icn: Icons.notifications, name: 'Notify me'),
                  widthGaps,
                  const CustomButtonWidget(
                      icn: Icons.info_outline_rounded, name: 'Info'),
                ],
              ),
            ),
            heightGap,
            textSyle(title: 'Coming On $month-j$day'),
            heightGap,
            SizedBox(
              width: _width - 50,
              child: Text(
                movieName,
                style: const TextStyle(
                    overflow: TextOverflow.clip,
                    fontSize: 25,
                    fontWeight: FontWeight.bold),
              ),
            ),
            heightGap,
            SizedBox(
              width: _width - 50,
              child: textSyle(
                title: description,
              ),
            )
          ],
        ),
      ],
    );
  }
}

textSyle({required title}) {
  return Text(
    title,
    softWrap: true,
    maxLines: 4,
    style: const TextStyle(
      overflow: TextOverflow.clip,
      fontWeight: FontWeight.bold,
      fontSize: 15,
      color: colorGrey,
    ),
  );
}

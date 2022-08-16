// ignore_for_file: no_leading_underscores_for_local_identifiers

import 'package:flutter/material.dart';
import 'package:netflix/core/const.dart';
import 'package:netflix/presentaion/home_page/widgets/baground_card.dart';
import 'package:netflix/presentaion/new&hot/widgets/video_widget.dart';

textSyle({required title}) {
  return Text(
    title,
    style: const TextStyle(
      fontWeight: FontWeight.bold,
      fontSize: 15,
      color: colorGrey,
    ),
  );
}

class ComingSoonWidget extends StatelessWidget {
  const ComingSoonWidget({Key? key}) : super(key: key);

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
            children: const [
              Text(
                "Feb 7",
                style: TextStyle(
                    color: colorGrey,
                    fontWeight: FontWeight.bold,
                    fontSize: 15),
              ),
              Text(
                '11',
                style: TextStyle(
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
              height: _height / 4.5,
              child: VideoWidget(
                width: _width - 50,
              ),
            ),
            SizedBox(
              width: _width - 50,
              child: Row(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Tall Girl 2',
                    style: TextStyle(
                        fontSize: 40,
                        fontFamily: 'sans',
                        fontWeight: FontWeight.w900,
                        letterSpacing: -2),
                  ),
                  Row(
                    children: const [
                      CustomButtonWidget(
                          icn: Icons.notifications, name: 'Notify me'),
                      widthGaps,
                      CustomButtonWidget(
                          icn: Icons.info_outline_rounded, name: 'Info'),
                    ],
                  ),
                ],
              ),
            ),
            heightGap,
            textSyle(title: 'Coming On Friday'),
            heightGap,
            const Text(
              'Tall Girl 2',
              style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
            ),
            heightGap,
            SizedBox(
              width: _width - 50,
              child: textSyle(
                title:
                    'Landing the lead in the school Musical is a dream come for jodi,untill the pressure sends her confidence - and her relationship- into an tailspin',
              ),
            )
          ],
        ),
      ],
    );
  }
}

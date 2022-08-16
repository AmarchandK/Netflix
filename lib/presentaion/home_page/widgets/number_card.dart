// ignore_for_file: no_leading_underscores_for_local_identifiers

import 'package:bordered_text/bordered_text.dart';
import 'package:flutter/material.dart';
import 'package:netflix/core/const.dart';
import 'package:netflix/presentaion/widget_refactories/title.dart';

class NumberCard extends StatelessWidget {
  const NumberCard({required this.index, Key? key}) : super(key: key);
  final int index;
  @override
  Widget build(BuildContext context) {
    final _height = MediaQuery.of(context).size.height;
    final _width = MediaQuery.of(context).size.width;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Stack(
        children: [
          Row(
            children: [
              const SizedBox(
                width: 40,
              ),
              Container(
                height: _height / 2.5,
                width: _width / 2,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  image: const DecorationImage(
                    fit: BoxFit.fill,
                    image: AssetImage('assets/download/breakingbad.jpg'),
                  ),
                ),
              ),
            ],
          ),
          Positioned(
            left: 10,
            bottom: 10,
            child: BorderedText(
              strokeWidth: 7,
              strokeColor: colorWhite,
              child: Text(
                '${index + 1}',
                style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 120,
                    color: Colors.black,
                    decoration: TextDecoration.none,
                    decorationColor: Colors.black),
              ),
            ),
          )
        ],
      ),
    );
  }
}

class NumberWidget extends StatelessWidget {
  const NumberWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const MainTitles(title: 'Top 10 TV Showa India Today'),
        heightGap,
        LimitedBox(
          maxHeight: 250,
          child: ListView(
            scrollDirection: Axis.horizontal,
            children: List.generate(
              10,
              (index) => NumberCard(
                index: index,
              ),
            ),
          ),
        )
      ],
    );
  }
}

// ignore_for_file: no_leading_underscores_for_local_identifiers

import 'package:flutter/material.dart';
import 'package:netflix/core/const.dart';

class BagroundImage extends StatelessWidget {
  const BagroundImage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _height = MediaQuery.of(context).size.height;

    return Stack(
      children: [
        Container(
          height: _height / 1.25,
          decoration: const BoxDecoration(
            image: DecorationImage(
              fit: BoxFit.fill,
              image: NetworkImage(
                'https://m.media-amazon.com/images/M/MV5BZmQ5OGQ0NjQtNWJmZi00YjgxLTg5NTAtMjc5OTNjZjc0ZTlkXkEyXkFqcGdeQXVyODY5NzkyMjA@._V1_.jpg',
              ),
            ),
          ),
        ),
        Positioned(
          bottom: 0,
          left: 0,
          right: 0,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              const CustomButtonWidget(
                icn: Icons.add,
                name: 'My List',
              ),
              _playButton(),
              const CustomButtonWidget(
                icn: Icons.info_outline,
                name: 'Info',
              ),
            ],
          ),
        )
      ],
    );
  }

  TextButton _playButton() {
    return TextButton.icon(
      style:
          ButtonStyle(backgroundColor: MaterialStateProperty.all(colorWhite)),
      onPressed: null,
      icon: const Icon(Icons.play_arrow, size: 25, color: Colors.black),
      label: const Padding(
        padding: EdgeInsets.symmetric(horizontal: 10),
        child: Text(
          'Play',
          style: TextStyle(fontSize: 18, color: Colors.black),
        ),
      ),
    );
  }
}

class CustomButtonWidget extends StatelessWidget {
  const CustomButtonWidget({
    required this.icn,
    required this.name,
    Key? key,
  }) : super(key: key);
  final IconData icn;
  final String name;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Icon(
          icn,
          size: 30,
        ),
        Text(
          name,
          style: const TextStyle(fontSize: 16),
        )
      ],
    );
  }
}

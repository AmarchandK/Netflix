import 'package:flutter/material.dart';
import 'package:netflix/core/const.dart';

class VideoWidget extends StatelessWidget {
  const VideoWidget({
    Key? key,
    required double width,
  })  : _width = width,
        super(key: key);

  final double _width;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Image.asset(
          'assets/download/bestSeries.jpg',
          fit: BoxFit.fill,
          width: _width,
        ),
        const Positioned(
          bottom: 10,
          right: 0,
          child: CircleAvatar(
            radius: 30,
            backgroundColor: colorTransparent,
            child: IconButton(
              onPressed: null,
              icon: Icon(
                Icons.volume_off,
                color: colorWhite,
              ),
            ),
          ),
        ),
      ],
    );
  }
}

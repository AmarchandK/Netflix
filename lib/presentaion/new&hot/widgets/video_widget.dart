import 'package:flutter/material.dart';
import 'package:netflix/core/const.dart';

class VideoWidget extends StatelessWidget {
  final String imageaurl;
  const VideoWidget({
    Key? key,
    required double width,
    required this.imageaurl, required this.height,
  })  : _width = width,

        super(key: key);

  final double _width;
  final double height;
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Image.network(
          height: height / 4.5,
          imageaurl,
          fit: BoxFit.contain,
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

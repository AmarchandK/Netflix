import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:netflix/core/const.dart';

class VideoItems extends StatelessWidget {
  const VideoItems({Key? key, required this.index}) : super(key: key);
  final int index;
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          color: Colors.accents[index],
        ),
        Align(
          alignment: Alignment.bottomCenter,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CircleAvatar(
                  backgroundColor: Colors.black.withOpacity(0.5),
                  radius: 30,
                  child: const IconButton(
                    onPressed: null,
                    icon: Icon(
                      CupertinoIcons.volume_off,
                      color: colorWhite,
                      size: 30,
                    ),
                  ),
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: const [
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: 10),
                      child: CircleAvatar(
                        radius: 30,
                        backgroundImage:
                            AssetImage('assets/download/breakingbad.jpg'),
                      ),
                    ),
                    VideoActions(
                        icn: Icons.emoji_emotions_outlined, title: 'LOL'),
                    VideoActions(icn: Icons.add_outlined, title: 'My List'),
                    VideoActions(icn: Icons.share, title: 'Share'),
                    VideoActions(
                        icn: CupertinoIcons.play_circle, title: 'Play'),
                  ],
                )
              ],
            ),
          ),
        )
      ],
    );
  }
}

class VideoActions extends StatelessWidget {
  const VideoActions({Key? key, required this.icn, required this.title})
      : super(key: key);
  final IconData icn;
  final String title;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      child: Column(
        children: [
          Icon(
            icn,
            color: colorWhite,
            size: 30,
          ),
          Text(
            title,
            style: const TextStyle(color: colorWhite, fontSize: 16),
          ),
        ],
      ),
    );
  }
}

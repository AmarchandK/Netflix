// ignore_for_file: no_leading_underscores_for_local_identifiers, avoid_types_as_parameter_names, invalid_use_of_protected_member, invalid_use_of_visible_for_testing_member

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:netflix/application/fast_laugh/fast_laugh_bloc.dart';
import 'package:netflix/core/const.dart';
import 'package:netflix/core/const_strings.dart';
import 'package:netflix/domain/downloads/models/downloads.dart';
import 'package:share_plus/share_plus.dart';
import 'package:video_player/video_player.dart';

class VideoItemInheritedWidget extends InheritedWidget {
  final Widget widgetChild;
  final Downloads movieData;

  const VideoItemInheritedWidget(
      {required this.widgetChild, required this.movieData, Key? key})
      : super(key: key, child: widgetChild);

  @override
  bool updateShouldNotify(covariant VideoItemInheritedWidget oldWidget) {
    return oldWidget.movieData != movieData;
  }

  static VideoItemInheritedWidget? of(BuildContext context) {
    return context
        .dependOnInheritedWidgetOfExactType<VideoItemInheritedWidget>();
  }
}

ValueNotifier<Set<int>> likedvideosNotifier = ValueNotifier({});

class VideoItems extends StatelessWidget {
  const VideoItems({Key? key, required this.index}) : super(key: key);
  final int index;
  @override
  Widget build(BuildContext context) {
    final posterPath =
        VideoItemInheritedWidget.of(context)?.movieData.posterPath;
    final videoUrl = videoUrls[index % videoUrls.length];

    return Stack(
      children: [
        FastLaughVideoPlayer(videoUrl: videoUrl, onStatesChange: (bool) {}),
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
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10),
                      child: CircleAvatar(
                        radius: 30,
                        backgroundImage: posterPath == null
                            ? null
                            : NetworkImage('$imageAppendURL$posterPath'),
                      ),
                    ),
                    ValueListenableBuilder(
                      valueListenable: likedvideosNotifier,
                      builder: (BuildContext context, Set<int> newLikedIds,
                          Widget? _) {
                        final _index = index;
                        if (newLikedIds.contains(_index)) {
                          return GestureDetector(
                            onTap: () {
                              likedvideosNotifier.value.remove(_index);
                              likedvideosNotifier.notifyListeners();
                            },
                            child: const VideoActions(
                                icn: Icons.favorite, title: 'Liked'),
                          );
                        }
                        return GestureDetector(
                          onTap: () {
                            likedvideosNotifier.value.add(_index);
                            likedvideosNotifier.notifyListeners();
                          },
                          child: const VideoActions(
                              icn: Icons.emoji_emotions_outlined, title: 'LOL'),
                        );
                      },
                    ),
                    const VideoActions(
                        icn: Icons.add_outlined, title: 'My List'),
                    GestureDetector(
                      onTap: () {
                        final movieName = VideoItemInheritedWidget.of(context)
                            ?.movieData
                            .posterPath;
                        if (movieName != null) {
                          Share.share(movieName);
                        }
                      },
                      child: const VideoActions(
                          icn: Icons.near_me_sharp, title: 'Share'),
                    ),
                    const VideoActions(
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

class FastLaughVideoPlayer extends StatefulWidget {
  final String videoUrl;
  final void Function(bool isPlaying) onStatesChange;
  const FastLaughVideoPlayer(
      {super.key, required this.videoUrl, required this.onStatesChange});

  @override
  State<FastLaughVideoPlayer> createState() => _FastLaughVideoPlayerState();
}

class _FastLaughVideoPlayerState extends State<FastLaughVideoPlayer> {
  late VideoPlayerController _videoPlayerController;
  @override
  void initState() {
    _videoPlayerController = VideoPlayerController.network(widget.videoUrl);
    _videoPlayerController.initialize().then((value) {
      setState(() {});
      _videoPlayerController.play();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: double.infinity,
      width: double.infinity,
      child: _videoPlayerController.value.isInitialized
          ? AspectRatio(
              aspectRatio: _videoPlayerController.value.aspectRatio,
              child: VideoPlayer(_videoPlayerController),
            )
          : const Center(child: spinkit),
    );
  }

  @override
  void dispose() {
    _videoPlayerController.dispose();
    super.dispose();
  }
}

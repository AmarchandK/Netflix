import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:netflix/application/fast_laugh/fast_laugh_bloc.dart';
import 'package:netflix/presentaion/fast_laugh_page/widgets/video_lists.dart';

import '../../core/const.dart';

class FastLaughScreen extends StatelessWidget {
  const FastLaughScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      BlocProvider.of<FastLaughBloc>(context).add(const Initialize());
    });
    return Scaffold(
      body: BlocBuilder<FastLaughBloc, FastLaughState>(
        builder: (context, state) {
          if (state.isLoading) {
            return const Center(
              child: spinkit,
            );
          } else if (state.isError) {
            return const Center(child: Text('Something went wrong!!!'));
          } else if (state.videoList.isEmpty) {
            return const Center(child: Text('Video List is empty'));
          } else {
            return PageView(
              scrollDirection: Axis.vertical,
              children: List.generate(
                state.videoList.length,
                (index) => VideoItemInheritedWidget(
                  movieData: state.videoList[index],
                  widgetChild: VideoItems(
                    index: index,
                    key: Key(index.toString()),
                  ),
                ),
              ),
            );
          }
        },
      ),
    );
  }
}

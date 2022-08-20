import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:netflix/application/search/search_bloc.dart';
import 'package:netflix/core/const.dart';
import 'package:netflix/core/const_strings.dart';
import 'package:netflix/presentaion/widget_refactories/title.dart';

class SearchIdleWidget extends StatelessWidget {
  const SearchIdleWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const MainTitles(
          title: 'Top Searches',
        ),
        Expanded(
          child: BlocBuilder<SearchBloc, SearchState>(
            builder: (context, state) {
              if (state.isloading) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              } else if (state.isError) {
                return const Center(
                  child: Text('Something went Wrong'),
                );
              } else if (state.idleList.isEmpty) {
                return const Center(
                  child: Text('List is empty'),
                );
              }
              // log(state.toString());

              return ListView.separated(
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    final movieDetail = state.idleList[index];
                  
                    return TopSearchItemTile(
                      imageUrl: '$imageAppendURL${movieDetail.posterPath}',
                      title: movieDetail.title ?? 'No Name',
                    );
                  },
                  separatorBuilder: (context, index) => heightGap,
                  itemCount: state.idleList.length);
            },
          ),
        ),
      ],
    );
  }
}

class TopSearchItemTile extends StatelessWidget {
  final String title;
  final String imageUrl;
  const TopSearchItemTile(
      {Key? key, required this.title, required this.imageUrl})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;

    return Row(
      children: [
        Container(
          width: width / 3,
          height: 65,
          decoration: BoxDecoration(
            image: DecorationImage(
                image: NetworkImage(imageUrl), fit: BoxFit.cover),
          ),
        ),
        widthGaps,
        Expanded(
          child: Text(
            title,
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
        ),
        const Icon(
          CupertinoIcons.play_circle,
          color: colorWhite,
          size: 50,
        ),
      ],
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:netflix/application/search/search_bloc.dart';
import 'package:netflix/core/const.dart';
import 'package:netflix/presentaion/widget_refactories/title.dart';

class SearchResultWidget extends StatelessWidget {
  const SearchResultWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const MainTitles(title: 'Movies & TV'),
        heightGap,
        Expanded(child: BlocBuilder<SearchBloc, SearchState>(
          builder: (context, state) {
            return GridView.count(
              shrinkWrap: true,
              childAspectRatio: 1 / 1.4,
              mainAxisSpacing: 10,
              crossAxisSpacing: 10,
              crossAxisCount: 3,
              children: List.generate( 20, (index) {
                final movie = state.searchResultList[index];
                return MainCard(
                  imgeUrl: movie.posterImageUrl,
                );
              }),
            );
          },
        ))
      ],
    );
  }
}

class MainCard extends StatelessWidget {
  const MainCard({Key? key, required this.imgeUrl}) : super(key: key);
  final String imgeUrl;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
        image: DecorationImage(
            image: NetworkImage(
              imgeUrl,
            ),
            fit: BoxFit.fill),
      ),
    );
  }
}

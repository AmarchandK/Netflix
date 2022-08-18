
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:netflix/application/search/search_bloc.dart';
import 'package:netflix/presentaion/search_page/widgets/search_idle.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      BlocProvider.of<SearchBloc>(context).add(const Initialize());
    });
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: CupertinoSearchTextField(
              onChanged: (value) {
             BlocProvider.of<SearchBloc>(context)
                    .add(SearchMovie(movieQuery: value));
             
              },
              style: const TextStyle(color: Colors.white),
              backgroundColor: Colors.grey.withOpacity(0.4),
              prefixIcon: const Icon(
                Icons.search,
                color: Colors.grey,
              ),
              suffixIcon: const Icon(
                Icons.close,
                color: Colors.grey,
              ),
            ),
          ),
          const Expanded(
            // child: SearchIdleWidget(),
            child: SearchIdleWidget(),
          ),
        ],
      ),
    );
  }
}

// ignore_for_file: no_leading_underscores_for_local_identifiers

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:netflix/application/hot_and_new/hotandnew_bloc.dart';
import 'package:netflix/core/const.dart';
import 'package:netflix/core/const_strings.dart';
import 'package:netflix/presentaion/new&hot/widgets/coming_soon.dart';
import 'package:netflix/presentaion/new&hot/widgets/everyone_watching.dart';

class NewAndHotScreen extends StatelessWidget {
  const NewAndHotScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      BlocProvider.of<HotandnewBloc>(context).add(const LoadDataIncomingSoon());
    });
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: const Text(
            'New & Hot',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
          ),
          actions: [
            const IconButton(
              onPressed: null,
              icon: Icon(
                Icons.cast,
                color: Colors.white,
              ),
            ),
            Container(
              height: 40,
              width: 40,
              color: Colors.blue,
            )
          ],
          bottom: TabBar(
            unselectedLabelColor: colorWhite,
            isScrollable: true,
            labelColor: Colors.black,
            labelStyle:
                const TextStyle(fontSize: 16, fontWeight: FontWeight.w900),
            indicator: BoxDecoration(
              color: colorWhite,
              borderRadius: BorderRadius.circular(30),
            ),
            tabs: const [Text('🍿Coming Soon'), Text('👀Everyones Watching')],
          ),
        ),
        body: TabBarView(
          children: [
            BlocBuilder<HotandnewBloc, HotandnewState>(
              builder: (context, state) {
                if (state.isLoading) {
                  return const Center(child: CircularProgressIndicator());
                } else if (state.hasError) {
                  return const Center(child: Text('Error getting data'));
                } else if (state.comingSoonList.isEmpty) {
                  return const Center(child: Text('Comingsoon List Empty'));
                } else {
                  return ListView.builder(
                    itemCount: state.comingSoonList.length,
                    itemBuilder: (BuildContext context, index) {
                      final movie = state.comingSoonList[index];
                      final _date = DateTime.parse(movie.releaseDate!);
                      final _formatedDate =
                          DateFormat.yMMMMd('en_US').format(_date);
                      if (movie.id == null) {
                        return const SizedBox();
                      }
                      return ComingSoonWidget(
                        day: movie.releaseDate!.split('-')[1],
                        movieName: movie.originalTitle ?? 'No Tittle',
                        description:
                            movie.overview ?? 'Discription not available',
                        month: _formatedDate
                            .split(' ')
                            .first
                            .substring(0, 3)
                            .toUpperCase(),
                        id: movie.id.toString(),
                        posterPath: '$imageAppendURL${movie.posterPath}',
                      );
                    },
                  );
                }
              },
            ),
            ListView.builder(
              itemCount: 10,
              itemBuilder: (BuildContext context, index) =>
                  const EveryoneWatching(
                movieName: '',
                description: '',
                posterPath: '',
              ),
            )
          ],
        ),
      ),
    );
  }
}

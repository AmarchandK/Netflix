// ignore_for_file: no_leading_underscores_for_local_identifiers
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:netflix/application/downloads/downloads_bloc.dart';
import 'package:netflix/core/const.dart';
import 'package:netflix/domain/home/model/home_repo.dart';
import 'package:netflix/infrastructure/home/home_implimentation.dart';
import 'package:netflix/presentaion/home_page/widgets/baground_card.dart';
import 'package:netflix/presentaion/home_page/widgets/number_card.dart';
import 'widgets/card_view.dart';

ValueNotifier<bool> scrollNotifier = ValueNotifier(true);

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      HomeImpli().gethotHomeMovieDate();
    });
    BlocProvider.of<DownloadsBloc>(context)
        .add(const DownloadsEvent.getDownloadsImage());
    return Scaffold(
      body: ValueListenableBuilder(
        valueListenable: scrollNotifier,
        builder: (BuildContext context, index, Widget? child) {
          return NotificationListener<UserScrollNotification>(
            onNotification: (notification) {
              final ScrollDirection direction = notification.direction;
              if (direction == ScrollDirection.reverse) {
                scrollNotifier.value = false;
              } else if (direction == ScrollDirection.forward) {
                scrollNotifier.value = true;
              }
              return true;
            },
            child: Stack(
              children: [
                ValueListenableBuilder(
                    valueListenable: HomeImpli.latestMovieNotifier,
                    builder:
                        (BuildContext ctx, List<HomeData> data, Widget? _) {
                      return ListView(
                        shrinkWrap: true,
                        children: [
                          const BagroundImage(),
                          MainCardsHome(
                            title: 'Released in the past year',
                            data: data,
                          ),
                          MainCardsHome(
                            data: data,
                            title: 'Trending Now',
                          ),
                          const NumberWidget(),
                          MainCardsHome(
                            data: data,
                            title: 'Tense Dramas',
                          ),
                          MainCardsHome(
                            data: data,
                            title: 'South Indian Dramas',
                          ),
                        ],
                      );
                    }),
                scrollNotifier.value == true
                    ? AnimatedContainer(
                        color: colorTransparent,
                        duration: const Duration(milliseconds: 1000),
                        height: 70,
                        width: double.infinity,
                        child: Column(
                          children: [
                            Row(
                              children: [
                                Image.asset(
                                  'assets/download/netflixlogo.png',
                                  width: 50,
                                  height: 50,
                                ),
                                const Spacer(),
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
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: const [
                                Text(
                                  'TV Shows',
                                  style: fontstyle,
                                ),
                                Text(
                                  'Movies',
                                  style: fontstyle,
                                ),
                                Text(
                                  'Category',
                                  style: fontstyle,
                                ),
                              ],
                            )
                          ],
                        ),
                      )
                    : heightGap
              ],
            ),
          );
        },
      ),
    );
  }
}

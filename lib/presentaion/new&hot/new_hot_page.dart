// ignore_for_file: no_leading_underscores_for_local_identifiers

import 'package:flutter/material.dart';
import 'package:netflix/core/const.dart';
import 'package:netflix/presentaion/new&hot/widgets/coming_soon.dart';
import 'package:netflix/presentaion/new&hot/widgets/everyone_watching.dart';

class NewAndHotScreen extends StatelessWidget {
  const NewAndHotScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
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
            ListView.builder(
              itemCount: 10,
              itemBuilder: (BuildContext context, index) =>
                  const ComingSoonWidget(),
            ),
            ListView.builder(
              itemCount: 10,
              itemBuilder: (BuildContext context, index) =>
                  const EveryoneWatching(),
            )
          ],
        ),
      ),
    );
  }
}

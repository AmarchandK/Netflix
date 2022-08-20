// ignore_for_file: camel_case_types
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:netflix/application/downloads/downloads_bloc.dart';
import 'package:netflix/core/const.dart';
import 'package:netflix/core/const_strings.dart';
import 'package:netflix/presentaion/widget_refactories/app_bar_widget.dart';

class DownloadScreen extends StatelessWidget {
  DownloadScreen({Key? key}) : super(key: key);
  final _widgetList = [
    const _smartDownloads(),
    const _Section2(),
    const _Section3(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const PreferredSize(
        preferredSize: Size.fromHeight(50),
        child: AppBarWidget(
          title: 'Downloads',
        ),
      ),
      body: Padding(
          padding: const EdgeInsets.all(10),
          child: ListView.separated(
              itemBuilder: (BuildContext context, int index) =>
                  _widgetList[index],
              separatorBuilder: (context, index) => heightGap,
              itemCount: _widgetList.length)),
    );
  }
}

class _Section2 extends StatelessWidget {
  const _Section2({Key? key}) : super(key: key);
 
  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      BlocProvider.of<DownloadsBloc>(context)
          .add(const DownloadsEvent.getDownloadsImage());
    });

    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;

    return Column(
      children: [
        const Text(
          'Introducing Downloads for you',
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
        heightGap,
        const Text(
          'We will download a personlised selection of \nmovies and shows for you, so there is\n always something to watch on your\n device',
          textAlign: TextAlign.center,
          style: TextStyle(color: Colors.grey, fontSize: 16),
        ),
        BlocBuilder<DownloadsBloc, DownloadsState>(
          builder: (context, state) {
            return SizedBox(
              height: height / 1.9,
              width: width,
              child: state.isLoading
                  ? const Center(child: spinkit)
                  : Stack(
                      alignment: Alignment.center,
                      children: [
                        CircleAvatar(
                          backgroundColor: Colors.grey.withOpacity(0.5),
                          radius: height * 0.2,
                        ),
                        DownloadImgeWidget(
                          margin: const EdgeInsets.only(left: 170, bottom: 50),
                          height: height * 0.3,
                          width: width * 0.4,
                          stackImage:
                              '$imageAppendURL${state.downloads[0].posterPath}',
                          angle: 20,
                        ),
                        DownloadImgeWidget(
                          margin: const EdgeInsets.only(right: 170, bottom: 50),
                          height: height * 0.3,
                          width: width * 0.4,
                          stackImage:
                              '$imageAppendURL${state.downloads[1].posterPath}',
                          angle: -20,
                        ),
                        DownloadImgeWidget(
                          margin: const EdgeInsets.only(top: 30, bottom: 40),
                          height: height * 0.35,
                          width: width * 0.45,
                          stackImage:
                              '$imageAppendURL${state.downloads[2].posterPath}',
                          angle: 0,
                        ),
                      ],
                    ),
            );
          },
        ),
      ],
    );
  }
}

class _Section3 extends StatelessWidget {
  const _Section3({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          width: double.infinity,
          child: RawMaterialButton(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            onPressed: null,
            fillColor: colorBlue,
            child: const Text(
              'Set Up',
              style: TextStyle(color: colorWhite, fontWeight: FontWeight.bold),
            ),
          ),
        ),
        heightGap,
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30),
          child: SizedBox(
            width: double.infinity,
            child: RawMaterialButton(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10)),
              onPressed: null,
              fillColor: colorWhite,
              child: const Text(
                'See What You Can Download',
                style:
                    TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class _smartDownloads extends StatelessWidget {
  const _smartDownloads({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: const [
        Icon(
          Icons.settings,
          color: Colors.white,
        ),
        widthGaps,
        Text('Smart Downloads'),
      ],
    );
  }
}

class DownloadImgeWidget extends StatelessWidget {
  const DownloadImgeWidget(
      {Key? key,
      required this.height,
      required this.width,
      required this.stackImage,
      required this.margin,
      required this.angle})
      : super(key: key);

  final double height;
  final double width;
  final String stackImage;
  final double angle;
  final EdgeInsetsGeometry margin;

  @override
  Widget build(BuildContext context) {
    return Transform.rotate(
      angle: angle * pi / 180,
      child: Container(
        margin: margin,
        height: height,
        width: width,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          image: DecorationImage(
            fit: BoxFit.fill,
            image: NetworkImage(stackImage),
          ),
        ),
      ),
    );
  }
}

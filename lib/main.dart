import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:netflix/application/downloads/downloads_bloc.dart';
import 'package:netflix/core/dipendency_injection/injectable.dart';
import 'package:netflix/presentaion/main_page/screen_main.dart';

import 'application/fast_laugh/fast_laugh_bloc.dart';
import 'application/search/search_bloc.dart';
import 'core/const.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await configureInjection();
  runApp(
    const MyApp(),
  );
  HttpOverrides.global = MyHttpOverrides();
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: ((ctx) => getIt<DownloadsBloc>())),
        BlocProvider(create: ((ctx) => getIt<SearchBloc>())),
        BlocProvider(create: ((ctx) => getIt<FastLaughBloc>())),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          appBarTheme: const AppBarTheme(backgroundColor: Colors.transparent),
          buttonTheme: const ButtonThemeData(
            colorScheme: ColorScheme.light(),
          ),
          fontFamily: GoogleFonts.montserrat().fontFamily,
          scaffoldBackgroundColor: Colors.black,
          textTheme: const TextTheme(
            bodyText1: TextStyle(
              color: Colors.white,
            ),
            bodyText2: TextStyle(
              color: Colors.white,
            ),
          ),
          primaryIconTheme: const IconThemeData(color: Colors.white),
          iconTheme: const IconThemeData(color: Colors.white),
        ),
        home: MainPageScreen(),
      ),
    );
  }
}

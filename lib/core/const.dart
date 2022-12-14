import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

const bgColor = Colors.black;
const widthGaps = SizedBox(width: 10);
const heightGap = SizedBox(
  height: 10,
);
const colorBlue = Colors.blue;
const colorWhite = Colors.white;
const colorGrey = Colors.grey;
const colorTransparent = Color.fromARGB(106, 0, 0, 0);
const TextStyle fontstyle =
    TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 14);

/////error handler from stack overflow/// also in main
class MyHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    return super.createHttpClient(context)
      ..badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
  }
}
const spinkit = SpinKitSquareCircle(
  color: Colors.red,
  size: 50.0,
);

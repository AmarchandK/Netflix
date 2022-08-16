import 'package:flutter/material.dart';

class MainTitles extends StatelessWidget {
  final String title;
  const MainTitles({
    required this.title,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: const TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
    );
  }
}

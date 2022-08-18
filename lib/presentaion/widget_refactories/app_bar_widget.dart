import 'package:flutter/material.dart';

class AppBarWidget extends StatelessWidget {
  const AppBarWidget({Key? key, required this.title}) : super(key: key);
  final String title;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: const TextStyle(fontSize: 30, fontWeight: FontWeight.w900),
          ),
          Row(
            children: [
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
          )
        ],
      ),
    );
  }
}

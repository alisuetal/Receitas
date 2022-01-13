// ignore_for_file: use_key_in_widget_constructors

import 'package:flutter/material.dart';

class Tag extends StatelessWidget{
  final String title;

  const Tag(this.title);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 10,
        vertical: 6
      ),
      child: Text(
        title,
        style: const TextStyle(
          color: Colors.black,
        ),
      ),
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.all(Radius.circular(20)),
        color: Colors.green[200],
      ),
    );
  }
}
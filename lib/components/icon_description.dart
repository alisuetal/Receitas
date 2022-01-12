// ignore_for_file: use_key_in_widget_constructors

import 'package:flutter/material.dart';

class IconDescription extends StatelessWidget{
  final String text;
  final IconData icon;

  const IconDescription({
    required this.text,
    required this.icon
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Icon(
          icon,
          color: Colors.black54,
          size: 26,
        ),
        const SizedBox(
          height: 8,
        ),
        Text(
          text,
          style: const TextStyle(
            color: Colors.black54,
            fontSize: 16
          ),
        )
      ]
    );
  }
}
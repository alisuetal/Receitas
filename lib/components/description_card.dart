// ignore_for_file: use_key_in_widget_constructors

import 'package:flutter/material.dart';

class DescriptionCard extends StatelessWidget{
  final String title;
  final List<String> list;

  const DescriptionCard({
    required this.title,
    required this.list
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.all(Radius.circular(12)),
        color: Colors.amber[200],
      ),
      padding: const EdgeInsets.all(20),
      child: Column(
        children: [
          Row(
            children: [
              Text(
                title,
                style: const TextStyle(
                  fontSize: 26,
                  fontWeight: FontWeight.w500
                ),
              ),
            ],
          ),
          ListView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: list.length,
            itemBuilder: (context, index){
              return Padding(
                padding: const EdgeInsets.only(
                  bottom: 12
                ),
                child: Text(
                  (index + 1).toString() + '. ' + list[index],
                  style: const TextStyle(
                    fontSize: 18
                  ),
                ),
              );
            },
          ),
        ]
      )
    );
  }
}
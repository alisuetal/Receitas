// ignore_for_file: use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:navigation/utils/app_routes.dart';

class AppBarWidget extends StatelessWidget {
  final String title;
  final bool backButton;

  const AppBarWidget({required this.title, required this.backButton});

  void _selectCategory(BuildContext context) {
    Navigator.of(context).pushNamed(
      AppRoutes.HOME,
    );
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 144.0,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 16),
        child: Column(
          mainAxisAlignment: backButton
            ? MainAxisAlignment.spaceBetween
            : MainAxisAlignment.end,
          children: <Widget>[
            if (backButton == true)
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  InkWell(
                    child: const Icon(
                      Icons.arrow_back_ios_new_rounded,
                      color: Colors.black,
                      size: 36,
                    ),
                    onTap: () {
                      _selectCategory(context);
                    },
                  ),
                ],
              ),
            Row(mainAxisAlignment: MainAxisAlignment.start, children: [
              Text(
                title,
                style: const TextStyle(
                  color: Colors.black,
                  fontSize: 32,
                  fontWeight: FontWeight.w700,
                ),
              )
            ]),
          ],
        ),
      ),
    );
  }
}

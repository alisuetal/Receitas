// ignore_for_file: use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:navigation/components/app_bar.dart';
import 'package:navigation/components/category.dart';
import 'package:navigation/data/dummy_data.dart';

class CategoriesScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              const AppBarWidget(title: 'Cozinha', backButton: false),
              GridView(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                  maxCrossAxisExtent: 200,
                  childAspectRatio: 3 / 2,
                  crossAxisSpacing: 20,
                  mainAxisSpacing: 20,
                ),
                children: dummyCategories.map((e){
                  return CategoryWidget(e);
                }).toList(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

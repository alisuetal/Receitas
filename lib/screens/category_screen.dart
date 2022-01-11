// ignore_for_file: use_key_in_widget_constructors
import 'package:flutter/material.dart';
import 'package:navigation/components/app_bar.dart';
import 'package:navigation/components/meal.dart';
import 'package:navigation/data/dummy_data.dart';
import 'package:navigation/models/category.dart';

class CategoryScreen extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    final category = ModalRoute.of(context)?.settings.arguments as Category;

    final categoryMeals = dummyMeals.where((element){
      return element.categories.contains(category.id);
    }).toList();

    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              AppBarWidget(title: category.title, backButton: true),
              ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: categoryMeals.length,
                itemBuilder: (context, index){
                  return Padding(
                    padding: const EdgeInsets.only(
                      bottom: 24
                    ),
                    child: MealWidget(categoryMeals[index]),
                  );
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
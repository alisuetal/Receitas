// ignore_for_file: use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:receitas/components/app_bar.dart';
import 'package:receitas/components/meal.dart';
import 'package:receitas/models/favorites.dart';

class FavoriteScreen extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    final categoryMeals = FavoriteMeals.meals;

    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              const AppBarWidget(title: 'Favoritos', backButton: false),
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
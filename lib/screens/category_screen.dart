// ignore_for_file: use_key_in_widget_constructors
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:receitas/components/app_bar.dart';
import 'package:receitas/components/meal.dart';
import 'package:receitas/data/dummy_data.dart';
import 'package:receitas/models/category.dart';
import 'package:receitas/models/meal.dart';
import 'package:receitas/utils/app_routes.dart';

class CategoryScreen extends StatefulWidget{
  @override
  State<CategoryScreen> createState() => _CategoryScreenState();
}

class _CategoryScreenState extends State<CategoryScreen> {
  void _selectMeal(BuildContext context, Meal meal){
    Navigator.of(context).pushNamed(
      AppRoutes.MEAL_SCREEN,
      arguments: meal
    ).then((result){
        setState(() {});
      }
    );
  }

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
                    child: InkWell(
                      borderRadius: const BorderRadius.all(Radius.circular(12)),
                      onTap: () {_selectMeal(context, categoryMeals[index]);},
                      child: MealWidget(categoryMeals[index])
                    ),
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
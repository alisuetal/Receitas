// ignore_for_file: use_key_in_widget_constructors
import 'package:flutter/material.dart';
import 'package:receitas/components/app_bar.dart';
import 'package:receitas/components/meal.dart';
import 'package:receitas/models/favorites.dart';
import 'package:receitas/models/meal.dart';
import 'package:receitas/utils/app_routes.dart';

class FavoriteScreen extends StatefulWidget{
  @override
  State<FavoriteScreen> createState() => _FavoriteScreenState();
}

class _FavoriteScreenState extends State<FavoriteScreen> {
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
    final categoryMeals = FavoriteMeals.meals;

    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              const AppBarWidget(title: 'Favoritos', backButton: false),
              FavoriteMeals.getMeals().isNotEmpty ?
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
              : SizedBox(
                height: 250,
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      Icon(
                        Icons.bookmark_border_rounded,
                        size: 56,
                        color: Colors.black38
                      ),
                      SizedBox(
                        height: 8,
                      ),
                      Text(
                        "Nada aqui. :(",
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.w700,
                          color: Colors.black38
                        ),
                      ),
                    ]
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
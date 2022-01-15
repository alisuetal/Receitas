// ignore_for_file: use_key_in_widget_constructors
import 'package:flutter/material.dart';
import 'package:receitas/components/app_bar.dart';
import 'package:receitas/components/description_card.dart';
import 'package:receitas/components/icon_description.dart';
import 'package:receitas/components/tag.dart';
import 'package:receitas/models/favorites.dart';
import 'package:receitas/models/meal.dart';

class MealScreen extends StatefulWidget{
  @override
  State<MealScreen> createState() => _MealScreenState();
}

class _MealScreenState extends State<MealScreen> {
  bool _isFavorite = false;

  _setFavorite(Meal meal){
    if(_isFavorite){
      setState(() {
        FavoriteMeals.removeMeal(meal);
      });
    }
    else{
      setState(() {
        FavoriteMeals.addMeal(meal);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final meal = ModalRoute.of(context)?.settings.arguments as Meal;
    _isFavorite = FavoriteMeals.checkMeal(meal);

    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              const AppBarWidget(title: '', backButton: true),
              ClipRRect(
                child: Image.network(
                  meal.imageUrl,
                  width: double.infinity,
                  fit: BoxFit.fitWidth,
                  height: 256,
                  alignment: Alignment.center,
                ),
                borderRadius: const BorderRadius.all(Radius.circular(12))
              ),
              Padding(
                padding: const EdgeInsets.only(
                  top: 12
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    if(meal.isGlutenFree)
                      Container(
                        margin: const EdgeInsets.only(
                          right: 8,
                          top: 8
                        ),
                        child: const Tag("Livre de Glúten")
                      ),
                    if(meal.isLactoseFree)
                      Container(
                        margin: const EdgeInsets.only(
                          right: 8,
                          top: 8
                        ),
                        child: const Tag("Livre de Lactose")
                      ),
                    if(meal.isVegan)
                      Container(
                        margin: const EdgeInsets.only(
                          right: 8,
                          top: 8
                        ),
                        child: const Tag("Vegano")
                      ),
                    if(meal.isVegetarian)
                      Container(
                        margin: const EdgeInsets.only(
                          right: 8,
                          top: 8
                        ),
                        child: const Tag("Vegetariano"),
                      ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                  top: 8
                ),
                child: Row(
                  children: [
                    Flexible(
                      child: Text(
                        meal.title,
                        style: const TextStyle(
                          fontSize: 32,
                          fontWeight: FontWeight.w700
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                  top: 24,
                  right: 10,
                  left: 10
                ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconDescription(icon: Icons.timer, text: meal.duration.toString() + "min"),
                    IconDescription(icon: Icons.widgets_outlined, text: meal.complexityText),
                    IconDescription(icon: Icons.attach_money_rounded, text: meal.costText),
                  ],
                ),
              ),
              Container(
                margin: const EdgeInsets.only(
                  top: 40,
                ),
                child: DescriptionCard(title: 'Ingredientes', list: meal.ingredients)
              ),
              Container(
                margin: const EdgeInsets.only(
                  top: 24,
                ),
                child: DescriptionCard(title: 'Passos', list: meal.steps),
              ),
            ]
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: _isFavorite ?
        const Icon(Icons.star, color: Colors.black54) :
        const Icon(Icons.star_outline, color: Colors.black54),
        onPressed: () => _setFavorite(meal),
        elevation: 0,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(12)),
        ),
        backgroundColor: Colors.amber[200],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
    );
  }
}
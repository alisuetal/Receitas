import 'package:receitas/models/meal.dart';

class FavoriteMeals{
  static final List<Meal> meals = [];

  static void addMeal(Meal meal){
    if(!checkMeal(meal)){
      meals.add(meal);
    }
  }

  static void removeMeal(Meal meal){
    if(checkMeal(meal)){
      meals.remove(meal);
    }
  }

  static bool checkMeal(Meal meal){
    return meals.contains(meal);
  }

  static List<Meal> getMeals(){
    return meals;
  }
}
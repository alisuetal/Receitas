// ignore_for_file: use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:receitas/models/meal.dart';
import 'package:receitas/data/dummy_data.dart';
import 'package:receitas/models/settings.dart';
import 'package:receitas/screens/category_screen.dart';
import 'package:receitas/screens/meal_screen.dart';
import 'package:receitas/screens/tab_screens.dart';
import 'package:receitas/utils/app_routes.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: Color(0xFFFFF8E1),
      systemNavigationBarColor: Color(0xFFFFECB3),
      statusBarIconBrightness: Brightness.dark));
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Settings settings = Settings();
  List<Meal> _availableMeals = dummyMeals;

  void _filterMeals(Settings settings) {
    setState(() {
      _availableMeals = dummyMeals.where((meal) {
        final filterGluten = settings.isGlutenFree && !meal.isGlutenFree;
        final filterLactose = settings.isLactoseFree && !meal.isLactoseFree;
        final filterVegan = settings.isVegan && !meal.isVegan;
        final filterVegetarian = settings.isVegetarian && !meal.isVegetarian;
        return !filterGluten &&
            !filterLactose &&
            !filterVegan &&
            !filterVegetarian;
      }).toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        colorScheme: ColorScheme.fromSwatch().copyWith(
          primary: Colors.amber,
          secondary: Colors.purple[300],
        ),
        fontFamily: 'Ralewey',
        textTheme: ThemeData.light().textTheme.copyWith(
            subtitle1:
                const TextStyle(fontSize: 20, fontFamily: 'RobotoCondensed')),
        canvasColor: Colors.amber[50],
      ),
      home: TabsScreen(_filterMeals, settings),
      initialRoute: AppRoutes.HOME,
      routes: {
        AppRoutes.CATEGORY_SCREEN: (context) => CategoryScreen(_availableMeals),
        AppRoutes.MEAL_SCREEN: (context) => MealScreen(),
        AppRoutes.SETTINGS: (context) => MealScreen(),
        AppRoutes.FAVORITES: (context) => MealScreen(),
      },
    );
  }
}

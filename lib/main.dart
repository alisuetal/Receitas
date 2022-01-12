// ignore_for_file: use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:receitas/screens/categories_screen.dart';
import 'package:receitas/screens/category_screen.dart';
import 'package:receitas/screens/meal_screen.dart';
import 'package:receitas/utils/app_routes.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    statusBarColor: Color.fromRGBO(0, 0, 0, 0),
    systemNavigationBarColor: Color.fromRGBO(255, 239, 213, 1),
    statusBarIconBrightness: Brightness.dark));
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        colorScheme: ColorScheme.fromSwatch().copyWith(
          primary: Colors.purple,
          secondary: Colors.purple[300],
        ),
        fontFamily: 'Ralewey',
        textTheme: ThemeData.light().textTheme.copyWith(
            subtitle1:
                const TextStyle(fontSize: 20, fontFamily: 'RobotoCondensed')),
        canvasColor: Colors.amber[100],
      ),
      home: CategoriesScreen(),
      initialRoute: AppRoutes.HOME,
      routes: {
        AppRoutes.CATEGORY_SCREEN: (context) => CategoryScreen(),
        AppRoutes.MEAL_SCREEN: (context) => MealScreen()
      },
    );
  }
}

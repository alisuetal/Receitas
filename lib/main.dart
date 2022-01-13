// ignore_for_file: use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
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

class MyApp extends StatelessWidget {
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
      home: TabsScreen(),
      initialRoute: AppRoutes.HOME,
      routes: {
        AppRoutes.CATEGORY_SCREEN: (context) => CategoryScreen(),
        AppRoutes.MEAL_SCREEN: (context) => MealScreen()
      },
    );
  }
}

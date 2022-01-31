// ignore_for_file: use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:receitas/models/settings.dart';
import 'package:receitas/screens/settings_screen.dart';
import 'categories_screen.dart';
import 'favorite_screen.dart';

class TabsScreen extends StatefulWidget {
  final Function(Settings) onSettingsChanged;
  final Settings settings;
  const TabsScreen(this.onSettingsChanged, this.settings);
  @override
  _TabsScreenState createState() => _TabsScreenState(
      onSettingsChanged: onSettingsChanged, settings: settings);
}

class _TabsScreenState extends State<TabsScreen> {
  Function(Settings) onSettingsChanged;
  Settings settings;
  _TabsScreenState({required this.onSettingsChanged, required this.settings});

  int _selectedScreenIndex = 0;

  late final List<Widget> _screens = [
    CategoriesScreen(),
    FavoriteScreen(),
    SettingsScreen(onSettingsChanged, settings)
  ];

  _selectScreen(int index) {
    setState(() {
      _selectedScreenIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screens[_selectedScreenIndex],
      bottomNavigationBar: BottomNavigationBar(
        onTap: _selectScreen,
        backgroundColor: Colors.amber[100],
        unselectedItemColor: Colors.black38,
        selectedItemColor: Colors.amber[800],
        currentIndex: _selectedScreenIndex,
        elevation: 0,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.category),
            label: 'Categorias',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.star),
            label: 'Favoritos',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: 'COnfigurações',
          ),
        ],
      ),
    );
  }
}

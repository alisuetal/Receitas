// ignore_for_file: use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:receitas/components/app_bar.dart';
import '../models/settings.dart';

class SettingsScreen extends StatefulWidget {
  final Function(Settings) onSettingsChanged;
  final Settings settings;
  const SettingsScreen(this.onSettingsChanged, this.settings);

  @override
  _SettingsScreenState createState() =>
      _SettingsScreenState(settings: settings);
}

class _SettingsScreenState extends State<SettingsScreen> {
  Settings settings;
  _SettingsScreenState({required this.settings});

  Widget _createSwitch(
    String title,
    String subtitle,
    bool value,
    Function(bool) onChanged,
  ) {
    return Transform.scale(
      scale: 1.1,
      child: SwitchListTile.adaptive(
        activeColor: Colors.amber[800],
        title: Text(title),
        subtitle: Text(subtitle),
        value: value,
        onChanged: (value) {
          onChanged(value);
          widget.onSettingsChanged(settings);
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(children: <Widget>[
            const AppBarWidget(title: 'Configurações', backButton: false),
            _createSwitch(
              'Sem Glúten',
              'Apenas exibir refeições sem glúten',
              settings.isGlutenFree,
              (value) => setState(() => settings.isGlutenFree = value),
            ),
            _createSwitch(
              'Sem Lactose',
              'Apenas exibir refeições sem lactose',
              settings.isLactoseFree,
              (value) => setState(() => settings.isLactoseFree = value),
            ),
            _createSwitch(
              'Vegana',
              'Apenas exibir refeições veganas',
              settings.isVegan,
              (value) => setState(() => settings.isVegan = value),
            ),
            _createSwitch(
              'Vegetariana',
              'Apenas exibir refeições vegetarianas',
              settings.isVegetarian,
              (value) => setState(() => settings.isVegetarian = value),
            ),
          ]),
        ),
      ),
    );
  }
}

// ignore_for_file: use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:navigation/models/category.dart';
import 'package:navigation/screens/category_screen.dart';
import 'package:navigation/utils/app_routes.dart';

class CategoryWidget extends StatelessWidget{
  final Category category;

  const CategoryWidget(this.category);

  void _selectCategory(BuildContext context){
    Navigator.of(context).pushNamed(
      AppRoutes.CATEGORY_SCREEN,
      arguments: category
    );
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => _selectCategory(context),
      borderRadius: const BorderRadius.all(Radius.circular(12)),
      child: Container(
        child: Text(
          category.title,
          style: Theme.of(context).textTheme.subtitle1,
        ),
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(Radius.circular(12)),
          color: category.color.withOpacity(0.5)
        ),
      ),
    );
  }
}
// ignore_for_file: use_key_in_widget_constructors
import 'package:flutter/Material.dart';
import 'package:receitas/components/tag.dart';
import 'package:receitas/models/favorites.dart';
import 'package:receitas/models/meal.dart';

class MealWidget extends StatelessWidget {
  final Meal meal;

  const MealWidget(this.meal);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Stack(children: [
            ClipRRect(
              child: Image.network(
                meal.imageUrl,
                width: double.infinity,
                fit: BoxFit.fitWidth,
                height: 156,
                alignment: Alignment.center,
              ),
              borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(12), topRight: Radius.circular(12)),
            ),
            Wrap(
              children: [
                if (meal.isGlutenFree)
                  Container(
                      margin: const EdgeInsets.only(left: 8, top: 8),
                      child: const Tag("Livre de Glúten")),
                if (meal.isLactoseFree)
                  Container(
                      margin: const EdgeInsets.only(left: 8, top: 8),
                      child: const Tag("Livre de Lactose")),
                if (meal.isVegan)
                  Container(
                      margin: const EdgeInsets.only(left: 8, top: 8),
                      child: const Tag("Vegano")),
                if (meal.isVegetarian)
                  Container(
                    margin: const EdgeInsets.only(left: 8, top: 8),
                    child: const Tag("Vegetariano"),
                  ),
              ],
            ),
          ]),
          Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              children: [
                Row(
                  children: [
                    Flexible(
                      child: Text(
                        meal.title,
                        style: const TextStyle(
                          fontSize: 22,
                        ),
                        overflow: TextOverflow.fade,
                      ),
                    )
                  ],
                ),
                const SizedBox(
                  height: 16,
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        const Icon(
                          Icons.timer,
                          color: Colors.black38,
                          size: 20,
                        ),
                        const SizedBox(
                          width: 8,
                        ),
                        Text(
                          meal.duration.toString() + ' min',
                          style: const TextStyle(
                              color: Colors.black54, fontSize: 16),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        const Icon(
                          Icons.widgets_outlined,
                          color: Colors.black38,
                          size: 20,
                        ),
                        const SizedBox(
                          width: 8,
                        ),
                        Text(
                          meal.complexityText,
                          style: const TextStyle(
                              color: Colors.black54, fontSize: 16),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        const Icon(
                          Icons.attach_money_rounded,
                          color: Colors.black38,
                          size: 20,
                        ),
                        const SizedBox(
                          width: 2,
                        ),
                        Text(
                          meal.costText,
                          style: const TextStyle(
                              color: Colors.black54, fontSize: 16),
                        ),
                      ],
                    ),
                    if (FavoriteMeals.meals.contains(meal))
                      Row(
                        children: const [
                          Icon(
                            Icons.star,
                            color: Colors.black38,
                            size: 20,
                          ),
                          SizedBox(
                            width: 6,
                          ),
                          Text(
                            "Favorito",
                            style:
                                TextStyle(color: Colors.black54, fontSize: 16),
                          ),
                          SizedBox(
                            width: 4,
                          ),
                        ],
                      ),
                  ],
                ),
              ],
            ),
          )
        ],
      ),
      decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(Radius.circular(12)),
          color: Colors.amber[100]),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:max_meal_app/widgets/step&ingredient.dart';

import '../models/meals.dart';

class MealDetail extends StatelessWidget {
  static const id = 'mealId';
  Function toggle;
  Function isfavMeal;
  MealDetail({required this.isfavMeal, required this.toggle});

  @override
  Widget build(BuildContext context) {
    final media = MediaQuery.of(context);
    final meal =
        (ModalRoute.of(context)!.settings.arguments as Map)['meal'] as Meal;
    final meal_color =
        (ModalRoute.of(context)!.settings.arguments as Map)['color'] as Color;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: meal_color,
        title: Text(
          meal.title,
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.zero,
              height: media.size.height * 0.4,
              width: double.infinity,
              child: Hero(
                tag: meal.imageUrl,
                child: Image.network(
                  meal.imageUrl,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Container(
              height: media.size.height * 0.05,
              margin: const EdgeInsets.symmetric(vertical: 10),
              child: Text(
                'ingredients',
                style: TextStyle(fontSize: 30, color: meal_color),
              ),
            ),
            Box_Step_ingredient(
              padding: EdgeInsets.only(right: 15, top: 10, bottom: 10),
              data: meal.ingredients,
              alignment: Alignment.centerLeft,
              mealColor: meal_color,
              media: media,
            ),
            Container(
              height: media.size.height * 0.05,
              margin: const EdgeInsets.symmetric(vertical: 10),
              child: Text(
                'steps',
                style: TextStyle(fontSize: 30, color: meal_color),
              ),
            ),
            Container(
              margin: EdgeInsets.only(bottom: 50),
              child: Box_Step_ingredient(
                padding: EdgeInsets.only(left: 15, top: 10, bottom: 10),
                data: meal.steps,
                alignment: Alignment.centerRight,
                mealColor: meal_color,
                media: media,
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: meal_color,
        onPressed: () => toggle(meal),
        child: Icon(isfavMeal(meal) ? Icons.star : Icons.star_border),
      ),
    );
  }
}

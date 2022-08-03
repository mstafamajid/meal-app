// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:max_meal_app/data/meals_data.dart';
import 'package:max_meal_app/models/meals.dart';

import '../widgets/meal_items.dart';

class choosenCategory extends StatefulWidget {
  static const id = '/choosenCategory';
  List<Meal> avalabile_Meal;
  choosenCategory({
    required this.avalabile_Meal,
  });

  @override
  State<choosenCategory> createState() => _choosenCategoryState();
}

class _choosenCategoryState extends State<choosenCategory> {
  String? categoryId;
  String? categoryTitle;
  late List<Meal> categoryMeals;
  bool hasloadedData = false;
  Color? color;
  void remove(Meal mealToBeRemoved) {
    setState(() {
      categoryMeals.remove(mealToBeRemoved);
    });
  }

  @override
  void didChangeDependencies() {
    if (!hasloadedData) {
      final routsArgument =
          ModalRoute.of(context)!.settings.arguments as Map<String, Object>;
      categoryId = routsArgument['id'] as String;
      categoryTitle = routsArgument['title'] as String;
      color = routsArgument['color'] as Color;
      categoryMeals = widget.avalabile_Meal.where((meals) {
        return meals.categories.contains(categoryId);
      }).toList();
    }
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: color,
        title: Text(categoryTitle!),
      ),
      body: ListView.builder(
        itemBuilder: ((context, index) {
          return mealItem(
            meal: categoryMeals[index],
            color: color!,
            remove: remove,
          );
        }),
        itemCount: categoryMeals.length,
      ),
    );
  }
}

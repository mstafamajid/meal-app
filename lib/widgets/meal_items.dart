// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:max_meal_app/models/meals.dart';
import 'package:max_meal_app/screens/mealDetail_screen.dart';

import 'bottomContent.dart';

class mealItem extends StatelessWidget {
  final Meal meal;
  final Color color;
  void Function(Meal)? remove;
  mealItem({
    Key? key,
    required this.meal,
    required this.color,
    this.remove,
  }) : super(key: key);

  void selectmeals(BuildContext ctx) {
    Navigator.of(ctx).pushNamed(MealDetail.id, arguments: {
      'meal': meal,
      'color': color,
    }).then((value) {
      if (value != null) remove!(value as Meal);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(10),
      child: InkWell(
        borderRadius: BorderRadius.circular(15),
        onTap: () => selectmeals(context),
        child: Card(
          margin: EdgeInsets.zero,
          elevation: 5,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
          child: Column(
            children: [
              Stack(
                children: [
                  ClipRRect(
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(15),
                      topRight: Radius.circular(15),
                    ),
                    child: Hero(
                      tag: meal.imageUrl,
                      child: Image.network(
                        meal.imageUrl,
                        height: 250,
                        width: double.infinity,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: 15,
                    right: 0,
                    child: Container(
                      width: MediaQuery.of(context).size.width * 0.75,
                      padding: const EdgeInsets.all(15),
                      decoration: const BoxDecoration(
                        color: Color.fromARGB(160, 0, 0, 0),
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(20),
                            bottomLeft: Radius.circular(20)),
                      ),
                      child: Text(
                        meal.title,
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 26,
                        ),
                        softWrap: true,
                        overflow: TextOverflow.fade,
                      ),
                    ),
                  )
                ],
              ),
              Padding(
                padding: const EdgeInsets.all(20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    BottomContent(
                      detail: '${meal.duration} min',
                      icon: Icons.schedule,
                      mealColor: color,
                    ),
                    BottomContent(
                      detail: meal.complexity.name,
                      icon: Icons.work_outline,
                      mealColor: color,
                    ),
                    BottomContent(
                      detail: meal.affordability.name,
                      icon: Icons.attach_money_outlined,
                      mealColor: color,
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

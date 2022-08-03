import 'package:flutter/material.dart';

import 'package:max_meal_app/models/meals.dart';
import 'package:max_meal_app/widgets/meal_items.dart';

class favorateScreen extends StatefulWidget {
  List <Meal> favo;
  favorateScreen({required this.favo});


  @override
  State<favorateScreen> createState() => _favorateScreenState();
}

class _favorateScreenState extends State<favorateScreen> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: ListView(
      children: widget.favo.map((e) => mealItem(meal: e, color: Colors.pink)).toList(),
      ),
    );
  }
}
import 'package:flutter/material.dart';
import 'package:max_meal_app/screens/choosenCategoryScreen.dart';

class category_item extends StatelessWidget {
  final String id;
  final String title;
  final Color color;
  const category_item(
      {Key? key, required this.title, required this.color, required this.id})
      : super(key: key);

  void selecteCategory(BuildContext ctx) {
    Navigator.of(ctx).pushNamed(choosenCategory.id,
        arguments: {'id': id, 'title': title, 'color': color});
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      splashColor: color,
      borderRadius: BorderRadius.circular(25),
      onTap: () => selecteCategory(context),
      child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(25),
            gradient: LinearGradient(
                colors: [color.withOpacity(0.6), color],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight),
          ),
          child: Center(
            child: Text(
              title,
              style: Theme.of(context).textTheme.headline1,
            ),
          )),
    );
  }
}

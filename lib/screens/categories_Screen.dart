import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:max_meal_app/data/categories_data.dart';

import '../widgets/category_items.dart';

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GridView(
      padding: const EdgeInsets.all(10),
      gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
          maxCrossAxisExtent: MediaQuery.of(context).size.width / 2,
          childAspectRatio: 3 / 2,
          mainAxisSpacing: 20,
          crossAxisSpacing: 20),
      children: DUMMY_CATEGORIES
          .map((categoreData) => category_item(
              id: categoreData.id,
              title: categoreData.title,
              color: categoreData.color))
          .toList(),
    );
  }
}

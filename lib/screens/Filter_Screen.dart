import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:max_meal_app/widgets/drawer_widget.dart';

class Filter_Screen extends StatefulWidget {
  static const id = 'filter_screen';
  final Function saveFilters;
  final Map<String, bool> currentFilters;
  Filter_Screen({required this.currentFilters, required this.saveFilters});

  @override
  State<Filter_Screen> createState() => _Filter_ScreenState();
}

class _Filter_ScreenState extends State<Filter_Screen> {
  var isGlutenFree = false;
  var isVegan = false;
  var isVegetarian = false;
  var isLactoseFree = false;

  @override
  void initState() {
    isGlutenFree = widget.currentFilters['gluten'] as bool;
    isVegan = widget.currentFilters['vegan'] as bool;
    isVegetarian = widget.currentFilters['vegetarian'] as bool;
    isLactoseFree = widget.currentFilters['lactose'] as bool;
    super.initState();
  }

  Widget buildSwitchLists(
    bool value,
    String subtitle,
    String title,
    Function(bool) onchange,
  ) {
    return SwitchListTile(
      activeColor: Theme.of(context).colorScheme.primary,
      value: value,
      onChanged: onchange,
      title: Text(title),
      subtitle: Text(subtitle),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
              onPressed: () {
                final selectedFilters = {
                  'gluten': isGlutenFree,
                  'lactose': isLactoseFree,
                  'vegan': isVegan,
                  'vegetarian': isVegetarian,
                };
                widget.saveFilters(selectedFilters);
              },
              icon: Icon(Icons.save))
        ],
        title: const Text('Favorites'),
      ),
      drawer: const Main_drawer(),
      body: Column(
        children: [
          Container(
            height: 90,
            alignment: Alignment.center,
            child: const Text(
              'Adjust your meal selection',
              style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
            ),
          ),
          Expanded(
              child: ListView(
            children: [
              buildSwitchLists(
                  isGlutenFree, "only include gluten-free meals", 'gluten-free',
                  (value) {
                setState(() {
                  isGlutenFree = value;
                });
              }),
              buildSwitchLists(
                  isVegan, "only include vegan-free meals", 'vegan-free',
                  (value) {
                setState(() {
                  isVegan = value;
                });
              }),
              buildSwitchLists(
                  isVegetarian,
                  "only include Vegetarian-free meals",
                  'Vegetarian-free', (value) {
                setState(() {
                  isVegetarian = value;
                });
              }),
              buildSwitchLists(isLactoseFree, "only include Lactose-free meals",
                  'Lactose-free', (value) {
                setState(() {
                  isLactoseFree = value;
                });
              }),
            ],
          ))
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:max_meal_app/screens/Filter_Screen.dart';
import 'package:max_meal_app/screens/categories_Screen.dart';
import 'package:max_meal_app/screens/choosenCategoryScreen.dart';
import 'package:max_meal_app/screens/mainScreen.dart';
import 'package:max_meal_app/screens/mealDetail_screen.dart';

import 'data/meals_data.dart';
import 'models/meals.dart';

void main() {
  runApp(MealApp());
}

class MealApp extends StatefulWidget {
  @override
  State<MealApp> createState() => _MealAppState();
}

class _MealAppState extends State<MealApp> {
  Map<String, bool> _filters = {
    'gluten': false,
    'lactose': false,
    'vegan': false,
    'vegetarian': false,
  };

  List<Meal> _availableMeals = DUMMY_MEALS;

  List<Meal> _favoMeals = [];
  void _setFilters(Map<String, bool> filterData) {
    setState(() {
      _filters = filterData;

      _availableMeals = DUMMY_MEALS.where((meal) {
        if (_filters['gluten'] as bool && !meal.isGlutenFree) {
          return false;
        }
        if (_filters['lactose'] as bool && !meal.isLactoseFree) {
          return false;
        }
        if (_filters['vegan'] as bool && !meal.isVegan) {
          return false;
        }
        if (_filters['vegetarian'] as bool && !meal.isVegetarian) {
          return false;
        }
        return true;
      }).toList();
    });
  }

  void toggleFavo(Meal meal) {
    setState(() {
      if (_favoMeals.contains(meal)) {
        _favoMeals.remove(meal);
      } else {
        _favoMeals.add(meal);
      }
    });
  }
  bool isfavMeal(Meal meal){
    return _favoMeals.contains(meal);
  }

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        colorScheme: ThemeData().colorScheme.copyWith(
              secondary: Colors.white,
              primary: Colors.pink,
            ),
        canvasColor: const Color.fromRGBO(255, 254, 229, 1),
        appBarTheme: const AppBarTheme(
            centerTitle: true,
            titleTextStyle: TextStyle(
              fontFamily: 'Raleway',
              fontSize: 24,
            )),
        textTheme: ThemeData.light().textTheme.copyWith(
            bodyText1: const TextStyle(
              fontFamily: 'Raleway',
              color: Color.fromRGBO(20, 51, 51, 1),
            ),
            bodyText2: const TextStyle(
              fontFamily: 'Raleway',
              fontSize: 17,
              color: Color.fromRGBO(20, 51, 51, 1),
            ),
            headline1: const TextStyle(
              color: Colors.white70,
              fontSize: 20,
              fontWeight: FontWeight.w700,
              fontFamily: 'RobotoCondensed',
            )),
      ),
      initialRoute: '/',
      routes: {
        Filter_Screen.id: (context) =>
            Filter_Screen(currentFilters: _filters, saveFilters: _setFilters),
        '/': (context) => MainScreen(
              favomeal: _favoMeals,
              
            ),
        choosenCategory.id: (context) =>
            choosenCategory(avalabile_Meal: _availableMeals),
        MealDetail.id: (context) => MealDetail(toggle: toggleFavo, isfavMeal:isfavMeal)
      },
    );
  }
}

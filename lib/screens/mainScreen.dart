import 'package:flutter/material.dart';
import 'package:max_meal_app/screens/Favoraties.dart';

import 'package:max_meal_app/screens/categories_Screen.dart';
import 'package:max_meal_app/widgets/drawer_widget.dart';

import '../models/meals.dart';

class MainScreen extends StatefulWidget {
  List <Meal>favomeal;
   MainScreen({required this.favomeal});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
List<Map<String, Object>>? screens;
  int _selectedIndex = 0;
  @override
  void initState() {
      screens = [
    {'screen': CategoriesScreen(), 'title': Text('Meals')},
    {'screen': favorateScreen(favo: widget.favomeal), 'title':  Text('favorites')}
  ]; 
 
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Main_drawer(),
      appBar: AppBar(
        title: screens![_selectedIndex]['title'] as Widget,
        centerTitle: true,
      ),
      body: screens![_selectedIndex]['screen'] as Widget,
      bottomNavigationBar: BottomNavigationBar(
          currentIndex: _selectedIndex,
          unselectedItemColor: Colors.white,
          unselectedLabelStyle: TextStyle(color: Colors.white),
          unselectedFontSize: 20,
          selectedFontSize: 18,
          type: BottomNavigationBarType.shifting,
          selectedItemColor: Colors.amber,
          onTap: (value) => setState(() {
                _selectedIndex = value;
              }),
          items: [
            BottomNavigationBarItem(
                backgroundColor: Theme.of(context).colorScheme.primary,
                icon: Icon(Icons.category),
                label: 'category'),
            BottomNavigationBarItem(
                backgroundColor: Theme.of(context).colorScheme.primary,
                icon: Icon(Icons.star),
                label: 'favorite'),
          ]),
    );
  }
}

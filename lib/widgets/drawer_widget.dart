import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:max_meal_app/screens/categories_Screen.dart';

import '../screens/Filter_Screen.dart';

class Main_drawer extends StatelessWidget {
  const Main_drawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Drawer(
      child: Column(
        children: [
          Container(
            decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.primary,
                borderRadius: const BorderRadius.vertical(
                  bottom: Radius.circular(30),
                ),
                boxShadow: const [
                  BoxShadow(
                    color: Color.fromARGB(173, 0, 0, 0),
                    offset: Offset(0, 10),
                    blurRadius: 20,
                  ),
                ]),
            alignment: Alignment.center,
            height: 100,
            width: double.infinity,
            child: Text(
              'Meals',
              style: Theme.of(context).textTheme.headline1,
            ),
          ),
          SizedBox(
            height: 30,
          ),
          listTileBuilder(
              title: 'Categories',
              icon: Icons.restaurant_menu,
              ontap: () {
                Navigator.pushReplacementNamed(context, '/');
              }),
          listTileBuilder(
              title: 'filters',
              icon: Icons.settings,
              ontap: () {
                Navigator.pushReplacementNamed(context, Filter_Screen.id);
              })
        ],
      ),
    ));
  }

  ListTile listTileBuilder(
      {required String title,
      required IconData icon,
      required VoidCallback ontap}) {
    return ListTile(
      leading: Icon(
        icon,
        size: 30,
        color: Colors.pink,
      ),
      title: Text(
        title,
        style: const TextStyle(
            color: Colors.black54, fontSize: 22, fontWeight: FontWeight.w700),
      ),
      onTap: ontap,
    );
  }
}

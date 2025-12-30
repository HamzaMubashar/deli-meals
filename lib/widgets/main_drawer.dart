import 'package:deli_meals/screens/filters_screen.dart';
import 'package:deli_meals/screens/tab_bar_screen.dart';
import 'package:flutter/material.dart';

class MainDrawer extends StatefulWidget {
  @override
  State<MainDrawer> createState() => _MainDrawerState();
}

class _MainDrawerState extends State<MainDrawer> {
  Widget BuildListTiles(String text, IconData icon,
      {VoidCallback? tapHandler}) {
    return ListTile(
      onTap: tapHandler,
      leading: Icon(
        icon,
        size: 30,
      ),
      title: Text(
        text,
        style: TextStyle(
          fontSize: 24,
          fontWeight: FontWeight.w700,
          // fontFamily: 'RobotoCondensed',
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.all(20),
            color: Theme.of(context).accentColor,
            height: 130,
            width: double.infinity,
            alignment: Alignment.centerLeft,
            child: Text(
              'Cooking Up!',
              style: TextStyle(
                color: Theme.of(context).primaryColor,
                fontFamily: 'RobotoCondensed',
                fontSize: 35,
                fontWeight: FontWeight.w900,
              ),
            ),
          ),
          const SizedBox(
            height: 20.0,
          ),
          BuildListTiles(
            'Food',
            Icons.restaurant,
            tapHandler: () {
              Navigator.pushReplacementNamed(context, TabsBarScreen.id);
            },
          ),
          BuildListTiles(
            'Filters',
            Icons.settings,
            tapHandler: () {
              Navigator.pushReplacementNamed(context, FiltersScreen.id);
            },
          ),
        ],
      ),
    );
  }
}

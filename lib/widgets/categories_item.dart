import '../screens/categories_meal_screen.dart';
import 'package:flutter/material.dart';

class CotegoriesItem extends StatelessWidget {
  final String id;
  final String title;
  final Color color;
  CotegoriesItem({required this.title, required this.color, required this.id});

  void selectedCategory(BuildContext context) {
    Navigator.pushNamed(context, CategoroiesMealScreen.id, arguments: {
      'id': id,
      'title': title,
    });
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => selectedCategory(context),
      splashColor: Theme.of(context).primaryColor,
      borderRadius: BorderRadius.circular(15.0),
      child: Container(
        padding: const EdgeInsets.all(15.0),
        child: Text(
          title,
          style: Theme.of(context).textTheme.caption,
        ),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [color.withOpacity(0.7), color],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          borderRadius: BorderRadius.circular(15.0),
        ),
      ),
    );
  }
}

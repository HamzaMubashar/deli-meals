import 'package:deli_meals/dummy_categories.dart';
import '../widgets/categories_item.dart';
import 'package:flutter/material.dart';

class CategoriesScreen extends StatelessWidget {
  static const id = 'categories-Screen';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GridView(
        padding: const EdgeInsets.all(25.0),
        children: dummy_categories.map((catdata) {
          return CotegoriesItem(
            id: catdata.id,
            title: catdata.title,
            color: catdata.color,
          );
        }).toList(),
        gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
            maxCrossAxisExtent: 200,
            childAspectRatio: 1.5,
            mainAxisSpacing: 20,
            crossAxisSpacing: 20),
      ),
    );
  }
}

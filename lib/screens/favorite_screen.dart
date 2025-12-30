import 'package:deli_meals/Models/meals.dart';
import 'package:deli_meals/widgets/meal_item.dart';
import 'package:flutter/material.dart';

class FavoriteScreen extends StatefulWidget {
  final List<Meal> favoriteMeal;
  FavoriteScreen(this.favoriteMeal);

  @override
  State<FavoriteScreen> createState() => _FavoriteScreenState();
}

class _FavoriteScreenState extends State<FavoriteScreen> {
  @override
  Widget build(BuildContext context) {
    return widget.favoriteMeal.isEmpty
        ? Center(
            child: Text(
              'You have no favorites yet\n- start adding some!',
              style: TextStyle(
                  color: Colors.red, fontWeight: FontWeight.bold, fontSize: 20),
              textAlign: TextAlign.center,
            ),
          )
        : ListView.builder(
            itemBuilder: (ctx, index) {
              return MealItem(
                id: widget.favoriteMeal[index].id,
                title: widget.favoriteMeal[index].title,
                imageURL: widget.favoriteMeal[index].imageUrl,
                duration: widget.favoriteMeal[index].duration,
                complexity: widget.favoriteMeal[index].complexity,
                affordability: widget.favoriteMeal[index].affordability,
              );
            },
            itemCount: widget.favoriteMeal.length,
          );
  }
}

import '../dummy_categories.dart';
import '../widgets/meal_item.dart';
import '../Models/meals.dart';
import 'package:flutter/material.dart';

class CategoroiesMealScreen extends StatefulWidget {
  static const id = 'categories-meal-screen';

  final List<Meal> availableMeals;
  CategoroiesMealScreen(this.availableMeals);
  @override
  State<CategoroiesMealScreen> createState() => _CategoroiesMealScreenState();
}

class _CategoroiesMealScreenState extends State<CategoroiesMealScreen> {
  String? categorytitle;
  List<Meal>? categoryMeals;
  var _loadedInitData = false;

  @override
  void didChangeDependencies() {
    if (_loadedInitData == false) {
      final routeArgs =
          ModalRoute.of(context)!.settings.arguments as Map<String, String>;
      categorytitle = routeArgs['title'];
      final categoryId = routeArgs['id'];
      categoryMeals = widget.availableMeals.where((meal) {
        return meal.categories.contains(categoryId);
      }).toList();
      _loadedInitData = true;
    }
    super.didChangeDependencies();
  }

  void removeMeal(String mealId) {
    setState(() {
      categoryMeals!.removeWhere((meal) => meal.id == mealId);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          categorytitle!,
          style: TextStyle(fontFamily: 'Raleway'),
        ),
      ),
      body: ListView.builder(
        itemBuilder: (ctx, index) {
          return MealItem(
            id: categoryMeals![index].id,
            title: categoryMeals![index].title,
            imageURL: categoryMeals![index].imageUrl,
            duration: categoryMeals![index].duration,
            complexity: categoryMeals![index].complexity,
            affordability: categoryMeals![index].affordability,
          );
        },
        itemCount: categoryMeals!.length,
      ),
    );
  }
}

import './dummy_categories.dart';
import './screens/filters_screen.dart';
import './screens/meal_detail_screen.dart';
import './screens/tab_bar_screen.dart';
import './Models/meals.dart';
import './screens/categories_meal_screen.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Map<String, bool> _filters = {
    'gluten': false,
    'lactose': false,
    'vegetarian': false,
    'vegan': false,
  };

  List<Meal> _availableMeals = DUMMY_MEALS;
  List<Meal> _favoriteMeals = [];

  void toggleFavorite(String mealId) {
    final axistingIndex =
        _favoriteMeals.indexWhere((meal) => meal.id == mealId);
    if (axistingIndex >= 0) {
      setState(
        () {
          _favoriteMeals.removeAt(axistingIndex);
        },
      );
    } else {
      setState(() {
        _favoriteMeals.add(
          DUMMY_MEALS.firstWhere((meal) => meal.id == mealId),
        );
      });
    }
  }

  bool isFavoriteMeal(String id) {
    return _favoriteMeals.any((meal) => meal.id == id);
  }

  void _setFilters(Map<String, bool> filtersData) {
    setState(() {
      _filters = filtersData;
      _availableMeals = DUMMY_MEALS.where((meal) {
        if (_filters['gluten'] as bool && !meal.isGlutenFree) {
          return false;
        } else if (_filters['lactose'] as bool && !meal.isLactoseFree) {
          return false;
        } else if (_filters['vegetarian'] as bool && !meal.isVegetarian) {
          return false;
        } else if (_filters['vegan'] as bool && !meal.isVegan) {
          return false;
        } else {
          return true;
        }
      }).toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'DeliMeals',
      theme: ThemeData(
        primarySwatch: Colors.pink,
        accentColor: Colors.amber,
        canvasColor: const Color.fromRGBO(255, 254, 229, 1),
        fontFamily: 'Raleway',
        textTheme: ThemeData.light().textTheme.copyWith(
              bodyText1: const TextStyle(
                color: Color.fromRGBO(20, 51, 51, 1),
              ),
              bodyText2: const TextStyle(
                color: Color.fromRGBO(20, 51, 51, 1),
              ),
              caption: const TextStyle(
                fontSize: 20.0,
                fontFamily: 'RobotoCondensed',
                fontWeight: FontWeight.bold,
              ),
            ),
      ),
      initialRoute: TabsBarScreen.id,
      routes: {
        TabsBarScreen.id: (context) => TabsBarScreen(_favoriteMeals),
        CategoroiesMealScreen.id: (context) =>
            CategoroiesMealScreen(_availableMeals),
        MealDetailScreen.id: (context) =>
            MealDetailScreen(toggleFavorite, isFavoriteMeal),
        FiltersScreen.id: (context) => FiltersScreen(_setFilters, _filters),
      },
    );
  }
}

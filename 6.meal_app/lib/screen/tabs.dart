import 'package:flutter/material.dart';
import 'package:meal_app/screen/categories.dart';
// import 'package:meal_app/data/dummy_data.dart';
// import 'package:meal_app/providers/meals_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:meal_app/screen/meals.dart';
import 'package:meal_app/screen/Filters.dart';
// import 'package:meal_app/models/meal.dart';
import 'package:meal_app/widgets/main_drawer.dart';
import 'package:meal_app/providers/favorites_provider.dart';
import 'package:meal_app/providers/filters_provider.dart';

const kInitialFilters = {
  Filter.glutenFree: false,
  Filter.lactoseFree: false,
  Filter.vegetarian: false,
  Filter.vegan: false,
};

class TabsScreen extends ConsumerStatefulWidget {
  const TabsScreen({super.key});

  @override
  ConsumerState<TabsScreen> createState() {
    return _TabsScreenState();
  }
}

class _TabsScreenState extends ConsumerState<TabsScreen> {
  int _selectedPageIndex = 0;
  // final List<Meal> _favotiteMeals = [];
  // Map<Filter, bool> _selectedFilters = kInitialFilters;

  void _showInfoMessage(String message) {}

  // void _toggleMealFavoriteStatus(Meal meal) {
  //   final isExisting = _favotiteMeals.contains(meal);

  //   if (isExisting) {
  //     setState(() {
  //       _favotiteMeals.remove(meal);
  //     });
  //     _showInfoMessage('Meals is no longer a favorite');
  //   } else {
  //     setState(
  //       () {
  //         _favotiteMeals.add(meal);
  //       },
  //     );
  //     _showInfoMessage('Maerked as a favorite!');
  //   }
  // }

  void _selectPage(int index) {
    setState(() {
      _selectedPageIndex = index;
    });
  }

  void _setscreen(String identifier) async {
    if (identifier == 'filters') {
      Navigator.of(context).pop();
      await Navigator.of(context).push<Map<Filter, bool>>(
        MaterialPageRoute(
          builder: (ctx) => const FilersScreen(
              // currentFilter: _selectedFilters,
              ),
        ),
      );
      // print(result);
    } else {
      Navigator.of(context).pop();
    }
  }

  @override
  Widget build(BuildContext context) {
    // final meals = ref.watch(mealsProvider);
    final availableMeals = ref.watch(filteredMealsProvider);

    Widget activePage = CatergoriesScreen(
      // onToggleFavorite: _toggleMealFavoriteStatus,
      availableMeals: availableMeals,
    );
    var activePageTitle = 'Categories';
    if (_selectedPageIndex == 1) {
      final favoritesMeals = ref.watch(favoriteMealsProvider);
      activePage = MealsScreen(
        meals: favoritesMeals,
        // onToggleFavorite: _toggleMealFavoriteStatus,
      );
      activePageTitle = 'Your Favorites';
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(activePageTitle),
      ),
      drawer: MainDrawer(
        onSelectedScreen: _setscreen,
      ),
      body: activePage,
      bottomNavigationBar: BottomNavigationBar(
        onTap: _selectPage,
        currentIndex: _selectedPageIndex,
        items: const [
          BottomNavigationBarItem(
              icon: Icon(Icons.set_meal), label: 'Categories'),
          BottomNavigationBarItem(icon: Icon(Icons.star), label: 'Favorites'),
        ],
      ),
    );
  }
}
// type 'Statefulemelemnt' is not a subtype of type 'widgetref' in type cast 
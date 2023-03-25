import 'package:flutter/material.dart';

import '../../config/theme/colors.dart';
import '../../feature/categories/presentation/pages/categories_page.dart';
import '../../feature/favourites/presentation/pages/favourites_page.dart';
import '../../feature/games/presentation/pages/games_page.dart';
import '../../feature/games/presentation/pages/home_page.dart';

class NavigationContainer extends StatefulWidget {
  const NavigationContainer({Key? key}) : super(key: key);

  @override
  State<NavigationContainer> createState() => _NavigationContainerState();
}

class _NavigationContainerState extends State<NavigationContainer> {
  int _selectedIndex = 0;

  static final List<Widget> _widgetOptions = <Widget>[
    const HomePage(),
    CategoriesPage(),
    FavouritesPage(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _widgetOptions.elementAt(_selectedIndex),
      bottomNavigationBar: BottomNavigationBar(
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home, size: 30, color: _selectedIndex == 0 ? AppColors.orange : AppColors.darkGrey ,),
            label: 'Games',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.category, size: 30, color: _selectedIndex == 1 ? AppColors.orange : AppColors.darkGrey ,),
            label: 'Categories',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite, size: 30, color: _selectedIndex == 2 ? AppColors.orange : AppColors.darkGrey ,),
            label: 'Favourites',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedLabelStyle: const TextStyle(
            fontWeight: FontWeight.normal, color: AppColors.orange),
        unselectedLabelStyle: const TextStyle(
            fontWeight: FontWeight.normal, color: AppColors.darkGrey),
        selectedItemColor: AppColors.orange,
        unselectedItemColor: AppColors.darkGrey,
        onTap: _onItemTapped,
        type: BottomNavigationBarType.fixed,
      ),
    );
  }
}


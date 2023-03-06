import 'package:flutter/material.dart';

import '../../config/theme/colors.dart';
import '../../features/categories/presentation/pages/categories_page.dart';
import '../../features/favourites/presentation/pages/favourites_page.dart';
import '../../features/games/presentation/pages/games_page.dart';
import 'package:fluttericon/iconic_icons.dart';
import 'package:fluttericon/fontelico_icons.dart';

class NavigationContainer extends StatefulWidget {
  const NavigationContainer({Key? key}) : super(key: key);

  @override
  State<NavigationContainer> createState() => _NavigationContainerState();
}

class _NavigationContainerState extends State<NavigationContainer> {
  int _selectedIndex = 0;

  static final List<Widget> _widgetOptions = <Widget>[
    GamesPage(),
    CategoriesPage(),
    const FavouritesPage(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      body: _widgetOptions.elementAt(_selectedIndex),
      bottomNavigationBar: Container(
        margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        decoration:   BoxDecoration(
          borderRadius: BorderRadius.circular(10),
        ),
        child: BottomNavigationBar(
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
      ),
    );
  }
}


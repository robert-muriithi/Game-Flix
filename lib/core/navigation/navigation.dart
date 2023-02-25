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
    const GamesPage(),
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
      body: _widgetOptions.elementAt(_selectedIndex),
      bottomNavigationBar: Container(
        margin: const EdgeInsets.symmetric(horizontal: 16),
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 1,
              blurRadius: 7,
              offset: const Offset(0, 3), // changes position of shadow
            ),
          ],
        ),
        child: BottomAppBar(
          color: Colors.transparent,
          child: SizedBox(
            height: 56,
            width: MediaQuery.of(context).size.width,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  BottomBarItem(
                      text: 'Games',
                      icon: Iconic.home,
                      selected: _selectedIndex == 0,
                      onPressed : (){
                        setState(() {
                          _selectedIndex == 0;
                        });
                      }
                  ),
                  BottomBarItem(
                      text: 'Categories',
                      icon: Iconic.home,
                      selected: _selectedIndex == 1,
                      onPressed : (){
                        setState(() {
                          _selectedIndex == 1;
                        });
                      }
                  ),
                  BottomBarItem(
                      text: 'Favorites',
                      icon: Iconic.home,
                      selected: _selectedIndex == 2,
                      onPressed : (){
                        setState(() {
                          _selectedIndex == 2;
                        });
                      }
                  )
                ],
              ),
            ),
          ),
        ),
      )
      /*BottomNavigationBar(
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home, size: 30, color: _selectedIndex == 0 ? AppColors.orange : AppColors.black ,),
            label: 'Games',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.category, size: 30, color: _selectedIndex == 1 ? AppColors.orange : AppColors.black ,),
            label: 'Categories',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite, size: 30, color: _selectedIndex == 2 ? AppColors.orange : AppColors.black ,),
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
      ),*/
    );
  }
}

class CustomBottomNav extends StatefulWidget {
  const CustomBottomNav({Key? key}) : super(key: key);

  @override
  State<CustomBottomNav> createState() => _CustomBottomNavState();
}

class _CustomBottomNavState extends State<CustomBottomNav> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Container(
       decoration: BoxDecoration(
         boxShadow: [
           BoxShadow(
             color: Colors.grey.withOpacity(0.5),
             spreadRadius: 1,
             blurRadius: 7,
             offset: const Offset(0, 3), // changes position of shadow
           ),
         ],
       ),
      child: BottomAppBar(
        color: Colors.transparent,
        child: SizedBox(
          height: 56,
          width: MediaQuery.of(context).size.width,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                BottomBarItem(
                  text: 'Games',
                  icon: Iconic.home,
                  selected: _selectedIndex == 0,
                  onPressed : (){
                    setState(() {
                      _selectedIndex == 0;
                    });
                  }
                ),
                BottomBarItem(
                    text: 'Categories',
                    icon: Iconic.home,
                    selected: _selectedIndex == 1,
                    onPressed : (){
                      setState(() {
                        _selectedIndex == 1;
                      });
                    }
                ),
                BottomBarItem(
                    text: 'Favorites',
                    icon: Iconic.home,
                    selected: _selectedIndex == 2,
                    onPressed : (){
                      setState(() {
                        _selectedIndex == 2;
                      });
                    }
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class BottomBarItem extends StatelessWidget {
  final String text;
  final IconData icon;
  final bool selected;
  final Function () onPressed;
  const BottomBarItem({Key? key, required this.text, required this.icon, required this.selected, required this.onPressed}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        IconButton(
            onPressed: onPressed,
            icon: Icon(icon, size: 25, color: selected ? AppColors.orange : Colors.black54,)
        ),
        Text(text, style: TextStyle(fontSize: 12, height: .1, color:  selected ? AppColors.orange : Colors.black54), )
      ],
    );
  }
}


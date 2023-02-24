import 'package:flutter/cupertino.dart';
import 'package:game_flix_flutter/features/categories/presentation/pages/categories_page.dart';
import 'package:game_flix_flutter/features/favourites/presentation/pages/favourites_page.dart';
import 'package:game_flix_flutter/features/games/presentation/pages/game_details_page.dart';
import 'package:game_flix_flutter/features/games/presentation/pages/games_page.dart';

import '../../core/navigation/navigation.dart';

class Routes {
  static const String navigationContainer = '/';
  static const String gamesPage = '/games';
  static const String gameDetailsPage = '/game_details';
  static const String categoriesPage = '/categories_page';
  static const String favoritesPage = '/favourites_page';

  static const initialRoute = navigationContainer;

  static final Map<String, WidgetBuilder> routes = {
    navigationContainer: (context) => const NavigationContainer(),
    gamesPage: (context) =>  GamesPage(),
    gameDetailsPage: (context) => const GameDetailsPage(),
    categoriesPage: (context) =>  CategoriesPage(),
    favoritesPage: (context) => const FavouritesPage()
  };

}
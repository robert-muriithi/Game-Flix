import 'package:flutter/material.dart';
import '../../feature/categories/presentation/pages/categories_page.dart';
import '../../feature/favourites/presentation/pages/favourites_page.dart';
import '../../feature/games/presentation/pages/game_details_page.dart';
import '../../feature/games/presentation/pages/games_page.dart';

import '../../core/navigation/navigation.dart';
import '../../feature/categories/domain/model/genre.dart';
import '../../feature/categories/presentation/pages/category_games_page.dart';
import '../../feature/games/domain/model/game.dart';
import '../../feature/games/presentation/pages/home_page.dart';
import '../../feature/games/presentation/pages/screenshots_page.dart';
import '../../feature/onboarding/presentation/pages/onboarding_screens_container.dart';

class Routes {
  static const String navigationContainer = '/';
  static const String gamesPage = '/games';
  static const String gameDetailsPage =  '/game_details';
  static const String categoriesPage = '/categories_page';
  static const String categoryGamesPage = '/categories/games';
  static const String favoritesPage = '/favourites_page';
  static const String screenshotsPage = '/game_details/screenshots';

  static const initialRoute = navigationContainer;

  static final Map<String, WidgetBuilder> routes = {
    //navigationContainer: (context) => const NavigationContainer(),
    navigationContainer: (context) =>  OnBoardingScreensContainer(),
    //gamesPage: (context) =>  GamesPage(),
    gamesPage: (context) => const NavigationContainer(),
    gameDetailsPage: (context) => GameDetailsPage(game: ModalRoute.of(context)!.settings.arguments as GameResults),
    categoriesPage: (context) =>  CategoriesPage(),
    favoritesPage: (context) => const FavouritesPage(),
    screenshotsPage: (context) =>  ScreenshotsPage(
      screenshot: ModalRoute.of(context)!.settings.arguments as String,
    ),
    categoryGamesPage : (context) =>  CategoryGamesPage(
      genre: ModalRoute.of(context)!.settings.arguments as Results,
    ),
  };

}
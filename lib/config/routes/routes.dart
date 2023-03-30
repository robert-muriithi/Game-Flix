import 'package:flutter/material.dart';
import 'package:game_flix_flutter/feature/favourites/presentation/pages/favorite_game_details.dart';
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
import '../../feature/search/domain/model/search_results_model.dart';
import '../../feature/search/presentation/pages/search_page.dart';
import '../../feature/search/presentation/pages/search_result_detail_page.dart';

class Routes {
  static const String navigationContainer = '/';
  static const String homeContainer = '/home_container';
  static const String gamesPage = '/home_container/games';
  static const String gameDetailsPage =  '/home_container/games/game_details';
  static const String categoriesPage = '/home_container/categories';
  static const String categoryGamesPage = '/home_container/categories/games';
  static const String favoritesPage = '/home_container/favorites';
  static const String screenshotsPage = '/home_container/games/game_details/screenshots';
  static const String searchPage = '/home_container/categories/search';
  static const String searchResultDetails = '/home_container/categories/search';
  static const String favoriteGameDetails = '/home_container/favorites/game_details';

  static const initialRoute = navigationContainer;

  static final Map<String, WidgetBuilder> routes = {
    navigationContainer: (context) =>  OnBoardingScreensContainer(),
    homeContainer: (context) => const NavigationContainer(),
    gamesPage: (context) =>  GamesPage(),
    gameDetailsPage: (context) => GameDetailsPage(game: ModalRoute.of(context)!.settings.arguments as GameResults),
    categoriesPage: (context) =>  CategoriesPage(),
    favoritesPage: (context) =>  FavouritesPage(),
    screenshotsPage: (context) =>  ScreenshotsPage(
      screenshot: ModalRoute.of(context)!.settings.arguments as String,
    ),
    categoryGamesPage : (context) =>  CategoryGamesPage(
      genre: ModalRoute.of(context)!.settings.arguments as Results,
    ),
    searchResultDetails : (context) =>  SearchResultDetailsPage(
       result: ModalRoute.of(context)!.settings.arguments as SearchResultsModel,
    ),
    favoriteGameDetails : ((context) => FavoriteGameDetails(
      game: ModalRoute.of(context)!.settings.arguments as GameResults,
    
    )
    ),
  };

}
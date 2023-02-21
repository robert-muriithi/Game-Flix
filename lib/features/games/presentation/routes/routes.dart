import 'package:flutter/cupertino.dart';
import 'package:game_flix_flutter/features/games/presentation/pages/game_details_page.dart';
import 'package:game_flix_flutter/features/games/presentation/pages/games_page.dart';

class Routes {
  static const String gamesPage = '/';
  static const String gameDetailsPage = '/game_details';

  static const initialRoute = gamesPage;

  static final Map<String, WidgetBuilder> routes = {
    gamesPage: (context) =>  GamesPage(),
    gameDetailsPage: (context) => const GameDetailsPage()
  };

}
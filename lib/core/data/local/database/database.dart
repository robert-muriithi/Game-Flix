import 'package:floor/floor.dart';
import 'package:game_flix_flutter/features/categories/data/datasources/local/dao/genres_dao.dart';
import 'dart:async';
import 'package:sqflite/sqflite.dart' as sqflite;

import 'package:game_flix_flutter/features/games/data/datasources/local/dao/games_dao.dart';

import '../../../../features/categories/data/datasources/local/converters/genre_results_type_converter.dart';
import '../../../../features/categories/data/datasources/local/entity/genre/genres_entity.dart';
import '../../../../features/games/data/datasources/local/converters/converters.dart';
import '../../../../features/games/data/datasources/local/entity/game/game_entity.dart';
import '../../../../features/games/data/datasources/local/entity/games_details/games_details.dart';


part 'database.g.dart';

@TypeConverters([
  ResultEntityConverter,
  GameEntityConverter,
  PlatFormResultsConverters,
  PlatformResultTypeConverter,
  RequirementsEnTypeConverter,
  GenresResultTypeConverter,
  TagsResultTypeConverter,
  ShortScreenshotsResultsConverters,
  DevelopersTypeConverter
])
@Database(version: 1, entities: [GamesResultsEntity, GenresResults, GameDetailsEntity])
abstract class GameFlixDatabase extends FloorDatabase {
  GamesDao get gamesDao;
  GenresDao get genresDao;
}
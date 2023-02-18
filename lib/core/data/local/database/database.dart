import 'package:floor/floor.dart';
import 'package:game_flix_flutter/features/games/data/datasources/local/dao/genres_dao.dart';
import 'dart:async';
import 'package:sqflite/sqflite.dart' as sqflite;

import 'package:game_flix_flutter/features/games/data/datasources/local/dao/games_dao.dart';

import '../../../../features/games/data/datasources/local/converters/genre_results_type_converter.dart';
import '../../../../features/games/data/datasources/local/entity/game/game_entity.dart';
import '../../../../features/games/data/datasources/local/entity/genre/genres_entity.dart';


part 'database.g.dart';

@TypeConverters([ResultEntityConverter, GameEntityConverter])
@Database(version: 2, entities: [GamesEntity, GenresEntity])
abstract class GameFlixDatabase extends FloorDatabase {
  GamesDao get gamesDao;
  GenresDao get genresDao;
}
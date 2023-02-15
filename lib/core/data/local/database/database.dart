import 'package:floor/floor.dart';
import 'dart:async';
import 'package:sqflite/sqflite.dart' as sqflite;

import 'package:game_flix_flutter/features/games/data/datasources/local/dao/games_dao.dart';
import 'package:game_flix_flutter/features/games/data/datasources/local/entity/game_entity.dart';

part 'database.g.dart';

@Database(version: 1, entities: [GameEntity])
abstract class GameFlixDatabase extends FloorDatabase {
  GamesDao get gamesDao;
}
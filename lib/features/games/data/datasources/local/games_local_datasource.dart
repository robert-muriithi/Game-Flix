
import 'package:game_flix_flutter/core/data/local/database/database.dart';
import 'package:game_flix_flutter/features/games/data/datasources/local/entity/game_entity.dart';

import '../../../../../core/errors/exceptions.dart';

abstract class GamesLocalDataSource {
  Future<void> deleteGames();
  Future<List<GameEntity>> getGames();
  Future<void> insertGame(List<GameEntity> games);
}

class GamesLocalDataSourceImpl implements GamesLocalDataSource {
  final GameFlixDatabase database;

  GamesLocalDataSourceImpl(this.database);

  @override
  Future<void> deleteGames() async {
    try {
      final dao = database.gamesDao;
      await dao.deleteGames();
    } catch (e) {
      throw DatabaseException(message: e.toString());
    }
  }

  @override
  Future<List<GameEntity>> getGames()  {
    try{
      final dao = database.gamesDao;
      final localCache = dao.getAllGames();
      return localCache;
    }catch (exception){
      throw DatabaseException(message: exception.toString());
    }
  }

  @override
  Future<void> insertGame(List<GameEntity> games) async {
    try{
      final dao = database.gamesDao;
      await dao.insertGames(games);
    }catch (exception){
      throw DatabaseException(message: exception.toString());
    }
  }

}
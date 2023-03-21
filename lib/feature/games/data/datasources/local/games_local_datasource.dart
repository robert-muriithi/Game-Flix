
import 'package:game_flix_flutter/core/data/local/database/database.dart';
import 'package:game_flix_flutter/feature/games/data/datasources/local/entity/game/game_entity.dart';
import 'package:logger/logger.dart';

import '../../../../../core/errors/exceptions.dart';

abstract class GamesLocalDataSource {
  Future<void> deleteGames();
  Future<List<GamesResultsEntity>> getGames();
  Future<void> insertGame(List<GamesResultsEntity> games);
/*  Future<void> addGameToFavorite(GamesResultsEntity game);
  Future<void> removeGameFromFavorite(int id);
  Future<GamesResultsEntity?> getGameFromFavorite(int id);*/
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
  Future<List<GamesResultsEntity>> getGames()  {
    try{
      final dao = database.gamesDao;
      final localCache = dao.getAllGames();
      return localCache;
    }catch (exception){
      throw DatabaseException(message: exception.toString());
    }
  }

  @override
  Future<void> insertGame(List<GamesResultsEntity> games) async {
    final log = Logger();
    try{
      final dao = database.gamesDao;
      await dao.insertGames(games);
    }catch (exception){
      log.e(exception.toString());
      throw DatabaseException(message: exception.toString());
    }
  }

/*  @override
  Future<void> addGameToFavorite(GamesResultsEntity game) async {
    try{
      final dao = database.gamesDao;
      await dao.addGameToFavorite(game);
    }catch (exception){
      throw DatabaseException(message: exception.toString());
    }
  }

  @override
  Future<void> removeGameFromFavorite(int id) async {
    try{
      final dao = database.gamesDao;
      dao.removeGameFromFavorite(id);
    }catch (exception){
      throw DatabaseException(message: exception.toString());
    }
  }

  @override
  Future<GamesResultsEntity?> getGameFromFavorite(int id) async {
    try{
      final dao = database.gamesDao;
      final game = await dao.getGameById(id);
      return  game;
    }catch (exception){
      throw DatabaseException(message: exception.toString());
    }
  }*/

}

import 'package:logger/logger.dart';

import '../../../../../core/data/local/database/database.dart';
import '../../../../../core/errors/exceptions.dart';
import 'entity/favorites/favorites_entity.dart';

abstract class FavoritesLocalDataSource {
  Future<void> addGameToFavorite(FavoriteEntity game);
  Future<void> removeGameFromFavorite(int id);
  Future<FavoriteEntity?> getGameFromFavorite(int id);
  Future<List<FavoriteEntity>> getAllFavorites();
}

class FavoritesLocalDataSourceImpl implements FavoritesLocalDataSource {
  final GameFlixDatabase database;
  FavoritesLocalDataSourceImpl(this.database);


  @override
  Future<void> addGameToFavorite(FavoriteEntity game) async {
    try{
      final dao = database.favoritesDao;
      await dao.addGameToFavorite(game);
    }catch (exception){
      throw DatabaseException(message: exception.toString());
    }
  }

  @override
  Future<FavoriteEntity?> getGameFromFavorite(int id) async {
    try{
      final dao = database.favoritesDao;
      final game = await dao.getGameById(id);
      return  game;
    }catch (exception){
      throw DatabaseException(message: exception.toString());
    }
  }

  @override
  Future<void> removeGameFromFavorite(int id) async {
    try{
      final dao = database.favoritesDao;
      dao.removeGameFromFavorite(id);
    }catch (exception){
      throw DatabaseException(message: exception.toString());
    }
  }

  @override
  Future<List<FavoriteEntity>> getAllFavorites() async {
    final log = Logger();
    try{
      final dao = database.favoritesDao;
      final games = await dao.getAllFavorites();
      log.d(games.map((e) => e.platforms).toList());
      return games;
    }catch (exception){
      throw DatabaseException(message: exception.toString());
    }
  }

}
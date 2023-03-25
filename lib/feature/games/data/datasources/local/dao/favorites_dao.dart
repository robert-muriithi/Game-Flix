
import 'package:floor/floor.dart';
import 'package:game_flix_flutter/feature/games/data/datasources/local/entity/favorites/favorites_entity.dart';

import '../../../../../../core/utils/constants.dart';


@dao
abstract class FavoritesDao {
  @Insert(onConflict: OnConflictStrategy.replace)
  Future<void> addGameToFavorite(FavoriteEntity game);

  @Query('DELETE FROM ${Constants.kFavoritesTableName} WHERE id = :id')
  Future<void> removeGameFromFavorite(int id);

  @Query('SELECT * FROM ${Constants.kFavoritesTableName} WHERE id = :id')
  Future<FavoriteEntity?> getGameById(int id);

  @Query('SELECT * FROM ${Constants.kFavoritesTableName}')
  Future<List<FavoriteEntity>> getAllFavorites();

}
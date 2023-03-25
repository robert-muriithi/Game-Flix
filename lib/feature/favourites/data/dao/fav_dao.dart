import 'package:floor/floor.dart';
import 'package:game_flix_flutter/core/utils/constants.dart';
import '../entity/fav_game_entity.dart';

/*
abstract class FavouritesDao {
  @Insert(onConflict: OnConflictStrategy.replace)
  Future<void> addToFavourites(FavoritesEntity favourite);

  @Query('SELECT * FROM ${Constants.kFavoritesTableName}')
  Future<List<FavoritesEntity>> getFavorites ();

  @Query('DELETE FROM ${Constants.kFavoritesTableName}')
  Future<void> deleteAllFavourites ();

  @Query('DELETE FROM ${Constants.kFavoritesTableName} WHERE id (:id)')
  Future<void> deleteFavourite(int id);

  @Insert(onConflict: OnConflictStrategy.replace)
  Future<void> addGameToFavorite(FavoritesEntity game);

  @Query('DELETE FROM ${Constants.kFavoritesTableName} WHERE id = :id')
  Future<void> removeGameFromFavorite(int id);

}*/

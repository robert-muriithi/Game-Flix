import 'package:floor/floor.dart';
import 'package:game_flix_flutter/core/utils/constants.dart';
import '../entity/fav_game_entity.dart';

abstract class FavouritesDao {
  @Insert(onConflict: OnConflictStrategy.replace)
  Future<void> addToFavourites(FavouriteEntity favourite);

  @Query('SELECT * FROM ${Constants.kFavoritesTableName}')
  Future<List<FavouriteEntity>> getFavorites ();

  @Query('DELETE FROM ${Constants.kFavoritesTableName}')
  Future<void> deleteAllFavourites ();

  @Query('DELETE FROM ${Constants.kFavoritesTableName} WHERE id (:id)')
  Future<void> deleteFavourite(String id);
}
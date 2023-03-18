import 'package:floor/floor.dart';

import '../../../../../../core/utils/constants.dart';
import '../entity/game/game_entity.dart';
import '../entity/games_details/games_details.dart';

@dao
abstract class GamesDao {

  @Insert(onConflict: OnConflictStrategy.replace)
  Future<void> insertGames(List<GamesResultsEntity> games);

  @Query('SELECT * FROM ${Constants.kGameTableName}')
  Future<List<GamesResultsEntity>> getAllGames();

  @Query('DELETE FROM ${Constants.kGameTableName}')
  Future<void> deleteGames();

  @Insert(onConflict: OnConflictStrategy.replace)
  Future<void> insertGameDetails(GameDetailsEntity game);

  @Query('SELECT * FROM ${Constants.kGameDetailsTable}')
  Future<GameDetailsEntity?> getGameDetails();

  @Query('DELETE FROM ${Constants.kGameDetailsTable}')
  Future<void> deleteGameDetails();

  @Insert(onConflict: OnConflictStrategy.replace)
  Future<void> addGameToFavorite(GamesResultsEntity game);

  @Query('DELETE FROM ${Constants.kFavoritesTableName} WHERE id = :id')
  Future<void> removeGameFromFavorite(int id);

  @Query('SELECT * FROM ${Constants.kGameTableName} WHERE id = :id')
  Future<GamesResultsEntity?> getGameById(int id);

}
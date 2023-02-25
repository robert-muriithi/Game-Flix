import 'package:floor/floor.dart';

import '../../../../../../core/utils/constants.dart';
import '../entity/game/game_entity.dart';

@dao
abstract class GamesDao {

  @Insert(onConflict: OnConflictStrategy.replace)
  Future<void> insertGames(List<GamesResultsEntity> games);

  @Query('SELECT * FROM ${Constants.kGameTableName}')
  Future<List<GamesResultsEntity>> getAllGames();

  @Query('DELETE FROM ${Constants.kGameTableName}')
  Future<void> deleteGames();
  
}
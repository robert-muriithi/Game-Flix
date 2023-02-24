import 'package:floor/floor.dart';

import '../../../../../../core/utils/constants.dart';
import '../entity/game/game_entity.dart';

@dao
abstract class GamesDao {

  @Insert(onConflict: OnConflictStrategy.replace)
  Future<void> insertGames(List<GamesEntity> games);

  @Query('SELECT * FROM ${Constants.kGameTableName}')
  Future<List<GamesEntity>> getAllGames();

  @Query('DELETE FROM ${Constants.kGameTableName}')
  Future<void> deleteGames();
  
}
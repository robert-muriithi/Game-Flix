
import 'package:floor/floor.dart';

import '../../../../../../core/utils/constants.dart';
import '../entity/games_details/games_details.dart';

@dao
abstract class GameDetailsDao {
  @Insert(onConflict: OnConflictStrategy.replace)
  Future<void> insertGameDetails(GameDetailsEntity game);

  @Query('SELECT * FROM ${Constants.kGameDetailsTable}')
  Future<GameDetailsEntity?> getGameDetails();

  @Query('DELETE FROM ${Constants.kGameDetailsTable}')
  Future<void> deleteGameDetails();
}
import 'package:logger/logger.dart';
import '../../../../../core/data/local/database/database.dart';
import '../../../../../core/errors/exceptions.dart';
import 'entity/games_details/games_details.dart';

abstract class GameDetailsLocalDataSource {
  Future<void> deleteGameDetails();
  Future<GameDetailsEntity?> getGameDetails();
  Future<void> insertGameDetails(GameDetailsEntity game);
}

class GameDetailsLocalDataSourceImpl implements GameDetailsLocalDataSource {
  final GameFlixDatabase database;
  GameDetailsLocalDataSourceImpl(this.database);

  @override
  Future<void> deleteGameDetails() async {
    try {
      final dao = database.gameDetailsDao;
      await dao.deleteGameDetails();
    } catch (e) {
      throw DatabaseException(message: e.toString());
    }
  }

  @override
  Future<GameDetailsEntity?> getGameDetails()  {
    try{
      final dao = database.gameDetailsDao;
      final localCache =  dao.getGameDetails();
      return localCache;
    }catch (exception){
      throw DatabaseException(message: exception.toString());
    }
  }

  @override
  Future<void> insertGameDetails(GameDetailsEntity game) async {
    final log = Logger();
    try{
      final dao = database.gameDetailsDao;
      await dao.insertGameDetails(game);
    }catch (exception){
      log.e(exception.toString());
      throw DatabaseException(message: exception.toString());
    }
  }

}
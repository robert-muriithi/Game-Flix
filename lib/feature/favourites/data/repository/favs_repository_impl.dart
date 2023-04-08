import 'package:dartz/dartz.dart';
import 'package:game_flix_flutter/core/errors/exceptions.dart';
import 'package:game_flix_flutter/core/errors/failure.dart';
import 'package:game_flix_flutter/feature/games/data/datasources/local/entity/favorites/favorites_entity.dart';
import 'package:game_flix_flutter/feature/games/domain/model/game.dart';

import '../../../games/data/datasources/local/favorites_local_data_source.dart';
import '../../../games/data/mappers/mappers.dart';
import '../../domain/repository/favs_repository.dart';

class FavsRepositoryImpl implements FavsRepository {
  final FavoritesLocalDataSource favoritesLocalDataSource;

  FavsRepositoryImpl(this.favoritesLocalDataSource);

  @override
  Future<Either<Failure, List<GameResults>>> getAllFavorites() async {
    try {
      final results = await favoritesLocalDataSource.getAllFavorites();
      final favs = results.map((e) => toFavoriteEntityFromDomain(e)).toList();
      return Right(favs);
    } on DatabaseException catch (e) {
      return Left(DatabaseFailure(e.message));
    }
  }

  @override
  Future<Either<Failure, GameResults>> getGameFromFavorite(int id) async {
    try{
      final results = await favoritesLocalDataSource.getGameFromFavorite(id);
      final favResult = toFavoriteEntityFromDomain(results!);
      return Right(favResult);
    } on DatabaseException catch(e){
      return Left(DatabaseFailure(e.message));
    }
  }

}
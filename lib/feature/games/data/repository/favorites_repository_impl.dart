import 'package:dartz/dartz.dart';
import 'package:game_flix_flutter/core/errors/failure.dart';
import 'package:game_flix_flutter/feature/games/data/datasources/local/favorites_local_data_source.dart';
import 'package:game_flix_flutter/feature/games/domain/model/game.dart';
import 'package:game_flix_flutter/feature/games/domain/repository/favorites_repository.dart';
import 'package:logger/logger.dart';
import '../../../../core/errors/exceptions.dart';
import '../mappers/mappers.dart';

class FavoritesRepositoryImpl implements FavoritesRepository {
  final FavoritesLocalDataSource favoritesLocalDataSource;

  FavoritesRepositoryImpl({required this.favoritesLocalDataSource});

  @override
  Future<Either<Failure, bool>> addGameToFavorite(GameResults game) async {
    final log = Logger();
    try {
      await favoritesLocalDataSource
          .addGameToFavorite(fromFavoriteEntityToDomain(game));
      return const Right(true);
    } on DatabaseException catch (e) {
      log.e(e.message);
      return Left(DatabaseFailure(e.message));
    }
  }

  //Remove game from favorites
  @override
  Future<Either<Failure, bool>> removeGameFromFavorite(int id) async {
    final log = Logger();
    try {
      await favoritesLocalDataSource.removeGameFromFavorite(id);
      return const Right(true);
    } on DatabaseException catch (e) {
      log.e(e.message);
      return Left(DatabaseFailure(e.message));
    }
  }

  @override
  Future<Either<Failure, GameResults>> getGameFromFavorite(int id) async {
    try {
      final game = await favoritesLocalDataSource.getGameFromFavorite(id);
      if (game == null) {
        return const Left(DatabaseFailure('Game not found'));
      }
      final result = toFavoriteEntityFromDomain(game);
      return Right(result);
    } on DatabaseException catch (e) {
      return Left(DatabaseFailure(e.message));
    }
  }

  @override
  Future<Either<Failure, List<GameResults>>> getAllFavorites() {
    try {
      final dao = favoritesLocalDataSource.getAllFavorites();
      return dao.then((value) =>
          Right(value.map((e) => toFavoriteEntityFromDomain(e)).toList()));
    } on DatabaseException catch (e) {
      return Future.value(Left(DatabaseFailure(e.message)));
    }
  }
}

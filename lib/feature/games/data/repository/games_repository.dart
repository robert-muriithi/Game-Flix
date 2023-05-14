import 'package:dartz/dartz.dart';
import '../../../../core/errors/exceptions.dart';
import '../../../../core/errors/failure.dart';
import '../datasources/local/games_local_datasource.dart';
import '../datasources/remote/games_remote_data_source.dart';
import '../../domain/model/game.dart';
import '../../domain/model/game_deatils.dart';
import '../../domain/repository/games_repository.dart';
import '../../../../core/network/network.dart';
import '../../../../core/params/params.dart';
import '../datasources/local/game_details_datasource.dart';
import '../datasources/remote/game_details_remote_data_source.dart';
import '../mappers/mappers.dart';
import 'package:logger/logger.dart';

class GamesRepositoryImpl implements GamesRepository {
  final GamesLocalDataSource gamesLocalDataSource;
  final GameDetailsLocalDataSource gameDetailsLocalDataSource;
  final GamesRemoteDataSource gamesRemoteDataSource;
  final GameDetailsRemoteDataSource gameDetailsRemoteDataSource;

  ///final FavoritesLocalDataSource favoritesLocalDataSource;
  final NetworkInfo networkInfo;

  GamesRepositoryImpl({
    required this.gamesRemoteDataSource,
    required this.gamesLocalDataSource,
    required this.networkInfo,
    required this.gameDetailsRemoteDataSource,
    required this.gameDetailsLocalDataSource,
    // required this.favoritesLocalDataSource
  });

  @override
  Future<Either<Failure, List<GameResults>>> getAllGames(Params params) async {
    final log = Logger();
    if (await networkInfo.isConnected()) {
      try {
        final remoteData = await gamesRemoteDataSource.getGames(
          key: params.apiKey,
          page: params.page,
          pageSize: params.pageSize,
        );

        gamesLocalDataSource.deleteGames();
        final gameResults = remoteData.results
            ?.map((e) => fromResultResponseToEntity(e))
            .toList();
        await gamesLocalDataSource.insertGame(gameResults ?? []);
        final localData = await gamesLocalDataSource.getGames();
        final games = localData.map((e) => fromEntityToDomain(e)).toList();
        return Right(games);
      } on ServerException catch (e) {
        return Left(ServerFailure(e.message));
      }
    } else {
      try {
        final localData = await gamesLocalDataSource.getGames();
        final games = localData.map((e) => fromEntityToDomain(e)).toList();
        return Right(games);
      } on DatabaseException catch (exception) {
        return Left(DatabaseFailure(exception.message));
      }
    }
  }

  @override
  Future<Either<Failure, GameDetails>> getGameDetails(
      GameDetailsParams params) async {
    final log = Logger();
    if (await networkInfo.isConnected()) {
      try {
        final remoteData = await gameDetailsRemoteDataSource.getGameDetails(
            id: params.id, key: params.apiKey);
        gameDetailsLocalDataSource.deleteGameDetails();
        final gameResults = fromGameDetailsResponseToEntity(remoteData);
        await gameDetailsLocalDataSource.insertGameDetails(gameResults);
        final localData = await gameDetailsLocalDataSource.getGameDetails();
        final game = fromGameDetailsEntityToDomain(localData!);

        return Right(game);
      } on ServerException catch (e) {
        return Left(ServerFailure(e.message));
      }
    } else {
      try {
        final localData = await gameDetailsLocalDataSource.getGameDetails();
        final game = fromGameDetailsEntityToDomain(localData!);
        return Right(game);
      } on DatabaseException catch (exception) {
        return Left(DatabaseFailure(exception.message));
      }
    }
  }
}

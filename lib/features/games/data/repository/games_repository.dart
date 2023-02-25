import 'package:dartz/dartz.dart';
import 'package:game_flix_flutter/core/errors/exceptions.dart';
import 'package:game_flix_flutter/core/errors/failure.dart';
import 'package:game_flix_flutter/core/usecase/usecase.dart';
import 'package:game_flix_flutter/features/games/data/datasources/local/games_local_datasource.dart';
import 'package:game_flix_flutter/features/categories/data/datasources/local/genres_local_datasource.dart';
import 'package:game_flix_flutter/features/games/data/datasources/remote/remote_data_source.dart';
import 'package:game_flix_flutter/features/categories/data/datasources/remote/remote_genres_data_source.dart';
import 'package:game_flix_flutter/features/games/domain/model/game.dart';
import 'package:game_flix_flutter/features/categories/domain/model/genre.dart';
import 'package:game_flix_flutter/features/games/domain/repository/games_repository.dart';
import '../../../../core/network/network.dart';
import '../mappers/mappers.dart';
import 'package:logger/logger.dart';

class GamesRepositoryImpl implements GamesRepository {
  final GamesLocalDataSource localDataSource;
  final GamesRemoteDataSource remoteDataSource;
  final NetworkInfo networkInfo;

  GamesRepositoryImpl(
      {required this.remoteDataSource,
      required this.localDataSource,
      required this.networkInfo});

  @override
  Future<Either<Failure, List<GameResults>>> getAllGames(Params params) async {
    final log  = Logger();
    if (await networkInfo.isConnected()) {
      try {
        final remoteData = await remoteDataSource.getGames(
          key: params.apiKey,
          page: params.page,
          pageSize: params.pageSize,
        );

        localDataSource.deleteGames();
        final gameResults = remoteData.results?.map((e)=> fromResultResponseToEntity(e)).toList();
        await localDataSource.insertGame(gameResults ?? []);
        final localData = await localDataSource.getGames();
        final games = localData.map((e) => fromEntityToDomain(e)).toList();
        return Right(games);
      } on ServerException catch (e) {
        return Left(ServerFailure(e.message));
      }
    } else {
      try {
        final localData = await localDataSource.getGames();
        final games = localData.map((e) => fromEntityToDomain(e)).toList();
        return Right(games);
      } on DatabaseException catch (exception) {
        return Left(DatabaseFailure(exception.message));
      }
    }
  }


}

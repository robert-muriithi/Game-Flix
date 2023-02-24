import 'package:dartz/dartz.dart';
import 'package:game_flix_flutter/core/errors/exceptions.dart';
import 'package:game_flix_flutter/core/errors/failure.dart';
import 'package:game_flix_flutter/features/games/data/datasources/local/games_local_datasource.dart';
import 'package:game_flix_flutter/features/games/data/datasources/remote/remote_data_source.dart';
import 'package:game_flix_flutter/features/games/domain/model/game.dart';
import 'package:game_flix_flutter/features/games/domain/repository/games_repository.dart';
import '../../../../core/network/network.dart';
import '../mappers/mappers.dart';

class GamesRepositoryImpl implements GamesRepository {
  final GamesLocalDataSource localDataSource;
  final GamesRemoteDataSource remoteDataSource;
  final NetworkInfo networkInfo;

  GamesRepositoryImpl(
      {required this.remoteDataSource,
      required this.localDataSource,
      required this.networkInfo});

  @override
  Future<Either<Failure, List<Game>>> getAllGames() async {
    if(await networkInfo.isConnected()){
      try{
         final remoteData = await remoteDataSource.getGames();
         localDataSource.deleteGames();
         await localDataSource.insertGame(remoteData.map((e) => toEntity(e)).toList());
         final localData = await localDataSource.getGames();
         final games = localData.map((e) => toGame(e)).toList();
         return Right(games);
      } on ServerException catch (e) {
        return Left(ServerFailure(e.message));
      }
    }else{
      try {
        final localData = await localDataSource.getGames();
        final games = localData.map((e) => toGame(e)).toList();
        return Right(games);
      } on DatabaseException catch (exception) {
        return Left(DatabaseFailure(exception.message));
      }
    }
  }
}

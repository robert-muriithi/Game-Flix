import 'package:dartz/dartz.dart';
import 'package:game_flix_flutter/core/errors/exceptions.dart';
import 'package:game_flix_flutter/core/errors/failure.dart';
import 'package:game_flix_flutter/features/games/data/datasources/local/games_local_datasource.dart';
import 'package:game_flix_flutter/features/games/data/datasources/local/genres_local_datasource.dart';
import 'package:game_flix_flutter/features/games/data/datasources/remote/remote_data_source.dart';
import 'package:game_flix_flutter/features/games/data/datasources/remote/remote_genres_data_source.dart';
import 'package:game_flix_flutter/features/games/domain/model/game.dart';
import 'package:game_flix_flutter/features/games/domain/model/genre.dart';
import 'package:game_flix_flutter/features/games/domain/repository/games_repository.dart';
import '../../../../core/network/network.dart';
import '../mappers/mappers.dart';
import 'package:logger/logger.dart';

class GamesRepositoryImpl implements GamesRepository {
  final GamesLocalDataSource localDataSource;
  final GamesRemoteDataSource remoteDataSource;
  final GenresRemoteDataSource genresRemoteDataSource;
  final GenresLocalDataSource genresLocalDataSource;
  final NetworkInfo networkInfo;

  GamesRepositoryImpl(
      {required this.remoteDataSource,
      required this.localDataSource,
      required this.genresRemoteDataSource,
      required this.genresLocalDataSource,
      required this.networkInfo});

  @override
  Future<Either<Failure, List<Game>>> getAllGames() async {
    final log  = Logger();
    if (await networkInfo.isConnected()) {
      try {
        final remoteData = await remoteDataSource.getGames();
        localDataSource.deleteGames();
        await localDataSource.insertGame(remoteData.map((e) => toEntity(e)).toList());
        final localData = await localDataSource.getGames();
        final games = localData.map((e) => toGame(e)).toList();
        return Right(games);
      } on ServerException catch (e) {
        return Left(ServerFailure(e.message));
      }
    } else {
      try {
        final localData = await localDataSource.getGames();
        final games = localData.map((e) => toGame(e)).toList();
        return Right(games);
      } on DatabaseException catch (exception) {
        return Left(DatabaseFailure(exception.message));
      }
    }
  }

/*  @override
  Future<Either<Failure, List<Genre>>> getAllGenres() async {
    final log  = Logger();
    if (await networkInfo.isConnected()) {
      try {
        final remoteData = await genresRemoteDataSource.getGenres();
        genresLocalDataSource.deleteGenres();
        //Insert genres to local database
        
        await genresLocalDataSource.insertGenres(remoteData.genresResponseToEntity(remoteData));
        
        
        
        //await genresLocalDataSource.insertGenres(remoteData.map((e) => toEntityGenre(e)).toList());
       // await genresLocalDataSource.insertGenres(remoteData);
        final localData = await genresLocalDataSource.getGenres();
        final genres = localData.map((e) => toGenre(e)).toList();
        return Right(genres);
      } on ServerException catch (e) {
        return Left(ServerFailure(e.message));
      }
    } else {
      try {
        final localData = await genresLocalDataSource.getGenres();
        final games = localData.map((e) => toGenre(e)).toList();
        return Right(games);
      } on DatabaseException catch (exception) {
        return Left(DatabaseFailure(exception.message));
      }
    }
  }*/

  @override
  Future<Either<Failure, List<Results>>> getGenres() async {
    final log = Logger();
    if (await networkInfo.isConnected()) {
      try {
        final genreResponse = await  genresRemoteDataSource.getGenres();
        //Delete any existing genres
        genresLocalDataSource.deleteGenres();
        //Insert genres to local database
        final genreResults = genreResponse.results?.map((e) => fromResultResponseToEntity(e)).toList();
        genresLocalDataSource.insertGenres(genreResults ?? []);

        final localData = await genresLocalDataSource.getGenres();
        final genres = localData.map((e) => fromEntityToDomainResults(e)).toList();
        return Right(genres);
      } on ServerException catch (e) {
        return Left(ServerFailure(e.message));
      }
    } else {
      try {
        final localData = await genresLocalDataSource.getGenres();
        final games = localData.map((e) => fromEntityToDomainResults(e)).toList();
        return Right(games);
      } on DatabaseException catch (exception) {
        return Left(DatabaseFailure(exception.message));
      }
    }
  }
}

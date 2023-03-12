import 'package:dartz/dartz.dart';
import 'package:game_flix_flutter/core/errors/failure.dart';
import 'package:game_flix_flutter/feature/categories/domain/model/genre.dart';
import 'package:game_flix_flutter/feature/categories/domain/repository/categories_repository.dart';
import 'package:game_flix_flutter/feature/games/domain/model/game.dart';
import 'package:logger/logger.dart';

import '../../../../core/errors/exceptions.dart';
import '../../../../core/network/network.dart';
import '../../../../core/utils/constants.dart';
import '../datasources/local/genres_local_datasource.dart';
import '../datasources/remote/remote_genres_data_source.dart';
import '../mappers/mappers.dart';

class CategoriesRepositoryImpl implements CategoriesRepository {
  final GenresRemoteDataSource genresRemoteDataSource;
  final GenresLocalDataSource genresLocalDataSource;
  final NetworkInfo networkInfo;

  CategoriesRepositoryImpl({
    required this.genresRemoteDataSource,
    required this.genresLocalDataSource,
    required this.networkInfo});

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

  @override
  Future<Either<Failure, GameResults>> getGamesByGenre({required int id}) async {
    if (await networkInfo.isConnected()) {
      try {
        final gameResponse = await genresRemoteDataSource.getGamesByGenre(id: id, key: Constants.apiKey);
        return Right(gameResponse);
      } on ServerException catch (e) {
        return Left(ServerFailure(e.message));
      }
    } else {
      return const Left(ServerFailure('No internet connection'));
    }
  }

  @override
  Future<Either<Failure, List<GameResults>>> getGenreGames(List<int> ids) async {
    if(await networkInfo.isConnected()){
      List<GameResults> games = [];
      for(int id in ids){
        final gameResponse = await genresRemoteDataSource.getGamesByGenre(id: id, key: Constants.apiKey);
        games.add(gameResponse);
      }
      return Right(games);
    }else{
      return const Left(ServerFailure('No internet connection'));
    }
  }

}

import 'package:dartz/dartz.dart';
import 'package:game_flix_flutter/core/params/params.dart';
import 'package:game_flix_flutter/feature/games/domain/model/game_deatils.dart';
import 'package:game_flix_flutter/feature/tags/domain/model/tag.dart';
import 'package:logger/logger.dart';

import '../../../../core/errors/exceptions.dart';
import '../../../../core/errors/failure.dart';
import '../../../../core/network/network.dart';
import '../../../games/data/datasources/remote/game_details_remote_data_source.dart';
import '../../domain/repository/tags_repository.dart';
import '../datasource/remote/tags_remote_data_source.dart';

class TagsRepositoryImpl implements TagsRepository {
  final TagsRemoteDataSource tagsRemoteDataSource;
  final GameDetailsRemoteDataSource gameDetailsRemoteDataSource;
  final NetworkInfo networkInfo;

  TagsRepositoryImpl({
    required this.tagsRemoteDataSource,
    required this.gameDetailsRemoteDataSource,
    required this.networkInfo,
  });

  @override
  Future<Either<Failure, List<TagResult>>> getTags(Params params) async {
    final log = Logger();
    if (await networkInfo.isConnected()) {
      try {
        final remoteTags = await tagsRemoteDataSource.getTags(
          key: params.apiKey,
          page: params.page,
          pageSize: params.pageSize,
        );
        final results = remoteTags.results ?? [];
        log.i('Tags: ${results.length}');
        return Right(results);
      } on ServerException catch (e) {
        return Left(ServerFailure(e.message));
      }
    } else {
      return const Left(ServerFailure('No Internet Connection'));
    }
  }

  @override
  Future<Either<Failure, List<GameDetails>>> getGames(
      GamesParams params) async {
    final log = Logger();
    if (await networkInfo.isConnected()) {
      try {
        List<GameDetails> games = [];
        for (int id in params.ids) {
          final remoteGames = await gameDetailsRemoteDataSource.getGameDetails(
            key: params.apiKey,
            id: id,
          );
          games.add(remoteGames);
        }
        log.i('Games: ${games.length}');
        return Right(games);
      } on ServerException catch (e) {
        return Left(ServerFailure(e.message));
      }
    } else {
      return const Left(ServerFailure('No Internet Connection'));
    }
  }
}

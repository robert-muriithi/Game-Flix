import 'package:dartz/dartz.dart';
import 'package:game_flix_flutter/core/params/params.dart';
import '../../../../core/errors/failure.dart';
import '../../../games/domain/model/game_deatils.dart';
import '../model/tag.dart';

abstract class TagsRepository {
  Future<Either<Failure, List<TagResult>>> getTags(Params params);

  Future<Either<Failure, List<GameDetails>>> getGames(GamesParams params);
}

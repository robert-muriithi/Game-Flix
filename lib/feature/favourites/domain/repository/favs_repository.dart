import 'package:dartz/dartz.dart';
import '../../../../core/errors/failure.dart';
import '../../../games/domain/model/game.dart';

abstract class FavsRepository{
  Future<Either<Failure, GameResults>> getGameFromFavorite(int id);
  Future<Either<Failure, List<GameResults>>> getAllFavorites();
}
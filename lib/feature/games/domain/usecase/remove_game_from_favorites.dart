

import 'package:dartz/dartz.dart';

import '../../../../core/errors/failure.dart';
import '../../../../core/usecase/usecase.dart';
import '../repository/games_repository.dart';

class RemoveGameFromFavoritesUseCase extends UseCase<bool, int> {
  final GamesRepository repository;

  RemoveGameFromFavoritesUseCase(this.repository);

  @override
  Future<Either<Failure, bool>> call(int params) {
    return repository.removeGameFromFavorite(params);
  }
}
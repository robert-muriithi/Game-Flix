import 'package:dartz/dartz.dart';
import 'package:game_flix_flutter/core/errors/failure.dart';
import 'package:game_flix_flutter/core/usecase/usecase.dart';
import '../../../games/domain/model/game.dart';
import '../../../games/domain/repository/favorites_repository.dart';
import '../../../../core/params/params.dart';

class GetFavoritesUseCase extends UseCase<List<GameResults>, NoParams> {
  final FavoritesRepository repository;
   GetFavoritesUseCase(this.repository);

  @override
  Future<Either<Failure, List<GameResults>>> call(NoParams params) async {
    return await repository.getAllFavorites();
  }

}

import 'package:dartz/dartz.dart';
import 'package:game_flix_flutter/features/games/domain/model/genre.dart';

import '../../../../core/errors/failure.dart';
import '../../../../core/usecase/usecase.dart';
import '../repository/games_repository.dart';

class GetAllGenresUseCase extends UseCase<List<Results>, NoParams> {
  final GamesRepository repository;
  GetAllGenresUseCase(this.repository);

  @override
  Future<Either<Failure, List<Results>>> call(NoParams params) async {
    return repository.getGenres();
  }

}
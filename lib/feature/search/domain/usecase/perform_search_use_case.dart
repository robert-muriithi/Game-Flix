
import 'package:dartz/dartz.dart';
import 'package:game_flix_flutter/core/params/params.dart';
import '../../../../core/errors/failure.dart';
import '../../../../core/usecase/usecase.dart';
import '../model/search_results_model.dart';
import '../repository/search_repository.dart';

class PerformSearchUseCase extends UseCase<List<SearchResultsModel>, SearchParams> {
  final SearchRepository repository;
  PerformSearchUseCase(this.repository);

  @override
  Future<Either<Failure, List<SearchResultsModel>>> call(SearchParams params) async {
    return repository.searchGames(params);
  }

}
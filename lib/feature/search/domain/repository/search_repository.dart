import 'package:dartz/dartz.dart';
import '../../../../core/errors/failure.dart';
import '../../../../core/params/params.dart';
import '../model/search_results_model.dart';

abstract class SearchRepository {
  Future<Either<Failure, List<SearchResultsModel>>> searchGames(SearchParams params);
}
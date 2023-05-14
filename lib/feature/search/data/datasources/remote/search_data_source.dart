import 'package:logger/logger.dart';
import '../../../../../core/errors/exceptions.dart';
import '../../../../../core/params/params.dart';
import 'package:dio/dio.dart';
import '../../model/search_results_response.dart';

abstract class SearchRemoteDataSource {
  Future<SearchResultsResponse> searchGames(SearchParams params);
}

class SearchRemoteDataSourceImpl implements SearchRemoteDataSource {
  final Dio dio;

  SearchRemoteDataSourceImpl(this.dio);

  @override
  Future<SearchResultsResponse> searchGames(SearchParams params) async {
    final log = Logger();
    try {
      final response = await dio.get(
        'https://api.rawg.io/api/games',
        queryParameters: {
          'search': params.query,
          'page': params.page,
          'page_size': params.pageSize,
          'key': params.apiKey,
        },
      );
      return SearchResultsResponse.fromJson(response.data);
    } catch (exception) {
      log.e(exception);
      throw ServerException(message: exception.toString());
    }
  }
}

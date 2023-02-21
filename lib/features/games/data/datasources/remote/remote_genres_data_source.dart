import 'package:game_flix_flutter/core/errors/exceptions.dart';
import 'package:game_flix_flutter/core/utils/constants.dart';
import 'package:game_flix_flutter/features/games/data/model/games_response.dart';
import 'package:dio/dio.dart';
import 'package:logger/logger.dart';
import '../../model/genres_response.dart';

abstract class GenresRemoteDataSource {
  Future<List<GenreResponse>> getGenres();
}

class GenresRemoteDataSourceImpl extends GenresRemoteDataSource {
  final Dio dio;
  GenresRemoteDataSourceImpl(this.dio);

  @override
  Future<List<GenreResponse>> getGenres() async {
    final log = Logger();
    try{
      final response = await dio.get('${Constants.kBaserUrl}?key=${Constants.apiKey}');
      log.d(response.data);
      final data = response.data as List;
      final parsedData = data.map((e) => GenreResponse.fromJson(e)).toList();
      return parsedData;
    }catch (exception){
      log.e(exception);
      throw ServerException(message: exception.toString());
    }
  }

}
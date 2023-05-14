import 'package:game_flix_flutter/core/errors/exceptions.dart';
import 'package:game_flix_flutter/core/utils/constants.dart';
import 'package:dio/dio.dart';
import 'package:logger/logger.dart';
import '../../../../games/data/model/games_response.dart';
import '../../model/genres_response.dart';

abstract class GenresRemoteDataSource {
  Future<GenreResponse> getGenres();
  Future<Results> getGamesByGenre({required int id, required String key});
}

class GenresRemoteDataSourceImpl extends GenresRemoteDataSource {
  final Dio dio;

  GenresRemoteDataSourceImpl(this.dio);

  @override
  Future<GenreResponse> getGenres() async {
    final log = Logger();
    try {
      final response =
          await dio.get('${Constants.kBaserUrl}genres?key=${Constants.apiKey}');
      log.i(response.data);
      return GenreResponse.fromJson(response.data);
    } catch (exception) {
      log.e(exception);
      throw ServerException(message: exception.toString());
    }
  }

  @override
  Future<Results> getGamesByGenre({required int id, required String key}) async {
    try{
      final response = await dio.get('${Constants.kBaserUrl}games/$id?key=$key');
      return Results.fromJson(response.data);
    } catch (exception) {
      throw ServerException(message: exception.toString());
    }
  }




}

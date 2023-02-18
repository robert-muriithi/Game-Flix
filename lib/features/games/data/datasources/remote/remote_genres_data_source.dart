import 'package:game_flix_flutter/core/errors/exceptions.dart';
import 'package:game_flix_flutter/core/utils/constants.dart';
import 'package:game_flix_flutter/features/games/data/model/games_response.dart';
import 'package:dio/dio.dart';

import '../../model/genres_response.dart';

abstract class GenresRemoteDataSource {
  Future<List<GenreResponse>> getGames();
}

class GamesRemoteDataSourceImpl extends GenresRemoteDataSource {
  final Dio dio;
  GamesRemoteDataSourceImpl(this.dio);

  @override
  Future<List<GenreResponse>> getGames() async {
    try{
      final response = await dio.get(Constants.kBaserUrl);
      final data = response.data as List;
      final parsedData = data.map((e) => GenreResponse.fromJson(e)).toList();
      return parsedData;
    }catch (exception){
      throw ServerException(message: exception.toString());
    }
  }

}
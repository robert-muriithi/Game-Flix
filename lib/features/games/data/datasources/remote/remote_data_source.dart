import 'package:game_flix_flutter/core/errors/exceptions.dart';
import 'package:game_flix_flutter/core/utils/constants.dart';
import 'package:game_flix_flutter/features/games/data/model/games_response.dart';
import 'package:dio/dio.dart';

abstract class GamesRemoteDataSource {
  Future<List<GameResponse>> getGames();
}

class GamesRemoteDataSourceImpl extends GamesRemoteDataSource {
   final Dio dio;
  GamesRemoteDataSourceImpl(this.dio);

  @override
  Future<List<GameResponse>> getGames() async {
    try{
      final response = await dio.get(Constants.kBaserUrl);
      final data = response.data as List;
      final parsedData = data.map((e) => GameResponse.fromJson(e)).toList();
      return parsedData;
    }catch (exception){
      throw ServerException(message: exception.toString());
    }
  }

}
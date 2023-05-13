import 'package:game_flix_flutter/core/errors/exceptions.dart';
import 'package:game_flix_flutter/core/utils/constants.dart';
import 'package:game_flix_flutter/feature/games/data/model/games_response.dart';
import 'package:dio/dio.dart';
import 'package:logger/logger.dart';


abstract class GamesRemoteDataSource {
  Future<GamesResponse> getGames({required String key, required int page, required int pageSize});
}

class GamesRemoteDataSourceImpl implements GamesRemoteDataSource {
   final Dio dio;
  GamesRemoteDataSourceImpl(this.dio);

  @override
  Future<GamesResponse> getGames({required String key, required int page, required int pageSize}) async {
    final log = Logger();
    try{
      final response = await dio.get('${Constants.kBaserUrl}games?key=$key&page=$page&page_size=$pageSize');
      return GamesResponse.fromJson(response.data);
    }catch (exception){
      throw ServerException(message: exception.toString());
    }
  }

}
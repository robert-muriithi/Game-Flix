import 'package:logger/logger.dart';
import '../../../../../core/errors/exceptions.dart';
import '../../model/game_details_response.dart';
import 'package:game_flix_flutter/core/utils/constants.dart';
import 'package:dio/dio.dart';

abstract class GameDetailsRemoteDataSource {
  Future<GameDetailsResponse> getGameDetails(
      {required int id, required String key});
}

class GameDetailsRemoteDatasourceImpl implements GameDetailsRemoteDataSource {
  final Dio dio;

  GameDetailsRemoteDatasourceImpl(this.dio);

  @override
  Future<GameDetailsResponse> getGameDetails(
      {required int id, required String key}) async {
    try {
      final response =
          await dio.get('${Constants.kBaserUrl}games/$id?key=$key');
      return GameDetailsResponse.fromJson(response.data);
    } catch (exception) {
      throw ServerException(message: exception.toString());
    }
  }
}

import 'package:logger/logger.dart';

import '../../../../../core/errors/exceptions.dart';
import '../../../../../core/utils/constants.dart';
import '../../model/tags_reponse.dart';
import 'package:dio/dio.dart';

abstract class TagsRemoteDataSource {
  Future<TagsResponse> getTags({required String key, required int page, required int pageSize});
}

class TagsRemoteDataSourceImpl extends TagsRemoteDataSource {
  final Dio dio;
  TagsRemoteDataSourceImpl(this.dio);

  @override
  Future<TagsResponse> getTags({required String key, required int page, required int pageSize}) async {
    final log = Logger();
    try{
      final response = await dio.get('${Constants.kBaserUrl}tags?key=$key&page=$page&page_size=$pageSize');
      return TagsResponse.fromJson(response.data);
    }catch (exception){
      log.e(exception.toString());
      throw ServerException(message: exception.toString());
    }
  }

}
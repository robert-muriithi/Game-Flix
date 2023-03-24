import 'package:dartz/dartz.dart';
import '../../../../core/errors/failure.dart';
import '../../../../core/params/params.dart';
import '../../../../core/usecase/usecase.dart';
import '../model/tag.dart';
import '../repository/tags_repository.dart';

class GetTagsUseCase extends UseCase<List<TagResult>, Params> {
  final TagsRepository repository;

  GetTagsUseCase(this.repository);

  @override
  Future<Either<Failure, List<TagResult>>> call(Params params) async {
    return repository.getTags(params);
  }
}
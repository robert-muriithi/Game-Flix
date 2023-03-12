import 'package:dartz/dartz.dart';
import '../../../../core/errors/failure.dart';
import '../../../../core/params/params.dart';
import '../../../../core/usecase/usecase.dart';
import '../model/genre.dart';
import '../repository/categories_repository.dart';

class GetCategoriesUseCase extends UseCase<List<Results>, NoParams> {
  final CategoriesRepository repository;
  GetCategoriesUseCase(this.repository);

  @override
  Future<Either<Failure, List<Results>>> call(NoParams params) async {
    return repository.getGenres();
  }

}
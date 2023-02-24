import 'package:dartz/dartz.dart';

import '../../../../core/errors/failure.dart';
import '../model/genre.dart';

abstract class CategoriesRepository {
  Future<Either<Failure, List<Results>>> getGenres();
}
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:game_flix_flutter/core/errors/failure.dart';

import '../utils/constants.dart';

abstract class UseCase<T, P> {
  Future<Either<Failure, T>> call(P params);
}

class NoParams extends Equatable {
  @override
  List<Object?> get props => [];
}

class Params extends Equatable {
  final String apiKey;
  final int page;
  final int pageSize;

  const Params({
    this.apiKey = Constants.apiKey,
    this.page = 1,
    this.pageSize = 20,
  });
  @override
  List<Object?> get props => [
    apiKey,
    page,
    pageSize,
  ];
}

class GameDetailsParams extends Equatable {
  final String apiKey;
  final int id;

  const GameDetailsParams({
    this.apiKey = Constants.apiKey,
    required this.id,
  });
  @override
  List<Object?> get props => [
    apiKey,
    id,
  ];
}
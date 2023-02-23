import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:game_flix_flutter/core/errors/failure.dart';

abstract class UseCase<T, P> {
  Future<Either<Failure, T>> call(P params);
}

class NoParams extends Equatable {
  @override
  List<Object?> get props => [];
}

class Params extends Equatable {
  final int count;
  final String prev;
  final String next;
  final String key;
  const Params({
    required this.count,
    required this.prev,
    required this.next,
    required this.key,
  });
  @override
  List<Object?> get props => [
    count,
    prev,
    next,
    key,
  ];
}
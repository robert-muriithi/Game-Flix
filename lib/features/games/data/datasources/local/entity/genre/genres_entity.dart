import 'package:equatable/equatable.dart';
import 'package:floor/floor.dart';
import 'package:game_flix_flutter/core/utils/constants.dart';

@Entity(tableName:Constants.kGenresTableName)
class GenresEntity extends Equatable {
  @primaryKey final int? id;
  final int count;
  final String? next;
  final String? previous;
  final List<ResultEntity> results;

   const GenresEntity({this.id, required this.count, this.next, this.previous, required this.results});

  @override
  List<Object?> get props => [id, count, next, previous, results];

}

class ResultEntity extends Equatable {
  final int id;
  final String name;
  final String gamesCount;
  final List<GameEntity> game;
  final String backgroundImage;

  const ResultEntity({required this.id, required this.name, required this.gamesCount, required this.game, required this.backgroundImage});

  @override
  List<Object?> get props => [id, name, gamesCount, game, backgroundImage];

}

class GameEntity extends Equatable {
  final String id;
  final String name;

  const GameEntity({required this.name, required this.id});
  @override
  List<Object?> get props => [id, name];

}
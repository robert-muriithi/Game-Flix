import 'package:equatable/equatable.dart';
import 'package:floor/floor.dart';
import 'package:game_flix_flutter/core/utils/constants.dart';

/*@Entity(tableName:Constants.kGenresTableName)
class GenresEntity extends Equatable {
  @primaryKey final int? id;
  final int? count;
  final int? next;
  final int? previous;
  final List<GenresResults> results;

   const GenresEntity({this.id, required this.count, this.next, this.previous, required this.results});

  @override
  List<Object?> get props => [id, count, *//*count, next, previous,*//* results];

}*/


@Entity(tableName:Constants.kGenresTableName)
class GenresResults extends Equatable {
  @primaryKey final int id;
  final String name;
  final int gamesCount;
  final List<GenresGames> game;
  final String backgroundImage;

  const GenresResults({required this.id, required this.name, required this.gamesCount, required this.game, required this.backgroundImage});

  @override
  List<Object?> get props => [id, name, gamesCount, game, backgroundImage];

}

class GenresGames extends Equatable {
  final int id;
  final String name;

  const GenresGames({required this.name, required this.id});
  @override
  List<Object?> get props => [id, name];

}
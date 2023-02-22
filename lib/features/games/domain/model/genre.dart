import 'package:equatable/equatable.dart';

class Genre extends Equatable {
  final int? count;
  final int? next;
  final int? previous;
  final List<Results>? results;

  const Genre({required this.count, this.next, this.previous, required this.results});

  @override
  List<Object?> get props => [
    count,
    /*next,
    previous,*/
    results
  ];

}

class Results extends Equatable{
  final int id;
  final String name;
  final int gamesCount;
  final List<Games?>? game;
  final String backgroundImage;

  const Results({required this.id, required this.name, required this.gamesCount, required this.game, required this.backgroundImage});

  @override
  List<Object?> get props => [
    id,
    name,
    gamesCount,
    game,
    backgroundImage
  ];

}

class Games extends Equatable {
  final int id;
  final String name;

  const Games({required this.name, required this.id});

  @override
  List<Object?> get props => [
    id,
    name,
  ];

}
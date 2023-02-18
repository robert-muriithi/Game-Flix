import 'package:equatable/equatable.dart';

class Genre extends Equatable {
  final int count;
  final String? next;
  final String? previous;
  final List<Results> results;

  const Genre({required this.count, this.next, this.previous, required this.results});

  @override
  List<Object?> get props => [
    count,
    next,
    previous,
    results
  ];

}

class Results extends Equatable{
  final int id;
  final String name;
  final String gamesCount;
  final List<Game> game;
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

class Game extends Equatable {
  final String id;
  final String name;

  const Game({required this.name, required this.id});

  @override
  List<Object?> get props => [
    id,
    name,
  ];

}
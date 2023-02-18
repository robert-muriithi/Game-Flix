import 'package:game_flix_flutter/features/games/domain/model/genre.dart';

class GenreResponse extends Genre {
  const GenreResponse({
    required int count,
    required String? next,
    required String? previous,
    required List<ResultsResponse> results,
   }) : super(
    count: count,
    next: next,
    previous: previous,
    results: results
  );

 factory GenreResponse.fromJson(Map<String, dynamic> json){
    return GenreResponse(
      count: json['count'],
      next: json['next'],
      previous: json['previous'],
      results: (json['results'] as List).map((e) => ResultsResponse.fromJson(e)).toList()
    );
  }
}

class ResultsResponse extends Results {
  const ResultsResponse({
    required int id,
    required String name,
    required String gamesCount,
    required List<Games> game,
    required String backgroundImage
  }) : super(
    id: id,
    name: name,
    gamesCount: gamesCount,
    game: game,
    backgroundImage: backgroundImage
  );

  factory ResultsResponse.fromJson(Map<String, dynamic> json){
    return ResultsResponse(
      id: json['id'],
      name: json['name'],
      gamesCount: json['games_count'],
      backgroundImage: json['image_background'],
      game: (json['games'] as List).map((e) => Games.fromJson(e)).toList()
    );
  }
}

class Games extends Game {
  const Games({
    required String id,
    required String name,
  }) : super(
    id: id,
    name: name,
  );

  factory Games.fromJson(Map<String, dynamic> json){
    return Games(
      id: json['id'],
      name: json['name'],
    );
  }
}
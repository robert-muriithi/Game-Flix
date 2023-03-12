import 'package:game_flix_flutter/feature/categories/domain/model/genre.dart';


class GenreResponse {
  final int? count;
  final int? next;
  final int? previous;
  final List<ResultsResponse>? results;

   const GenreResponse({
      this.count,
     this.next,
     this.previous,
      this.results
   });

 factory GenreResponse.fromJson(Map<String, dynamic> json){
    return GenreResponse(
      count: json['count'],
      next: json['next'],
      previous: json['previous'],
      results: json['results'] != null ? (json['results'] as List).map((e) => ResultsResponse.fromJson(e)).toList() : null
    );
  }

}

class ResultsResponse extends Results {
  const ResultsResponse({
    required int id,
    required String name,
    required int gamesCount,
    required List<GamesResponse>? game,
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
      game: json['games'] != null ? (json['games'] as List).map((e) => GamesResponse.fromJson(e)).toList() : null
    );
  }
}


class GamesResponse extends Games {
  const GamesResponse({
    required int id,
    required String name,
  }) : super(
    id: id,
    name: name,
  );

  factory GamesResponse.fromJson(Map<String, dynamic> json){
    return GamesResponse(
      id: json['id'],
      name: json['name'],
    );
  }
}
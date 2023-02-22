import 'package:game_flix_flutter/features/games/data/datasources/local/entity/genre/genres_entity.dart';
import 'package:game_flix_flutter/features/games/domain/model/genre.dart';

import '../mappers/mappers.dart';

class GenreResponse extends Genre {
  const GenreResponse({
    required int? count,
    required int? next,
    required int? previous,
    required List<ResultsResponse>? results,
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
       // results: (json['results'] as List).map((e) => ResultsResponse.fromJson(e)).toList()
      results: json['results'] != null ? (json['results'] as List).map((e) => ResultsResponse.fromJson(e)).toList() : null
    );
  }

  GenresEntity genresResponseToEntity(GenreResponse? response) {
    return GenresEntity(
        count: response?.count ?? 0,
        results: response?.results
            ?.map((e) => toEntityResults(ResultsResponse(
            id: e.id,
            name: e.name,
            gamesCount: e.gamesCount,
            backgroundImage: e.backgroundImage,
            game: e.game?.map((e) => toResponseGames(
                GenresGames(id: e?.id ?? 0, name: e?.name ?? "")))
                .toList())))
            .toList() ?? []
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
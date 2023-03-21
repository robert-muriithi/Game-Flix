import '../../domain/model/tag.dart';

class TagsResponse {
  String? next;
  String? previous;
  List<TagResponseResults>? results;

  TagsResponse({
    this.next,
    this.previous,
    this.results,
  });

  factory TagsResponse.fromJson(Map<String, dynamic> json) {
    return TagsResponse(
        next: json['next'],
        previous: json['previous'],
        results: json['results'] != null
            ? (json['results'] as List).map((e) => TagResponseResults.fromJson(e)).toList()
            : null);
  }
}

class TagResponseResults extends TagResult {
  const TagResponseResults({
    required int id,
    required String name,
    required String language,
    required int gamesCount,
    required String imageBackground,
    required List<GameResponseResult>? games,
  }) : super(
    id: id,
    name: name,
    language: language,
    gamesCount: gamesCount,
    imageBackground: imageBackground,
    games: games,
  );

  factory TagResponseResults.fromJson(Map<String, dynamic> json){
    return TagResponseResults(
      id: json['id'],
      name: json['name'],
      language: json['language'],
      gamesCount: json['games_count'],
      imageBackground: json['image_background'],
      games: json['games'] != null
          ? (json['games'] as List).map((e) => GameResponseResult.fromJson(e)).toList()
          : null,
    );
  }
}

class GameResponseResult extends GameResult {
  const GameResponseResult({
    required int id,
  }) : super(
    id: id,
  );

  factory GameResponseResult.fromJson(Map<String, dynamic> json){
    return GameResponseResult(
      id: json['id'],
    );
  }
}
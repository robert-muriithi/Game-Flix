import '../../domain/model/search_results_model.dart';

class SearchResultsResponse {
  final int? count;
  final String? next;
  final String? previous;
  final List<SearchResults>? results;

  const SearchResultsResponse({
    this.count,
    this.next,
    this.previous,
    this.results,
  });

  factory SearchResultsResponse.fromJson(Map<String, dynamic> json) {
    return SearchResultsResponse(
      count: json['count'],
      next: json['next'],
      previous: json['previous'],
      results: json['results'] != null
          ? (json['results'] as List)
              .map((e) => SearchResults.fromJson(e))
              .toList()
          : null,
    );
  }

}

class SearchResults extends SearchResultsModel{
  const SearchResults({
    required String name,
    required String? image,
    required String? released,
    required int id,
    required double? score,
    required List<GenresResults>? genres,
  }) : super(
          name: name,
          image: image,
          released: released,
          id: id,
          score: score,
          genres: genres,
        );

  factory SearchResults.fromJson(Map<String, dynamic> json) {
    return SearchResults(
      name: json['name'],
      image: json['background_image'],
      released: json['released'],
      id: json['id'],
      score: json['rating'],
      genres: json['genres'] != null
          ? (json['genres'] as List)
              .map((e) => GenresResults.fromJson(e))
              .toList()
          : null,
    );
  }
}

class GenresResults extends Genres {
  const GenresResults({
    required int id,
    required String name,
  }) : super(
          id: id,
          name: name,
        );

  factory GenresResults.fromJson(Map<String, dynamic> json) {
    return GenresResults(
      id: json['id'],
      name: json['name'],
    );
  }
}
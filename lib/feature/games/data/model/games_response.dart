import '../../domain/model/game.dart';

class GamesResponse {
  String? next;
  String? previous;
  List<Results>? results;

  GamesResponse({
    this.next,
    this.previous,
    this.results,
  });

  factory GamesResponse.fromJson(Map<String, dynamic> json) {
    return GamesResponse(
        next: json['next'],
        previous: json['previous'],
        results: json['results'] != null ? (json['results'] as List).map((e) => Results.fromJson(e)).toList() : null);
  }
}

class Results extends GameResults {
  Results(
      {required int? id,
        required String? name,
        required String? released,
      required String backgroundImage,
      required double? rating,
      required int? ratingsCount,
      required int? reviewsTextCount,
      required int? suggestionsCount,
      required String? updated,
      required int? reviewsCount,
      required List<Platforms>? platforms,
      required List<Genres>? genres,
      required List<Tags>? tags,
        required int? metaCritic,
      required Platform? esrbRating,
      required List<ShortScreenshots>? shortScreenshots
      })
      : super(
      id: id,
      name: name,
      released: released,
      backgroundImage: backgroundImage,
      rating: rating,
       ratingsCount: ratingsCount,
      reviewsTextCount: reviewsTextCount,
      suggestionsCount: suggestionsCount,
      updated: updated,
      reviewsCount: reviewsCount,
      platforms: platforms,
      genres: genres,
      tags: tags,
      esrbRating: esrbRating,
      shortScreenshots: shortScreenshots,
      metaCritic: metaCritic
  );

  factory Results.fromJson(Map<String, dynamic> json) {
    return Results(
      metaCritic: json['metacritic'],
      id: json['id'],
      name: json['name'],
      released: json['released'],
      backgroundImage: json['background_image'],
      rating: json['rating'],
      ratingsCount: json['ratings_count'],
      reviewsTextCount: json['reviews_text_count'],
      suggestionsCount: json['suggestions_count'],
      updated: json['updated'],
      reviewsCount: json['reviews_count'],
      platforms: json['platforms'] != null
          ? (json['platforms'] as List)
              .map((i) => Platforms.fromJson(i))
              .toList()
          : null,
      genres: json['genres'] != null
          ? (json['genres'] as List).map((i) => Genres.fromJson(i)).toList()
          : null,
      tags: json['tags'] != null
          ? (json['tags'] as List).map((i) => Tags.fromJson(i)).toList()
          : null,
      esrbRating: json['esrb_rating'] != null
          ? Platform.fromJson(json['esrb_rating'])
          : null,
      shortScreenshots: json['short_screenshots'] != null
          ? (json['short_screenshots'] as List)
              .map((i) => ShortScreenshots.fromJson(i))
              .toList()
          : null,
    );
  }
}

class Platforms extends PlatformsResults {
  Platforms({
    required Platform? platform,
    required String? releasedAt,
    required RequirementsEn? requirementsEn,
  }): super(
          platform: platform,
          releasedAt: releasedAt,
          requirementsEn: requirementsEn
  );

  factory Platforms.fromJson(Map<String, dynamic> json) {
    return Platforms(
      platform: json['platform'] != null ? Platform.fromJson(json['platform']) : null,
      releasedAt: json['released_at'],
      requirementsEn: json['requirements_en'] != null
          ? RequirementsEn.fromJson(json['requirements_en'])
          : null,
    );
  }
}

class Platform extends PlatformResult {
  Platform(
      {required int? id,
      required String? name,
      required String? image,
      required int? gamesCount,
      required String? imageBackground})
      : super(
          id: id,
          name: name,
          gamesCount: gamesCount,
          imageBackground: imageBackground,
          image: image
        );

  factory Platform.fromJson(Map<String, dynamic> json) {
    return Platform(
      id: json['id'],
      name: json['name'],
      gamesCount: json['games_count'],
      imageBackground: json['image_background'],
      image: json['image']
    );
  }
}

class RequirementsEn extends RequirementsEnResult {
  RequirementsEn({required String? minimum, required String? recommended})
      : super(minimum: minimum, recommended: recommended);

  factory RequirementsEn.fromJson(Map<String, dynamic> json) {
    return RequirementsEn(
      minimum: json['minimum'],
      recommended: json['recommended'],
    );
  }
}

class Genres extends GenresResult {
  Genres(
      {required int id,
      required String name,
      required int gamesCount,
      required String imageBackground})
      : super(
            id: id,
            name: name,
            gamesCount: gamesCount,
            imageBackground: imageBackground);

  factory Genres.fromJson(Map<String, dynamic> json) {
    return Genres(
      id: json['id'],
      name: json['name'],
      gamesCount: json['games_count'],
      imageBackground: json['image_background'],
    );
  }
}

class Tags extends TagsResult {
  Tags(
      {required int id,
      required String name,
      required String language,
      required int gamesCount,
      required String? imageBackground})
      : super(
            id: id,
            name: name,
            gamesCount: gamesCount,
            language: language,
            imageBackground: imageBackground);

  factory Tags.fromJson(Map<String, dynamic> json) {
    return Tags(
      id: json['id'],
      name: json['name'],
      language: json['language'],
      gamesCount: json['games_count'],
      imageBackground: json['image_background'],
    );
  }
}

class ShortScreenshots extends ShortScreenshotsResults {
  ShortScreenshots({
    required int id,
    required String image,
  }) : super(id: id, image: image);

  factory ShortScreenshots.fromJson(Map<String, dynamic> json) {
    return ShortScreenshots(
      id: json['id'],
      image: json['image'],
    );
  }
}

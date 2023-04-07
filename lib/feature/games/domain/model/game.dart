import 'package:equatable/equatable.dart';

class GameResults extends Equatable {
  int? id;
  String? name;
  String? released;
  String backgroundImage;
  double? rating;
  int? ratingsCount;
  int? reviewsTextCount;
  int? suggestionsCount;
  String? updated;
  int? reviewsCount;
  int? metaCritic;
  List<PlatformsResults>? platforms;
  List<GenresResult>? genres;
  List<TagsResult>? tags;
  PlatformResult? esrbRating;
  List<ShortScreenshotsResults>? shortScreenshots;

  GameResults(
      {this.id,
      this.name,
      this.released,
      required this.backgroundImage,
      required this.rating,
      required this.ratingsCount,
      required this.reviewsTextCount,
      this.suggestionsCount,
      this.updated,
      this.reviewsCount,
      this.platforms,
      this.genres,
      this.tags,
      this.esrbRating,
      this.metaCritic,
      this.shortScreenshots});

  @override
  List<Object?> get props => [
        id,
        name,
        released,
        backgroundImage,
        rating,
        ratingsCount,
        reviewsTextCount,
        suggestionsCount,
        updated,
        reviewsCount,
        platforms,
        genres,
        tags,
        esrbRating,
        shortScreenshots,
        metaCritic
      ];

  @override
  bool get stringify => true;
}

class TagsResult extends Equatable {
  int id;
  String name;
  String language;
  int gamesCount;
  String? imageBackground;

  TagsResult({
    required this.id,
    required this.name,
    required this.language,
    required this.gamesCount,
    required this.imageBackground,
  });

  @override
  List<Object?> get props => [id, name, language, gamesCount, imageBackground];

  @override
  bool get stringify => true;
}

class ShortScreenshotsResults extends Equatable {
  int id;
  String image;

  ShortScreenshotsResults({required this.id, required this.image});

  @override
  List<Object?> get props => [id, image];

}

class GenresResult extends Equatable {
  int id;
  String name;
  int gamesCount;
  String imageBackground;

  GenresResult({
    required this.id,
    required this.name,
    required this.gamesCount,
    required this.imageBackground,
  });

  @override
  List<Object?> get props => [id, name, gamesCount, imageBackground];

  @override
  bool get stringify => true;
}

class PlatformsResults extends Equatable {
  PlatformResult? platform;
  String? releasedAt;
  RequirementsEnResult? requirementsEn;

  PlatformsResults({this.platform, this.releasedAt, this.requirementsEn});

  @override
  List<Object?> get props => [platform, releasedAt, requirementsEn];

  @override
  bool get stringify => true;
}

class PlatformResult extends Equatable {
  int? id;
  String? name;
  String? image;
  int? gamesCount;
  String? imageBackground;

  PlatformResult({
    this.id,
    this.name,
    this.image,
    this.gamesCount,
    this.imageBackground,
  });

  @override
  List<Object?> get props => [id, name, gamesCount, imageBackground];

  @override
  bool get stringify => true;
}

class RequirementsEnResult extends Equatable {
  String? minimum;
  String? recommended;

  RequirementsEnResult({this.minimum, this.recommended});

  @override
  List<Object?> get props => [minimum, recommended];

  @override
  bool get stringify => true;
}

import '../../domain/model/game_deatils.dart';

class GameDetailsResponse extends GameDetails {

  const GameDetailsResponse({
    required int id,
    required String name,
    required String? description,
    required String? backgroundImage,
    required String? backgroundImageAdditional,
    required String? website,
    required int? creatorsCount,
    required int? metacritic,
    required String? released,
    required List<GenresResponse>? genres,
    required List<DevelopersResponse>? developers,
    required String? descriptionRaw,
    /*required List<ShortScreenShotsResponse> shortScreenShots,*/
  }) : super(
      id: id,
      name: name,
      description: description,
      backgroundImage: backgroundImage,
      backgroundImageAdditional: backgroundImageAdditional,
      website: website,
      creatorsCount: creatorsCount,
      developers: developers,
      descriptionRaw: descriptionRaw,
      metacritic: metacritic,
       released: released,
      genres: genres,
     /*screenShots: shortScreenShots,*/
    );

  factory GameDetailsResponse.fromJson(Map<String, dynamic> json) {
    return GameDetailsResponse(
      id: json['id'],
      name: json['name'],
      description: json['description'],
      backgroundImage: json['background_image'],
      backgroundImageAdditional: json['background_image_additional'],
      website: json['website'],
      creatorsCount: json['creators_count'],
      descriptionRaw: json['description_raw'],
      metacritic: json['metacritic'],
      released: json['released'],
      genres: (json['genres'] as List<dynamic>).map((e) => GenresResponse.fromJson(e)).toList(),
      developers: (json['developers'] as List<dynamic>).map((e) => DevelopersResponse.fromJson(e)).toList(),
      /*shortScreenShots: (json['short_screenshots'] as List<dynamic>).map((e) => ShortScreenShotsResponse.fromJson(e)).toList(),*/

    );
  }
}

/*class GamePlatformsResponse extends GamePlatformsResults {
  GamePlatformsResponse({
    required GamePlatformResponse? platform,
    required String? releasedAt,
  }): super(
      platform: platform,
      releasedAt: releasedAt,

  );

  factory GamePlatformsResponse.fromJson(Map<String, dynamic> json) {
    return GamePlatformsResponse(
      platform: json['platform'] != null ? GamePlatformResponse.fromJson(json['platform']) : null,
      releasedAt: json['released_at'],
    );
  }
}


class GamePlatformResponse extends GamePlatformResult {
  GamePlatformResponse(
      {required int? id,
        required String? name,
        required String? image,
        required int? gamesCount,
        required String? imageBackground})
      : super(
    id: id,
    name: name,
    image: image,
    gamesCount: gamesCount,
    imageBackground: imageBackground,
  );

  factory GamePlatformResponse.fromJson(Map<String, dynamic> json) {
    return GamePlatformResponse(
      id: json['id'],
      name: json['name'],
      image: json['image'],
      gamesCount: json['games_count'],
      imageBackground: json['image_background'],
    );
  }
}*/

class GenresResponse extends Genres {
    const GenresResponse({
      required int id,
      required String name,
    }) : super(id: id, name: name);

    factory GenresResponse.fromJson(Map<String, dynamic> json) {
      return GenresResponse(
        id: json['id'],
        name: json['name'],
      );
    }

}

class ShortScreenShotsResponse extends ShortScreenShots {
  const ShortScreenShotsResponse({
    required String image,
  }) : super(image: image);

  factory ShortScreenShotsResponse.fromJson(Map<String, dynamic> json) {
    return ShortScreenShotsResponse(
      image: json['image'],
    );
  }

}

class DevelopersResponse extends  Developers {

  const DevelopersResponse({
    required int id,
    required String name,
    required int gamesCount,
    required String imageBackground
  }) : super(
      id: id,
      name: name,
      gamesCount: gamesCount,
      imageBackground: imageBackground,
    );

  factory DevelopersResponse.fromJson(Map<String, dynamic> json) {
    return DevelopersResponse(
      id: json['id'],
      name: json['name'],
      gamesCount: json['games_count'],
      imageBackground: json['image_background'],
    );
  }

}



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
    required List<DevelopersResponse>? developers,
    required String? descriptionRaw}) : super(
      id: id,
      name: name,
      description: description,
      backgroundImage: backgroundImage,
      backgroundImageAdditional: backgroundImageAdditional,
      website: website,
      creatorsCount: creatorsCount,
      developers: developers,
      descriptionRaw: descriptionRaw
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
      developers: json['developers'] != null ? (json['developers'] as List).map((e) => DevelopersResponse.fromJson(e)).toList() : null
    );
  }
}


class DevelopersResponse extends  Developers {

  const DevelopersResponse({
    required int id,
    required String name,
    required int? gamesCount,
    required String? imageBackground
  });

  factory DevelopersResponse.fromJson(Map<String, dynamic> json) {
    return DevelopersResponse(
      id: json['id'],
      name: json['name'],
      gamesCount: json['games_count'],
      imageBackground: json['image_background'],
    );
  }

}



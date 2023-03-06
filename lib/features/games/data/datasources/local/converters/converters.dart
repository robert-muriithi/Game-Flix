
import 'dart:convert';

import 'package:floor/floor.dart';

import '../../../../domain/model/game.dart';
import '../../../../domain/model/game_deatils.dart';


class PlatFormResultsConverters extends TypeConverter<List<PlatformsResults>, String> {
  @override
  List<PlatformsResults> decode(String databaseValue) {
    List<dynamic> list = json.decode(databaseValue);
    return List<PlatformsResults>.from(list.map((i) => PlatformsResults(
        platform: PlatformResult(
            id: i['platform']['id'],
            name: i['platform']['name'],
            image: i['platform']['image'],
            gamesCount: i['platform']['games_count'],
            imageBackground: i['platform']['image_background']
        ),
        releasedAt: i['released_at'],
        requirementsEn: RequirementsEnResult(
            minimum: i['requirements_en']['minimum'],
            recommended: i['requirements_en']['recommended']
        )
    )));
  }

  @override
  String encode(List<PlatformsResults> value) {
    List<Map<String, dynamic>> list = value.map((i) => {
      'platform': {
        'id': i.platform?.id,
        'name': i.platform?.name,
        'image': i.platform?.image,
        'games_count': i.platform?.gamesCount,
        'image_background': i.platform?.imageBackground
      },
      'released_at': i.releasedAt,
      'requirements_en': {
        'minimum': i.requirementsEn?.minimum,
        'recommended': i.requirementsEn?.recommended
      }
    }).toList();
    return json.encode(list);
  }

}

class PlatformResultTypeConverter extends TypeConverter<PlatformResult, String> {
  @override
  PlatformResult decode(String databaseValue) {
    Map<String, dynamic> map = json.decode(databaseValue);
    return PlatformResult(
        id: map['id'],
        name: map['name'],
        image: map['image'],
        gamesCount: map['games_count'],
        imageBackground: map['image_background']
    );
  }

  @override
  String encode(PlatformResult value) {
    Map<String, dynamic> map = {
      'id': value.id,
      'name': value.name,
      'image': value.image,
      'games_count': value.gamesCount,
      'image_background': value.imageBackground
    };
    return json.encode(map);
  }
}

class RequirementsEnTypeConverter extends TypeConverter<RequirementsEnResult, String> {
  @override
  RequirementsEnResult decode(String databaseValue) {
    Map<String, dynamic> map = json.decode(databaseValue);
    return RequirementsEnResult(
        minimum: map['minimum'],
        recommended: map['recommended']
    );
  }

  @override
  String encode(RequirementsEnResult value) {
    Map<String, dynamic> map = {
      'minimum': value.minimum,
      'recommended': value.recommended
    };
    return json.encode(map);
  }
}


class GenresResultTypeConverter extends TypeConverter<List<GenresResult>, String> {
  @override
  List<GenresResult> decode(String databaseValue) {
    List<dynamic> list = json.decode(databaseValue);
    return List<GenresResult>.from(list.map((i) => GenresResult(
        id: i['id'],
        name: i['name'],
        gamesCount: i['games_count'],
        imageBackground: i['image_background']
    )));
  }

  @override
  String encode(List<GenresResult> value) {
    List<Map<String, dynamic>> list = value.map((i) => {
      'id': i.id,
      'name': i.name,
      'games_count' : i.gamesCount,
      'image_background': i.imageBackground
    }).toList();
    return json.encode(list);
  }

}



class TagsResultTypeConverter extends TypeConverter<List<TagsResult>, String> {
  @override
  List<TagsResult> decode(String databaseValue) {
    List<dynamic> list = json.decode(databaseValue);
    return List<TagsResult>.from(list.map((i) => TagsResult(
        id: i['id'],
        name: i['name'],
        gamesCount: i['games_count'],
        imageBackground: i['image_background'],
        language: i['language']
    )));
  }

  @override
  String encode(List<TagsResult> value) {
    List<Map<String, dynamic>> list = value.map((i) => {
      'id': i.id,
      'name': i.name,
      'games_count' : i.gamesCount,
      'image_background': i.imageBackground,
      'language' : i.language
    }).toList();
    return json.encode(list);
  }

}

class ShortScreenshotsResultsConverters extends TypeConverter<List<ShortScreenshotsResults>, String> {
  @override
  List<ShortScreenshotsResults> decode(String databaseValue) {
    List<dynamic> list = json.decode(databaseValue);
    return List<ShortScreenshotsResults>.from(list.map((i) => ShortScreenshotsResults(
        id: i['id'],
        image: i['image']
    )));
  }

  @override
  String encode(List<ShortScreenshotsResults> value) {
    List<Map<String, dynamic>> list = value.map((i) => {
      'id': i.id,
      'image': i.image
    }).toList();
    return json.encode(list);
  }

}

class DevelopersTypeConverter extends TypeConverter<List<Developers>, String> {
  @override
  List<Developers> decode(String databaseValue) {
    List<dynamic> list = json.decode(databaseValue);
    return List<Developers>.from(list.map((i) => Developers(
        id: i['id'],
        name: i['name'],
        gamesCount: i['games_count'],
        imageBackground: i['image_background']
    )));
  }

  @override
  String encode(List<Developers> value) {
    List<Map<String, dynamic>> list = value.map((i) => {
      'id': i.id,
      'name': i.name,
      'games_count' : i.gamesCount,
      'image_background': i.imageBackground
    }).toList();
    return json.encode(list);
  }

}



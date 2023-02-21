import 'dart:convert';
import 'package:floor/floor.dart';
import 'package:game_flix_flutter/features/games/data/datasources/local/entity/genre/genres_entity.dart';


class GameEntityConverter extends TypeConverter<List<GenresGames>, String> {
  @override
  List<GenresGames> decode(String databaseValue) {
    List<dynamic> list = json.decode(databaseValue);
    return List<GenresGames>.from(list.map((i) => GenresGames(
        id: i['id'].toString(),
        name: i['name']
    )));
  }

  @override
  String encode(List<GenresGames> value) {
    List<Map<String, dynamic>> list = value.map((i) => {
      'id': int.parse(i.id),
      'name': i.name
    }).toList();
    return json.encode(list);
  }
}

class ResultEntityConverter extends TypeConverter<List<GenresResults>, String> {

  @override
  List<GenresResults> decode(String databaseValue) {
    List<dynamic> list = json.decode(databaseValue);
    return List<GenresResults>.from(list.map((i) => GenresResults(
        id: i['id'],
        name: i['name'],
        gamesCount: i['games_count'].toString(),
        game: List<GenresGames>.from(i['game'].map((i) => GenresGames(
            id: i['id'].toString(),
            name: i['name']
        ))),
        backgroundImage: i['background_image']
    )));

  }

  @override
  String encode(List<GenresResults> value) {

    List<Map<String, dynamic>> list = value.map((i) => {
      'id': i.id,
      'name': i.name,
      'games_count': i.gamesCount,
      'game': i.game.map((i) => {
        'id': int.parse(i.id),
        'name': i.name
      }).toList(),
      'background_image': i.backgroundImage
    }).toList();

    return json.encode(list);

  }
}


import 'dart:convert';
import 'package:floor/floor.dart';
import 'package:game_flix_flutter/features/games/data/datasources/local/entity/genre/genres_entity.dart';


class GameEntityConverter extends TypeConverter<List<GameEntity>, String> {
  @override
  List<GameEntity> decode(String databaseValue) {
    List<dynamic> list = json.decode(databaseValue);
    return List<GameEntity>.from(list.map((i) => GameEntity(
        id: i['id'].toString(),
        name: i['name']
    )));
  }

  @override
  String encode(List<GameEntity> value) {
    List<Map<String, dynamic>> list = value.map((i) => {
      'id': int.parse(i.id),
      'name': i.name
    }).toList();
    return json.encode(list);
  }
}

class ResultEntityConverter extends TypeConverter<List<ResultEntity>, String> {

  @override
  List<ResultEntity> decode(String databaseValue) {
    List<dynamic> list = json.decode(databaseValue);
    return List<ResultEntity>.from(list.map((i) => ResultEntity(
        id: i['id'],
        name: i['name'],
        gamesCount: i['games_count'].toString(),
        game: List<GameEntity>.from(i['game'].map((i) => GameEntity(
            id: i['id'].toString(),
            name: i['name']
        ))),
        backgroundImage: i['background_image']
    )));

  }

  @override
  String encode(List<ResultEntity> value) {

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


import 'package:game_flix_flutter/features/games/data/datasources/local/entity/game_entity.dart';

import '../../domain/model/game.dart';

class GameResponse extends Game {
  const GameResponse(
      {required String id,
      required String name,
      required String backgroundImage,
      }) : super(
      id: id,
      name: name,
      backgroundImage: backgroundImage
  );

  factory GameResponse.fromJson(Map<String, dynamic> json){
    return GameResponse(
        id: json['id'],
        name: json['name'],
        backgroundImage: json['background_image']
    );
  }



}

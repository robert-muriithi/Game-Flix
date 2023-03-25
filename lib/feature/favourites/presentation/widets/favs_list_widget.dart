import 'package:flutter/material.dart';

import '../../../games/domain/model/game.dart';
import 'favs_item_widget.dart';

class FavsListWidget extends StatelessWidget {
  final List<GameResults> favs;
  Function(int)? onRemove;
  FavsListWidget({Key? key, required this.favs, this.onRemove}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: favs.length,
      itemBuilder: (context, index) {
        return FavsItemWidget(
            game: favs[index],
            onRemove: () {
              onRemove?.call(favs[index].id!);
            }
        );
      },
    );
  }
}

import 'package:flutter/material.dart';

import '../../domain/model/tag.dart';
class TagItemWidget extends StatelessWidget {
  final TagResult tag;
  const TagItemWidget({Key? key, required this.tag}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(8),
      child: Column(
        children: [
          Text(tag.name),
          ListView.builder(
              itemCount: tag.games?.length ?? 0,
              itemBuilder: (context, index) {
                return Container(
                  margin: const EdgeInsets.all(8),
                  child: Text(tag.games![index].id.toString()),
                );
              }
          )
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:game_flix_flutter/features/categories/presentation/widgets/search_widget.dart';

import '../../../../config/theme/colors.dart';
import 'background_wave_clipper.dart';

class SliverSearchBar extends SliverPersistentHeaderDelegate {
  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    var adjustedShrinkOffset =
        shrinkOffset > minExtent ? minExtent : shrinkOffset;
    double offset = (minExtent - adjustedShrinkOffset) * 0.5;
    double topPadding = MediaQuery.of(context).padding.top + 16;

    return Stack(children: [
      SizedBox(
        height: 280,
        child: ClipPath(
          clipper: BackgroundWaveClipper(),
          child: Container(
            width: MediaQuery.of(context).size.width,
            height: 280,
            decoration: BoxDecoration(
                gradient: LinearGradient(colors: [
              AppColors.orange,
              AppColors.orange.withOpacity(0.2)
            ])),
          ),
        ),
      ),
      Positioned(
          top: topPadding + offset,
          left: 16,
          right: 16,
          child: const SearchBarWidget())
    ]);
  }

  @override
  double get maxExtent => 280;

  @override
  double get minExtent => 140;

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) {
    return oldDelegate.maxExtent != maxExtent ||
        oldDelegate.minExtent != minExtent;
  }
}

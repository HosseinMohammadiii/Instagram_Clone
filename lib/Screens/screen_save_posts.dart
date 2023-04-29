import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:sizer/sizer.dart';

class screenSavePosts extends StatelessWidget {
  const screenSavePosts({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      scrollDirection: Axis.horizontal,
      slivers: [
        SliverPadding(
          padding:
              EdgeInsets.only(left: 4.w, right: 4.w, top: 4.w, bottom: 9.h),
          sliver: SliverGrid(
            delegate: SliverChildBuilderDelegate(
              (context, index) {
                return ClipRRect(
                  borderRadius: BorderRadius.circular(3.w),
                  child: Image.asset(
                    'images/search$index.png',
                    fit: BoxFit.cover,
                  ),
                );
              },
              childCount: 12,
            ),
            gridDelegate: SliverQuiltedGridDelegate(
              crossAxisSpacing: 2.w,
              mainAxisSpacing: 2.w,
              crossAxisCount: 3,
              repeatPattern: QuiltedGridRepeatPattern.inverted,
              pattern: [
                QuiltedGridTile(1, 1),
                QuiltedGridTile(2, 2),
                QuiltedGridTile(1, 1),
                QuiltedGridTile(1, 1),
                QuiltedGridTile(1, 1),
                QuiltedGridTile(1, 1),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

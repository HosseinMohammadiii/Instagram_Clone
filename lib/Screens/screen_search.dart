import 'package:flutter/material.dart';
import 'package:flutter_instagram_project/Classes/class.dart';
import 'package:flutter_instagram_project/Screens/screen_recentsearchs.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:sizer/sizer.dart';

class searchScreen extends StatefulWidget {
  searchScreen({Key? key}) : super(key: key);

  @override
  State<searchScreen> createState() => _searchScreenState();
}

class _searchScreenState extends State<searchScreen> {
  double animation1 = 0.0;
  double animation2 = 0.0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff1C1F2E),
      appBar: PreferredSize(
        child: AppBar(
          primary: false,
          automaticallyImplyLeading: false,
          elevation: 0,
          backgroundColor: Colors.transparent,
        ),
        preferredSize: Size(double.infinity, 0.w),
      ),
      body: gridviewList(context),
    );
  }

//Wdget Use the Gridviw List
  Widget gridviewList(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverToBoxAdapter(
          child: _textField(),
        ),
        SliverToBoxAdapter(
          child: _useTitles(),
        ),
        SliverPadding(
          padding:
              EdgeInsets.only(left: 4.w, right: 4.w, top: 2.h, bottom: 9.h),
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
              childCount: 10,
            ),
            gridDelegate: SliverQuiltedGridDelegate(
              crossAxisSpacing: 1.w,
              mainAxisSpacing: 1.w,
              crossAxisCount: 3,
              repeatPattern: QuiltedGridRepeatPattern.inverted,
              pattern: [
                QuiltedGridTile(2, 1),
                QuiltedGridTile(2, 2),
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

//Widget Use the TextField
  Widget _textField() {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          PageRouteBuilder(
            pageBuilder: (Context, animation1, animation2) => recentSearchs(),
            transitionDuration: Duration.zero,
            reverseTransitionDuration: Duration.zero,
          ),
        );
      },
      child: Container(
        height: 6.h,
        margin: EdgeInsets.symmetric(horizontal: 4.w, vertical: 2.h),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(3.w),
          color: Color(0xff272B40),
        ),
        child: Row(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 12, right: 12),
              child: Image.asset(
                'images/Icon.Bottomnavigation.Search.png',
              ),
            ),
            textInfo('Search...', Colors.white, 12.sp, 'GB'),
            Spacer(),
            Padding(
              padding: const EdgeInsets.only(right: 12),
              child: Image.asset('images/QR-codeIcon.png'),
            ),
          ],
        ),
      ),
    );
  }

  //Widget Use the Titles
  Widget _useTitles() {
    List<String> ttl = [
      'All',
      'Account',
      'Hashtag',
      'Caption',
      'Story',
      'Comment',
    ];
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          for (var t in ttl)
            Padding(
              padding: const EdgeInsets.only(left: 15, right: 15),
              child: buttonClick(
                t,
                Color(0xff272B40),
                20.w,
                4.h,
                10.sp,
                3.w,
                'GB',
                Colors.white,
              ),
            ),
        ],
      ),
    );
  }
}

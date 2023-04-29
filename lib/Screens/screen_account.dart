import 'package:flutter/material.dart';
import 'package:flutter_instagram_project/Screens/screen_save_posts.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:sizer/sizer.dart';
import '../Classes/class.dart';
import 'direct_screen.dart';

class accountScreen extends StatefulWidget {
  accountScreen({Key? key}) : super(key: key);

  @override
  State<accountScreen> createState() => _accountScreenState();
}

class _accountScreenState extends State<accountScreen> {
  bool isfollow = true;
  int followers = 64;

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
      body: DefaultTabController(
        length: 2,
        child: NestedScrollView(
          headerSliverBuilder: (context, innerBoxIsScrolled) {
            return [
              SliverAppBar(
                actions: [
                  Padding(
                    padding: EdgeInsets.all(2.w),
                    child: Icon(
                      Icons.menu,
                    ),
                  ),
                ],
                backgroundColor: Color(0xff1C1F2E),
                expandedHeight: 20.h,
                automaticallyImplyLeading: false,
                bottom: PreferredSize(
                  preferredSize: Size.fromHeight(1.h),
                  child: Container(
                    height: 4.w,
                    decoration: BoxDecoration(
                      color: Color(0xff1C1F2E),
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(3.w),
                        topRight: Radius.circular(3.w),
                      ),
                    ),
                  ),
                ),
                flexibleSpace: Container(
                  margin: EdgeInsets.only(bottom: 2.w),
                  child: FlexibleSpaceBar(
                    background: Image.asset(
                      'images/imageaccount_01.png',
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
              SliverToBoxAdapter(
                child: _backgrondAccount(),
              ),
              SliverPersistentHeader(
                floating: true,
                pinned: true,
                delegate: TabbarViewDelegate(
                  TabBar(
                    indicatorColor: Color(0xffF35383),
                    indicatorSize: TabBarIndicatorSize.tab,
                    unselectedLabelColor: Color(0xffC5C5C5),
                    indicatorPadding: EdgeInsets.symmetric(horizontal: 8.w),
                    tabs: [
                      Image.asset('images/Group 73.png'),
                      Image.asset('images/Group 124.png'),
                    ],
                  ),
                ),
              ),
            ];
          },
          body: TabBarView(
            children: [
              _displayPosts(),
              screenSavePosts(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _backgrondAccount() {
    return Stack(
      children: [
        Positioned(
          left: 92.w,
          top: 4.w,
          child: Image.asset('images/Group 96.png'),
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 4.w, vertical: 4.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Container(
                    width: 16.w,
                    height: 8.h,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(4.w),
                      border: Border.all(
                        width: 0.5.w,
                        color: Color(0xffF35383),
                      ),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(4),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(2.5.w),
                        child: Image.asset(
                          'images/Me.jpg',
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 3.w,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      textInfo(
                          'حسین برنامه نویس موبایل', Colors.white, 12.sp, 'SM'),
                      SizedBox(
                        height: 1.h,
                      ),
                      textInfo('hosseinmohammadi.dev', Color(0xffC5C5C5), 12.sp,
                          'GB'),
                    ],
                  ),
                ],
              ),
              SizedBox(
                height: 1.h,
              ),
              textInfo('•Programmer|mobile|', Colors.white, 10.sp, 'GM'),
              textInfo('•Flutter|Android|', Colors.white, 10.sp, 'GM'),
              SizedBox(
                height: 2.h,
              ),
              Row(
                children: [
                  Image.asset('images/Group 101.png'),
                  textInfo(' developer', Color(0xffC5C5C5), 12.sp, 'GB'),
                  SizedBox(
                    width: 3.w,
                  ),
                  Image.asset('images/Group 67.png'),
                  textInfo(' IRAN', Color(0xffC5C5C5), 12.sp, 'GM'),
                ],
              ),
              SizedBox(
                height: 2.h,
              ),
              Row(
                children: [
                  textInfo(' 5', Colors.white, 13.sp, 'GB'),
                  textInfo(' Posts', Color(0xffC5C5C5), 10.sp, 'GM'),
                  SizedBox(
                    width: 3.w,
                  ),
                  textInfo('$followers', Colors.white, 13.sp, 'GB'),
                  textInfo(' Followers', Color(0xffC5C5C5), 10.sp, 'GM'),
                  SizedBox(
                    width: 3.w,
                  ),
                  textInfo(' 18', Colors.white, 13.sp, 'GB'),
                  textInfo(' Following', Color(0xffC5C5C5), 10.sp, 'GM'),
                ],
              ),
              SizedBox(
                height: 2.h,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        isfollow = false;
                        followers++;
                      });
                    },
                    child: isfollow == true
                        ? Container(
                            width: 40.w,
                            height: 5.h,
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(3.w),
                              color: Color(0xffF35383),
                            ),
                            child: GestureDetector(
                              onTap: () {
                                setState(() {
                                  isfollow = false;
                                  followers++;
                                });
                              },
                              child:
                                  textInfo('Follow', Colors.white, 13.sp, 'GB'),
                            ),
                          )
                        : _bottonInsights(),
                  ),
                  Container(
                    child: isfollow == true ? _bottonMessage() : null,
                  ),
                ],
              ),
              SizedBox(
                height: 2.h,
              ),
              _highlightInfo(),
            ],
          ),
        ),
      ],
    );
  }

  Widget _highlightInfo() {
    List<String> images = [
      'search11.png',
      'me.jpeg',
      'bts.girl.jpg',
      'anime.jpg',
    ];

    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          _mainHighlight(),
          SizedBox(
            width: 3.w,
          ),
          for (var i in images)
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 5.w, vertical: 1.h),
              child: Column(
                children: [
                  Container(
                    width: 16.w,
                    height: 8.h,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(3.w),
                      child: Image.asset(
                        'images/$i',
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 1.h,
                  ),
                  textInfo(
                    'Highlight',
                    Colors.white,
                    10.sp,
                    'GB',
                  ),
                ],
              ),
            ),
        ],
      ),
    );
  }

  Widget _mainHighlight() {
    return Row(
      children: [
        Column(
          children: [
            Container(
              width: 16.w,
              height: 8.h,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(4.w),
                border: Border.all(
                  width: 0.5.w,
                  color: Colors.white,
                ),
              ),
              child: Padding(
                padding: EdgeInsets.all(4.w),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(3.w),
                  child: Image.asset(
                    'images/Group 28.png',
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 1.h,
            ),
            textInfo(
              'New',
              Colors.white,
              10.sp,
              'GM',
            ),
          ],
        ),
      ],
    );
  }

  Widget _bottonInsights() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        isfollow == false
            ? GestureDetector(
                onTap: () {
                  setState(() {
                    isfollow = true;
                  });
                },
                child: Container(
                  width: 92.w,
                  height: 5.h,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    border: Border.all(
                      width: 0.5.w,
                      color: Colors.white,
                    ),
                    borderRadius: BorderRadius.circular(3.w),
                  ),
                  child: textInfo('Insights', Colors.white, 13.sp, 'GB'),
                ),
              )
            : _bottonMessage(),
      ],
    );
  }

  Widget _bottonMessage() {
    return Container(
      width: 40.w,
      height: 5.h,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(3.w),
        border: Border.all(
          width: 0.5.w,
          color: Colors.white,
        ),
        color: Colors.transparent,
      ),
      child: GestureDetector(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => directScreen(),
            ),
          );
        },
        child: textInfo('Message', Colors.white, 13.sp, 'GB'),
      ),
    );
  }

//Widget Display Posts
  Widget _displayPosts() {
    return CustomScrollView(
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

class TabbarViewDelegate extends SliverPersistentHeaderDelegate {
  TabbarViewDelegate(this._tabbar);
  final TabBar _tabbar;
  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return Container(
      height: 10.h,
      color: Color(0xff1C1F2E),
      child: _tabbar,
    );
  }

  @override
  double get maxExtent => _tabbar.preferredSize.height;

  @override
  double get minExtent => _tabbar.preferredSize.height;

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) {
    return false;
  }
}

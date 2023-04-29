import 'package:flutter/material.dart';
import 'package:flutter_instagram_project/Classes/class.dart';
import 'package:flutter_instagram_project/Screens/direct_screen.dart';
import 'package:flutter_instagram_project/Screens/screen_following.dart';
import 'package:flutter_instagram_project/model/enum/screen_status_enum.dart';
import 'package:sizer/sizer.dart';

class screenViewLikes extends StatefulWidget {
  screenViewLikes({Key? key}) : super(key: key);

  @override
  State<screenViewLikes> createState() => _screenViewLikesState();
}

class _screenViewLikesState extends State<screenViewLikes>
    with SingleTickerProviderStateMixin {
  bool isfollow = false;
  bool isfollowWeek = false;

  TabController? _tabController;
  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
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
      body: Column(
        children: [
          Container(
            height: 5.h,
            color: Color(0xff1C1F2E),
            child: TabBar(
              controller: _tabController,
              indicatorColor: Color(0xffF35383),
              indicatorSize: TabBarIndicatorSize.tab,
              unselectedLabelColor: Color(0xffC5C5C5),
              indicatorPadding: EdgeInsets.symmetric(horizontal: 8.w),
              labelStyle: TextStyle(
                fontFamily: 'GB',
                fontSize: 14.sp,
              ),
              tabs: [
                Text('Following'),
                Text('You'),
              ],
            ),
          ),
          Expanded(
            child: TabBarView(
              controller: _tabController,
              children: [
                dispalyFollowing(),
                Container(
                  color: Color(0xff1C1F2E),
                  child: _tabbarYouList(),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

//Widget Use the List Display Tabbar You
  Widget _tabbarYouList() {
    return CustomScrollView(
      slivers: [
        SliverToBoxAdapter(
          child: Padding(
            padding:
                EdgeInsets.only(left: 4.w, right: 4.w, top: 3.h, bottom: 1.h),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                textInfo('New', Colors.white, 13.sp, 'GB'),
              ],
            ),
          ),
        ),
        SliverPadding(
          padding:
              EdgeInsets.only(left: 4.w, right: 4.w, top: 2.h, bottom: 1.h),
          sliver: SliverList(
            delegate: SliverChildBuilderDelegate(
              (context, index) {
                return Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    _activityStatus(ActivityStatus.following),
                    SizedBox(
                      height: 2.h,
                    ),
                    _activityStatus(ActivityStatus.like),
                  ],
                );
              },
              childCount: 1,
            ),
          ),
        ),
        SliverToBoxAdapter(
          child: Padding(
            padding:
                EdgeInsets.only(left: 4.w, right: 4.w, top: 3.h, bottom: 1.h),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                textInfo('Today', Colors.white, 13.sp, 'GB'),
              ],
            ),
          ),
        ),
        SliverPadding(
          padding:
              EdgeInsets.only(left: 4.w, right: 4.w, top: 2.h, bottom: 1.h),
          sliver: SliverList(
            delegate: SliverChildBuilderDelegate(
              (context, index) {
                return Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    _activityStatus(ActivityStatus.follow),
                    SizedBox(
                      height: 2.h,
                    ),
                    _activityStatus(ActivityStatus.like),
                    SizedBox(
                      height: 2.h,
                    ),
                    _activityStatus(ActivityStatus.followweek),
                  ],
                );
              },
              childCount: 1,
            ),
          ),
        ),
        SliverToBoxAdapter(
          child: Padding(
            padding:
                EdgeInsets.only(left: 4.w, right: 4.w, top: 3.h, bottom: 1.h),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                textInfo('This week', Colors.white, 13.sp, 'GB'),
              ],
            ),
          ),
        ),
        SliverPadding(
          padding:
              EdgeInsets.only(left: 4.w, right: 4.w, top: 2.h, bottom: 7.h),
          sliver: SliverList(
            delegate: SliverChildBuilderDelegate(
              (context, index) {
                return Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    _activityStatus(ActivityStatus.like),
                    SizedBox(
                      height: 2.h,
                    ),
                    _activityStatus(ActivityStatus.following),
                    SizedBox(
                      height: 2.h,
                    ),
                    _activityStatus(ActivityStatus.following),
                    SizedBox(
                      height: 2.h,
                    ),
                  ],
                );
              },
              childCount: 2,
            ),
          ),
        ),
      ],
    );
  }

//Widget Use the ActivityStatus
  Widget _activityStatus(
    ActivityStatus status,
  ) {
    switch (status) {
      case ActivityStatus.follow:
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(1.w),
                  child: Container(
                    width: 2.w,
                    height: 2.w,
                    color: Color(0xffF35383),
                  ),
                ),
                Container(
                  width: 10.w,
                  height: 5.h,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(2.5.w),
                    child: Image.asset(
                      'images/Me.jpg',
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        textInfo('hosseinmo...', Colors.white, 12.sp, 'GB'),
                        SizedBox(
                          width: 2.w,
                        ),
                        textInfo('Started Following', Color(0xffC5C5C5), 12.sp,
                            'GM'),
                      ],
                    ),
                    SizedBox(
                      height: 1.w,
                    ),
                    Row(
                      children: [
                        textInfo('you', Color(0xffC5C5C5), 12.sp, 'GM'),
                        SizedBox(
                          width: 2.w,
                        ),
                        textInfo('3min', Color(0xffC5C5C5), 10.sp, 'GB'),
                      ],
                    ),
                  ],
                ),
                Container(
                  width: 20.w,
                  height: 5.h,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(2.w),
                    border: isfollow == true
                        ? Border.all(color: Color(0xffC5C5C5), width: 0.7.w)
                        : null,
                    color: isfollow == false
                        ? Color(0xffF35383)
                        : Colors.transparent,
                  ),
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        isfollow = true;
                      });
                    },
                    onTapDown: (details) {
                      setState(() {
                        isfollow == true
                            ? Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => directScreen(),
                                ),
                              )
                            : null;
                      });
                    },
                    child: textInfo(
                        isfollow == false ? 'Follow' : 'Message',
                        isfollow == false ? Colors.white : Color(0xffC5C5C5),
                        12.sp,
                        'GB'),
                  ),
                ),
              ],
            ),
          ],
        );
      case ActivityStatus.followweek:
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(1.w),
                  child: Container(
                    width: 2.w,
                    height: 2.w,
                    color: Color(0xffF35383),
                  ),
                ),
                Container(
                  width: 10.w,
                  height: 5.h,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(2.5.w),
                    child: Image.asset(
                      'images/Me.jpg',
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        textInfo('hosseinmo...', Colors.white, 12.sp, 'GB'),
                        SizedBox(
                          width: 2.w,
                        ),
                        textInfo('Started Following', Color(0xffC5C5C5), 12.sp,
                            'GM'),
                      ],
                    ),
                    SizedBox(
                      height: 1.w,
                    ),
                    Row(
                      children: [
                        textInfo('you', Color(0xffC5C5C5), 12.sp, 'GM'),
                        SizedBox(
                          width: 2.w,
                        ),
                        textInfo('3min', Color(0xffC5C5C5), 10.sp, 'GB'),
                      ],
                    ),
                  ],
                ),
                Container(
                  width: 20.w,
                  height: 5.h,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(2.w),
                    border: isfollowWeek == true
                        ? Border.all(color: Color(0xffC5C5C5), width: 0.7.w)
                        : null,
                    color: isfollowWeek == false
                        ? Color(0xffF35383)
                        : Colors.transparent,
                  ),
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        isfollowWeek = true;
                      });
                    },
                    onTapDown: (details) {
                      setState(() {
                        isfollowWeek == true
                            ? Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => directScreen(),
                                ),
                              )
                            : null;
                      });
                    },
                    child: textInfo(
                        isfollowWeek == false ? 'Follow' : 'Message',
                        isfollowWeek == false
                            ? Colors.white
                            : Color(0xffC5C5C5),
                        12.sp,
                        'GB'),
                  ),
                ),
              ],
            ),
          ],
        );
      case ActivityStatus.following:
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(1.w),
                  child: Container(
                    width: 2.w,
                    height: 2.w,
                    color: Color(0xffF35383),
                  ),
                ),
                Container(
                  width: 10.w,
                  height: 5.h,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(2.5.w),
                    child: Image.asset(
                      'images/Me.jpg',
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        textInfo('hosseinmo...', Colors.white, 12.sp, 'GB'),
                        SizedBox(
                          width: 2.w,
                        ),
                        textInfo('Started Following', Color(0xffC5C5C5), 12.sp,
                            'GM'),
                      ],
                    ),
                    SizedBox(
                      height: 1.w,
                    ),
                    Row(
                      children: [
                        textInfo('you', Color(0xffC5C5C5), 12.sp, 'GM'),
                        SizedBox(
                          width: 2.w,
                        ),
                        textInfo('3min', Color(0xffC5C5C5), 10.sp, 'GB'),
                      ],
                    )
                  ],
                ),
                Container(
                  width: 20.w,
                  height: 5.h,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(2.w),
                    border: Border.all(
                      color: Color(0xffC5C5C5),
                      width: 0.7.w,
                    ),
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
                    child: textInfo('Message', Color(0xffC5C5C5), 12.sp, 'GB'),
                  ),
                ),
              ],
            ),
          ],
        );

      case ActivityStatus.like:
        return Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(1.w),
              child: Container(
                width: 2.w,
                height: 2.w,
                color: Color(0xffF35383),
              ),
            ),
            Container(
              width: 10.w,
              height: 5.h,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(2.5.w),
                child: Image.asset(
                  'images/Me.jpg',
                  fit: BoxFit.cover,
                ),
              ),
            ),
            textInfo('hosseinmo...', Colors.white, 12.sp, 'GB'),
            textInfo('Liked your post', Color(0xffC5C5C5), 12.sp, 'GM'),
            textInfo('5min', Color(0xffC5C5C5), 12.sp, 'GB'),
            Container(
              width: 11.w,
              height: 5.h,
              alignment: Alignment.center,
              child: GestureDetector(
                onTap: () {},
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(2.w),
                  child: Image.asset(
                    'images/bts.girl.jpg',
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
          ],
        );

      default:
        return Container(
          width: 20.w,
          height: 5.h,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(2.w),
            border: Border.all(
              color: Color(0xffC5C5C5),
              width: 0.7.w,
            ),
          ),
          child: GestureDetector(
            onTap: () {},
            child: textInfo('Message', Color(0xffC5C5C5), 12.sp, 'GB'),
          ),
        );
    }
  }
}

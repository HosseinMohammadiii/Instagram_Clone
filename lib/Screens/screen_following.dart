import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../Classes/class.dart';
import '../model/enum/screen_status_enum.dart';
import 'direct_screen.dart';

class dispalyFollowing extends StatefulWidget {
  dispalyFollowing({Key? key}) : super(key: key);

  @override
  State<dispalyFollowing> createState() => _dispalyFollowingState();
}

class _dispalyFollowingState extends State<dispalyFollowing> {
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
      body: CustomScrollView(
        slivers: [
          SliverPadding(
            padding:
                EdgeInsets.only(left: 4.w, right: 4.w, top: 2.h, bottom: 8.h),
            sliver: SliverList(
              delegate: SliverChildBuilderDelegate((context, index) {
                return Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(bottom: 2.w, top: 2.h),
                      child: _usersFollowing(ActivityStatus.following),
                    ),
                  ],
                );
              }, childCount: 20),
            ),
          ),
        ],
      ),
    );
  }

  //Widget Use the Display users following
  Widget _usersFollowing(ActivityStatus status) {
    switch (status) {
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
                SizedBox(
                  width: 3,
                ),
                Expanded(
                  child: Container(
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
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 5),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          textInfo('hosseinmo...', Colors.white, 12.sp, 'GB'),
                          SizedBox(
                            width: 2.w,
                          ),
                          textInfo('Started Following', Color(0xffC5C5C5),
                              12.sp, 'GM'),
                        ],
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

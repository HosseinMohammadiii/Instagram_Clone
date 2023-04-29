import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_instagram_project/Screens/sccreen_botttomsheet.dart';
import 'package:sizer/sizer.dart';
import '../Classes/class.dart';

class homePageScreen extends StatefulWidget {
  homePageScreen({Key? key}) : super(key: key);

  @override
  State<homePageScreen> createState() => _homePageScreenState();
}

class _homePageScreenState extends State<homePageScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff1C1F2E),
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Color(0xff1C1F2E),
        automaticallyImplyLeading: false,
        centerTitle: false,
        title: Row(
          children: [
            textInfo(
              'M ',
              Colors.white,
              18.sp,
              'GB',
            ),
            Image.asset('images/Vector 1.png'),
            textInfo(
              'dinger',
              Colors.white,
              18.sp,
              'GB',
            ),
          ],
        ),
        actions: [
          Image.asset('images/Group 39.png'),
        ],
      ),
      body: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: _storyInfo(),
          ),
          SliverPadding(
            padding:
                EdgeInsets.only(left: 4.w, right: 4.w, top: 4.w, bottom: 9.h),
            sliver: SliverList(
              delegate: SliverChildBuilderDelegate(
                (context, index) {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 2.h,
                      ),
                      _displayPost(context, index),
                    ],
                  );
                },
                childCount: 14,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

//Widget Use the post
Widget _displayPost(BuildContext context, int index) {
  return Column(
    children: [
      _homePost(index),
      Stack(
        alignment: Alignment.center,
        children: [
          Container(
            width: 90.w,
            height: 45.h,
            decoration: BoxDecoration(
              color: Colors.transparent,
              borderRadius: BorderRadius.circular(6.w),
              image: DecorationImage(
                alignment: Alignment.center,
                image: AssetImage('images/search$index.png'),
                fit: BoxFit.cover,
              ),
            ),
            child: Stack(
              alignment: Alignment.topRight,
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 4.w, vertical: 4.w),
                  child: Image.asset(
                    'images/Icon_Play.png',
                  ),
                ),
              ],
            ),
          ),
          Stack(
            //  alignment: Alignment.bottomCenter,
            children: [
              Container(
                margin: EdgeInsets.only(left: 4.w, top: 42.h, right: 4.w),
                width: 85.w,
                height: 6.h,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(2.w),
                  child: BackdropFilter(
                    filter: ImageFilter.blur(
                      sigmaX: 6.w,
                      sigmaY: 1.h,
                    ),
                    child: Container(
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment.centerLeft,
                          end: Alignment.centerRight,
                          colors: [
                            Colors.white.withOpacity(0.5),
                            Colors.white.withOpacity(0.2),
                          ],
                        ),
                        borderRadius: BorderRadius.circular(2.w),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        mainAxisSize: MainAxisSize.max,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Image.asset('images/Icon_Like.png'),
                          textInfo('2.6 K', Colors.white, 14.sp, 'GB'),
                          SizedBox(
                            width: 3.w,
                          ),
                          Image.asset('images/Icon_Comment.png'),
                          textInfo('1.5 K', Colors.white, 14.sp, 'GB'),
                          SizedBox(
                            width: 3.w,
                          ),
                          GestureDetector(
                            onTap: () {
                              _buttomSheet(context);
                            },
                            child: Image.asset('images/Icon_Share.png'),
                          ),
                          SizedBox(
                            width: 5.w,
                          ),
                          Image.asset('images/Icon_Save.png'),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    ],
  );
}

//Widget Use the Share

dynamic _buttomSheet(BuildContext context) {
  return showModalBottomSheet(
    backgroundColor: Colors.transparent,
    barrierColor: Colors.transparent,
    context: context,
    isScrollControlled: true,
    builder: (context) {
      return Padding(
        padding: EdgeInsets.only(
          bottom: MediaQuery.of(context).viewInsets.bottom,
        ),
        child: DraggableScrollableSheet(
          initialChildSize: 0.4,
          maxChildSize: 0.7,
          minChildSize: 0.3,
          builder: (context, scrollController) {
            return shareBottomSheet(
              controller: scrollController,
            );
          },
        ),
      );
    },
  );
}
//Widget USe the BottomSheet

//Widget Use the Information Users Post
Widget _homePost(int index) {
  return Padding(
    padding: EdgeInsets.only(bottom: 2.h, left: 1.w, right: 1.w, top: 2.h),
    child: Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          width: 16.w,
          height: 8.h,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(4.w),
            border: Border.all(
              width: 1.w,
              color: Color(0xffF35383),
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.all(4),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(2.5.w),
              child: Image.asset(
                'images/search$index.png',
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
            textInfo('hosseinmohammadi.dev', Colors.white, 12.sp, 'GB'),
            textInfo('حسین برنامه نویس موبایل', Colors.white, 12.sp, 'SM'),
          ],
        ),
        Spacer(),
        Image.asset(
          'images/icon_Menu.png',
          fit: BoxFit.cover,
        ),
      ],
    ),
  );
}

//Widget Use the Main Story
Widget _mainStory() {
  return Row(
    children: [
      Padding(
        padding: const EdgeInsets.only(left: 17),
        child: Column(
          children: [
            Container(
              width: 20.w,
              height: 10.h,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5.w),
                border: Border.all(
                  width: 1.w,
                  color: Colors.white,
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.all(4),
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
              'Your story',
              Colors.white,
              10.sp,
              'GB',
            ),
          ],
        ),
      ),
    ],
  );
}

//Widget Use the story Users
Widget _storyInfo() {
  List<String> images = [
    'search11.png',
    'me.jpeg',
    'bts.girl.jpg',
    'anime.jpg',
  ];
  List<String> text = [
    'Your Story',
    'Mahaa.can...',
    'hosseinmo...',
    'bts.girl',
    'anime.boy',
  ];
  return SingleChildScrollView(
    scrollDirection: Axis.horizontal,
    child: Row(
      children: [
        _mainStory(),
        SizedBox(
          width: 3.w,
        ),
        for (var i in images)
          Padding(
            padding: const EdgeInsets.only(left: 20, right: 15),
            child: Column(
              children: [
                Container(
                  width: 20.w,
                  height: 10.h,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5.w),
                    border: Border.all(
                      width: 1.w,
                      color: Color(0xffF35383),
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(4),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(3.w),
                      child: Image.asset(
                        'images/$i',
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 1.h,
                ),
                textInfo(
                  'User Name',
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

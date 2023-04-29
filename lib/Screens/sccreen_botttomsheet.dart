import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import '../Classes/class.dart';

class shareBottomSheet extends StatelessWidget {
  const shareBottomSheet({Key? key, this.controller}) : super(key: key);
  final ScrollController? controller;
  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(8.w),
        topRight: Radius.circular(8.w),
      ),
      child: BackdropFilter(
        filter: ImageFilter.blur(
          sigmaX: 4.w,
          sigmaY: 3.w,
        ),
        child: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                Colors.white.withOpacity(0.5),
                Colors.white.withOpacity(0.2),
              ],
            ),
          ),
          child: _diplaycontectshare(context),
        ),
      ),
    );
  }

  Widget _diplaycontectshare(BuildContext context) {
    return Stack(
      alignment: Alignment.bottomCenter,
      children: [
        CustomScrollView(
          controller: controller,
          slivers: [
            SliverToBoxAdapter(
              child: Stack(
                alignment: AlignmentDirectional.bottomCenter,
                children: [
                  Column(
                    children: [
                      Container(
                        margin: EdgeInsets.only(top: 10),
                        width: 20.w,
                        height: 0.7.h,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(1.w),
                          color: Colors.white,
                        ),
                      ),
                      SizedBox(
                        height: 3.h,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 18),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            textInfo(
                              'Share',
                              Colors.white,
                              24.sp,
                              'GB',
                            ),
                            SizedBox(
                              width: 15.w,
                            ),
                            Image.asset('images/Icon_botoomsheet.png'),
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                            left: 8.w, right: 6.w, top: 2.h, bottom: 5.h),
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.white.withOpacity(0.4),
                            borderRadius: BorderRadius.circular(4.w),
                          ),
                          child: TextField(
                            keyboardType: TextInputType.text,
                            style: TextStyle(
                              fontFamily: 'GB',
                              fontSize: 14.sp,
                              color: Colors.white,
                            ),
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              icon: Padding(
                                padding: const EdgeInsets.only(left: 15),
                                child: Icon(
                                  Icons.search,
                                  size: 10.w,
                                  color: Colors.white,
                                ),
                              ),
                              hintStyle: TextStyle(
                                fontFamily: 'GB',
                                fontSize: 12.sp,
                                color: Colors.white,
                              ),
                              hintText: 'search...',
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            SliverPadding(
              padding: EdgeInsets.only(bottom: 10.h),
              sliver: SliverGrid(
                delegate: SliverChildBuilderDelegate(
                  (context, index) {
                    return Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Container(
                          width: 15.w,
                          height: 8.h,
                          child: Padding(
                            padding: const EdgeInsets.all(4),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(3.w),
                              child: Image.asset(
                                'images/search$index.png',
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: 4.w, vertical: 1.h),
                          child: textInfo('UserName', Colors.white, 9.sp, 'GB'),
                        ),
                      ],
                    );
                  },
                  childCount: 12,
                ),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 4,
                  mainAxisExtent: 15.h,
                  crossAxisSpacing: 3.w,
                ),
              ),
            ),
          ],
        ),
        Positioned(
          bottom: MediaQuery.of(context).viewInsets.top,
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: 2.h),
            child: buttonClick(
              'Send',
              Color(0xffF35383),
              30.w,
              5.h,
              15.sp,
              3.w,
              'GB',
              Colors.white,
            ),
          ),
        ),
      ],
    );
  }
}

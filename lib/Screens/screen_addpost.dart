import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import '../Classes/class.dart';

class addpostScreen extends StatefulWidget {
  addpostScreen({Key? key}) : super(key: key);

  @override
  State<addpostScreen> createState() => _addpostScreenState();
}

class _addpostScreenState extends State<addpostScreen> {
  bool isColorRed = false;
  bool isColorWhite = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      primary: true,
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
      body: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          gridviewList(context),
          _browserInputImage(),
        ],
      ),
    );
  }

  //Widget Use the Gridviw List
  Widget gridviewList(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverToBoxAdapter(
          child: Row(
            children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 4.w, vertical: 2.h),
                child: textInfo('Post', Colors.white, 13.sp, 'GB'),
              ),
              GestureDetector(
                child: Image.asset('images/menuDrawer.png'),
              ),
              Spacer(),
              Padding(
                padding: const EdgeInsets.only(
                  right: 2,
                ),
                child: textInfo('Next', Colors.white, 13.sp, 'GB'),
              ),
              GestureDetector(
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 15, vertical: 12),
                  child: Image.asset('images/icon_Next_step.png'),
                ),
              ),
            ],
          ),
        ),
        SliverToBoxAdapter(
          child: SizedBox(
            height: 2.h,
          ),
        ),
        SliverToBoxAdapter(
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 4.w),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(3.w),
              child: Image.asset('images/search10.png'),
            ),
          ),
        ),
        SliverPadding(
          padding:
              EdgeInsets.only(left: 4.w, right: 4.w, top: 4.w, bottom: 15.5.h),
          sliver: SliverGrid(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisSpacing: 2.w,
              mainAxisSpacing: 2.w,
              crossAxisCount: 3,
            ),
            delegate: SliverChildBuilderDelegate(
              childCount: 9,
              (context, index) {
                return ClipRRect(
                  borderRadius: BorderRadius.circular(3.w),
                  child: Image.asset(
                    'images/search$index.png',
                    fit: BoxFit.cover,
                  ),
                );
              },
            ),
          ),
        ),
      ],
    );
  }

  Widget _browserInputImage() {
    return ClipRRect(
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(3.w),
        topRight: Radius.circular(3.w),
      ),
      child: Container(
        height: 14.h,
        color: Color.fromARGB(255, 48, 51, 68),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 4.w, vertical: 2.h),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              GestureDetector(
                onTap: () {},
                child: textInfo('Draft', Colors.red, 14.sp, 'GB'),
              ),
              GestureDetector(
                onTap: () {},
                child: textInfo('Gallery', Colors.white, 13.sp, 'GB'),
              ),
              GestureDetector(
                onTap: () {},
                child: textInfo('Take', Colors.white, 13.sp, 'GB'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

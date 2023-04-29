import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class recentSearchs extends StatefulWidget {
  recentSearchs({Key? key}) : super(key: key);

  @override
  State<recentSearchs> createState() => _recentSearchsState();
}

class _recentSearchsState extends State<recentSearchs> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff1C1F2E),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leadingWidth: 8.w,
        title: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(4.w),
            color: Color(0xff272B40),
          ),
          child: TextField(
            keyboardType: TextInputType.text,
            style: TextStyle(
              fontFamily: 'GB',
              fontSize: 12.sp,
              color: Colors.white,
            ),
            decoration: InputDecoration(
              enabledBorder: InputBorder.none,
              focusedBorder: InputBorder.none,
              icon: Padding(
                padding: EdgeInsets.only(right: 1),
              ),
              hintText: 'Search...',
              hintStyle: TextStyle(
                fontFamily: 'GB',
                fontSize: 12.sp,
                color: Colors.white,
              ),
            ),
          ),
        ),
      ),
    );
  }
}

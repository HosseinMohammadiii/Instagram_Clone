import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../Classes/class.dart';

class directScreen extends StatefulWidget {
  directScreen({Key? key}) : super(key: key);

  @override
  State<directScreen> createState() => _directScreenState();
}

class _directScreenState extends State<directScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff1C1F2E),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leadingWidth: 8.w,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          //  crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: 10.w,
              height: 5.h,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(5.w),
                child: Image.asset(
                  'images/Me.jpg',
                  fit: BoxFit.cover,
                ),
              ),
            ),
            SizedBox(
              width: 2.w,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    textInfo('حسین محمدی', Colors.white, 12.sp, 'SM'),
                  ],
                ),
                SizedBox(
                  height: 1.w,
                ),
                Row(
                  children: [
                    textInfo('Active', Color(0xffC5C5C5), 12.sp, 'GM'),
                    SizedBox(
                      width: 1.w,
                    ),
                    textInfo('1h', Color(0xffC5C5C5), 10.sp, 'GB'),
                    SizedBox(
                      width: 1.w,
                    ),
                    textInfo('ago', Color(0xffC5C5C5), 10.sp, 'GB'),
                  ],
                )
              ],
            ),
            SizedBox(
              width: 30.w,
            ),
            _iconButton(Icons.call),
            SizedBox(
              width: 5.w,
            ),
            _iconButton(Icons.videocam_outlined),
          ],
        ),
      ),
      body: SafeArea(
        child: Column(
          children: [
            Spacer(),
            Padding(
              padding: EdgeInsets.all(4.w),
              child: TextField(
                keyboardType: TextInputType.text,
                style: TextStyle(
                  fontFamily: 'GB',
                  fontSize: 12.sp,
                  color: Colors.white,
                ),
                enabled: true,
                decoration: InputDecoration(
                  prefixIcon: Icon(
                    Icons.camera_alt_outlined,
                    color: Colors.white,
                    size: 6.w,
                  ),
                  suffixIcon: Icon(
                    Icons.send_rounded,
                    color: Colors.blue,
                    size: 6.w,
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8.w),
                    borderSide: BorderSide(
                      color: Colors.white,
                      width: 0.5.w,
                    ),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(3.w),
                    borderSide: BorderSide(
                      color: Colors.white,
                      width: 0.5.w,
                    ),
                  ),
                  hintText: 'Message...',
                  hintStyle: TextStyle(
                    fontFamily: 'GB',
                    fontSize: 12.sp,
                    color: Color(0xffC5C5C5),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _iconButton(dynamic icn) {
    return GestureDetector(
      onTap: () {},
      child: Icon(icn),
    );
  }
}

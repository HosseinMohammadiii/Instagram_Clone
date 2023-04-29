import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_instagram_project/Screens/story_screen.dart';

import 'package:sizer/sizer.dart';

import '../Classes/class.dart';

class switchAccount extends StatefulWidget {
  const switchAccount({Key? key}) : super(key: key);

  @override
  State<switchAccount> createState() => _switchAccountState();
}

class _switchAccountState extends State<switchAccount> {
  @override
  Widget build(BuildContext context) {
    return Sizer(builder: (context, orientation, deviceType) {
      return Scaffold(
        backgroundColor: Color(0xff1C1F2E),
        body: SafeArea(
          child: Stack(
            alignment: AlignmentDirectional.center,
            fit: StackFit.expand,
            children: [
              Container(
                child: Image(
                  image: AssetImage('images/pattern1.png'),
                  repeat: ImageRepeat.repeat,
                ),
              ),
              Container(
                alignment: Alignment.topCenter,
                child: Image(
                  image: AssetImage('images/switch_account_background.png'),
                  alignment: Alignment.topCenter,
                  fit: BoxFit.cover,
                ),
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ClipRect(
                    child: BackdropFilter(
                      filter: ImageFilter.blur(
                        sigmaX: 6.w,
                        sigmaY: 1.h,
                      ),
                      child: Container(
                        width: 85.w,
                        height: 40.h,
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                            colors: [
                              Colors.white.withOpacity(0.6),
                              Colors.white.withOpacity(0.2),
                            ],
                          ),
                          borderRadius: BorderRadius.circular(3.w),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Container(
                              width: 30.w,
                              height: 15.h,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(3.w),
                                image: DecorationImage(
                                    image: AssetImage('images/Me.jpg'),
                                    fit: BoxFit.cover),
                              ),
                            ),
                            textInfo(
                              'Hossein Mohammadi',
                              Colors.white,
                              18.sp,
                              'GB',
                            ),
                            GestureDetector(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => homeScreen(),
                                  ),
                                );
                              },
                              child: buttonClick(
                                'Confrim',
                                Color(0xffF35383),
                                30.w,
                                5.h,
                                15.sp,
                                3.w,
                                'GB',
                                Colors.white,
                              ),
                            ),
                            GestureDetector(
                              child: textInfo(
                                'Switch account',
                                Colors.white,
                                15.sp,
                                'GB',
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              Positioned(
                bottom: 4.5.h,
                child: Row(
                  children: [
                    textInfo(
                      "Don't have an account? / ",
                      Colors.white.withOpacity(0.5),
                      15.sp,
                      'GB',
                    ),
                    GestureDetector(
                      onTap: () {},
                      child: textInfo(
                        'Sign up',
                        Colors.white,
                        15.sp,
                        'GB',
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      );
    });
  }
}

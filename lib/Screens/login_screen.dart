import 'package:flutter/material.dart';
import 'package:flutter_instagram_project/Screens/screen_switchaccount.dart';
import 'package:flutter_instagram_project/Classes/class.dart';
import 'package:sizer/sizer.dart';

class loginScreen extends StatefulWidget {
  loginScreen({Key? key}) : super(key: key);

  @override
  State<loginScreen> createState() => _loginScreenState();
}

class _loginScreenState extends State<loginScreen> {
  FocusNode fcn1 = FocusNode();
  FocusNode fcn2 = FocusNode();

  @override
  void initState() {
    super.initState();
    fcn1.addListener(() {
      setState(() {});
    });

    fcn2.addListener(() {
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Sizer(builder: (context, orientation, deviceType) {
      return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          backgroundColor: Colors.blue,
          extendBody: true,
          body: SafeArea(
            child: Column(
              children: [
                Expanded(
                  flex: 4,
                  child: SizedBox(
                    width: double.infinity,
                    child: Image(
                      image: AssetImage('images/rocket2 1.png'),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Expanded(
                  flex: 5,
                  child: Container(
                    transformAlignment: Alignment.bottomCenter,
                    decoration: BoxDecoration(
                      color: Color(0Xff1C1F2E),
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(3.w),
                        topRight: Radius.circular(3.w),
                      ),
                    ),
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              sizedBox(0, 12.h),
                              textInfo(
                                'Sign in to ',
                                Colors.white,
                                16.sp,
                                'GB',
                              ),
                              Image(
                                image: AssetImage('images/minilogo 1.png'),
                              ),
                            ],
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 44),
                            child: TextField(
                              keyboardType: TextInputType.emailAddress,
                              focusNode: fcn1,
                              style: TextStyle(
                                fontFamily: 'GM',
                                fontSize: 14.sp,
                                color: Colors.white,
                              ),
                              decoration: InputDecoration(
                                labelText: 'Email',
                                labelStyle: TextStyle(
                                  fontFamily: 'GM',
                                  fontSize: 14.sp,
                                  color: fcn1.hasFocus
                                      ? Color(0xffF35383)
                                      : Colors.white,
                                ),
                                contentPadding: EdgeInsets.symmetric(
                                  vertical: 2.h,
                                  horizontal: 3.w,
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(4.w),
                                  borderSide: BorderSide(
                                    width: 1.w,
                                    color: Color(0xffF35383),
                                  ),
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(4.w),
                                  borderSide: BorderSide(
                                    width: 1.w,
                                    color: Colors.white,
                                  ),
                                ),
                                hintStyle: TextStyle(
                                  fontFamily: 'GM',
                                  fontSize: 14.sp,
                                  color: Colors.white54,
                                ),
                                hintText: 'Enter you\'r Email',
                              ),
                              onTapOutside: (event) {
                                fcn1.unfocus();
                              },
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 44,
                              vertical: 25,
                            ),
                            child: TextField(
                              focusNode: fcn2,
                              obscureText: true,
                              obscuringCharacter: '*',
                              style: TextStyle(
                                fontFamily: 'GM',
                                fontSize: 16.sp,
                                color: Colors.white,
                              ),
                              decoration: InputDecoration(
                                labelText: 'Password',
                                labelStyle: TextStyle(
                                  fontFamily: 'GM',
                                  fontSize: 14.sp,
                                  color: fcn2.hasFocus
                                      ? Color(0xffF35383)
                                      : Colors.white,
                                ),
                                contentPadding: EdgeInsets.symmetric(
                                  vertical: 2.h,
                                  horizontal: 3.w,
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(4.w),
                                  borderSide: BorderSide(
                                    width: 1.w,
                                    color: Color(0xffF35383),
                                  ),
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(4.w),
                                  borderSide: BorderSide(
                                    width: 1.w,
                                    color: Colors.white,
                                  ),
                                ),
                                hintStyle: TextStyle(
                                  fontFamily: 'GM',
                                  fontSize: 14.sp,
                                  color: Colors.white54,
                                ),
                                hintText: 'Enter you\'r Password',
                              ),
                              onTapOutside: (event) {
                                fcn2.unfocus();
                              },
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => switchAccount(),
                                ),
                              );
                            },
                            child: buttonClick(
                              'Sign in',
                              Color(0xffF35383),
                              30.w,
                              5.h,
                              15.sp,
                              3.w,
                              'GB',
                              Colors.white,
                            ),
                          ),
                          sizedBox(0, 4.5.h),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
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
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      );
    });
  }

  @override
  void dispose() {
    fcn1.dispose();
    fcn2.dispose();

    super.dispose();
  }
}

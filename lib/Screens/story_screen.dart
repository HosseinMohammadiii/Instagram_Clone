import 'package:flutter/material.dart';
import 'package:flutter_instagram_project/Screens/screen.homepage.dart';
import 'package:flutter_instagram_project/Screens/screen_account.dart';
import 'package:flutter_instagram_project/Screens/screen_addpost.dart';
import 'package:flutter_instagram_project/Screens/screen_viewlikes.dart';
import 'package:flutter_instagram_project/Screens/screen_search.dart';
import 'package:sizer/sizer.dart';

class homeScreen extends StatefulWidget {
  homeScreen({Key? key}) : super(key: key);

  @override
  State<homeScreen> createState() => _homeScreenState();
}

class _homeScreenState extends State<homeScreen> {
  int _selectedscreenIndex = 0;
  List<Widget> _screens = [
    homePageScreen(),
    searchScreen(),
    addpostScreen(),
    screenViewLikes(),
    accountScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      persistentFooterAlignment: AlignmentDirectional.bottomEnd,
      bottomNavigationBar: ClipRRect(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(3.w),
          topRight: Radius.circular(3.w),
        ),
        child: BottomNavigationBar(
          backgroundColor: Color(0xff272B40),
          type: BottomNavigationBarType.fixed,
          showSelectedLabels: false,
          showUnselectedLabels: false,
          elevation: 0,
          currentIndex: _selectedscreenIndex,
          onTap: (int index) {
            setState(
              () {
                _selectedscreenIndex = index;
              },
            );
          },
          items: [
            _bottomNavigationBarItem(
              'Icon.Bottomnavigation.Home.png',
              'icon_active_home.png',
              '',
            ),
            _bottomNavigationBarItem(
              'Icon.Bottomnavigation.Search.png',
              'icon_search_navigation_active.png',
              '',
            ),
            _bottomNavigationBarItem(
              'Icon.Bottomnavigation.AddPost.png',
              'icon_add_navigation_active.png',
              '',
            ),
            _bottomNavigationBarItem(
              'Icon.Bottomnavigation.ViewLike.png',
              'icon_activity_navigation_active.png',
              '',
            ),
            __btmAccount(),
          ],
        ),
      ),
      body: IndexedStack(
        index: _selectedscreenIndex,
        children: _screens,
      ),
    );
  }

  //Widget Use the BtmNavigation Account
  dynamic __btmAccount() {
    return BottomNavigationBarItem(
      icon: Container(
        width: 7.w,
        height: 3.5.h,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(1.5.w),
          border: Border.all(
            width: 0.5.w,
            color: Color(0xffC5C5C5),
          ),
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(1.2.w),
          child: Image.asset(
            'images/Me.jpg',
            fit: BoxFit.cover,
          ),
        ),
      ),
      activeIcon: Container(
        width: 7.w,
        height: 3.5.h,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(1.5.w),
          border: Border.all(
            width: 0.5.w,
            color: Color(0xffF35383),
          ),
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(1.2.w),
          child: Image.asset(
            'images/Me.jpg',
            fit: BoxFit.cover,
          ),
        ),
      ),
      label: '',
    );
  }

//Widget Use the NavigationBarItem
  dynamic _bottomNavigationBarItem(String img, String imgg, String lbl) {
    return BottomNavigationBarItem(
      icon: Image.asset('images/$img'),
      activeIcon: Image.asset('images/$imgg'),
      label: lbl,
    );
  }
}

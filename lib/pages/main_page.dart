import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:easy_rent/pages/home_page.dart';
import 'package:easy_rent/pages/about_page.dart';
import 'package:easy_rent/pages/profile_page.dart';
import 'package:easy_rent/utils/tip.dart';
import 'package:bottom_navy_bar/bottom_navy_bar.dart';

class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int _currentIndex = 0;
  late PageController _pageController;
  DateTime? currentBackPressTime;

  Future<bool> _onWillPop() {
    DateTime now = DateTime.now();
    if (currentBackPressTime == null ||
        now.difference(currentBackPressTime!) > Duration(seconds: 2)) {
      currentBackPressTime = now;
      showTip(msg: '再按一次返回键退出');
      return Future.value(false);
    }
    SystemChannels.platform.invokeMethod('SystemNavigator.pop');
    return Future.value(true);
  }

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 247, 238, 213),
      body: WillPopScope(
        onWillPop: _onWillPop,
        child: PageView(
          controller: _pageController,
          onPageChanged: (index) {
            setState(() => _currentIndex = index);
          },
          children: <Widget>[
            HomePage(),
            ProfilePage(),
            AboutPage(),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavyBar(
        showElevation: false,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        backgroundColor: Color.fromARGB(255, 247, 238, 213),
        selectedIndex: _currentIndex,
        onItemSelected: (index) {
          setState(() => _currentIndex = index);
          _pageController.animateToPage(
            index,
            duration: Duration(milliseconds: 200),
            curve: Curves.ease,
          );
        },
        items: [
          BottomNavyBarItem(
            title: Text('首页'),
            icon: Icon(Icons.home_outlined),
            textAlign: TextAlign.center,
            activeColor: Color.fromARGB(255, 251, 150, 110),
            inactiveColor: Colors.grey,
          ),
          BottomNavyBarItem(
            title: Text('我的'),
            icon: Icon(Icons.people_outlined),
            textAlign: TextAlign.center,
            activeColor: Color.fromARGB(255, 251, 150, 110),
            inactiveColor: Colors.grey,
          ),
          BottomNavyBarItem(
            title: Text('关于'),
            icon: Icon(Icons.info_outline),
            textAlign: TextAlign.center,
            activeColor: Color.fromARGB(255, 251, 150, 110),
            inactiveColor: Colors.grey,
          ),
        ],
      ),
    );
  }
}

import 'package:agency/model/app_routes.dart';
import 'package:agency/model/post.dart';
import 'package:flutter/material.dart';
import 'dart:math' as math show pi;
import 'package:collapsible_sidebar/collapsible_sidebar.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  late List<CollapsibleItem> _items;

  List<CollapsibleItem> get _generateItems {
    return [
      CollapsibleItem(
        text: '数据中心',
        icon: Icons.assessment,
        onPressed: () => setState(() {}),
        isSelected: true,
      ),
      CollapsibleItem(
        text: '搜索',
        icon: Icons.search,
        onPressed: () => setState(() {}),
      ),
      CollapsibleItem(
        text: '通知',
        icon: Icons.notifications,
        onPressed: () => setState(() {}),
      ),
      CollapsibleItem(
        text: '设置',
        icon: Icons.settings,
        onPressed: () => setState(() {}),
      ),
      CollapsibleItem(
        text: '主页',
        icon: Icons.home,
        onPressed: () => setState(() {}),
      ),
      CollapsibleItem(
        text: '闹钟',
        icon: Icons.access_alarm,
        onPressed: () => setState(() {}),
      ),
      CollapsibleItem(
        text: '事件',
        icon: Icons.event,
        onPressed: () => setState(() {}),
      ),
      CollapsibleItem(
        text: '邮箱',
        icon: Icons.email,
        onPressed: () => setState(() {}),
      ),
      CollapsibleItem(
        text: '发布',
        icon: Icons.post_add_outlined,
        onPressed: () {
          showDialog(context: context, builder: (context) {
            return Container(
              width: 200,
              height: 300,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  MaterialButton(
                    onPressed: () {
                      submitPageType = PostKind.Rent;
                      Navigator.pop(context);
                      Navigator.pushNamed(context, AppRoutes.submitPage);
                    },
                    elevation: 0,
                    shape: StadiumBorder(),
                    color: Color(0xFFfb966e),
                    child: Text('发布出租'),
                  ),
                  MaterialButton(
                    onPressed: () {
                      submitPageType = PostKind.Help;
                      Navigator.pop(context);
                      Navigator.pushNamed(context, AppRoutes.submitPage);
                    },
                    shape: StadiumBorder(),
                    color: Color(0xFFfb966e),
                    child: Text('发布求租'),
                  ),
                ],
              ),
            );
          });
        },
      )
    ];
  }

  Widget _siderBarBody(Size size, BuildContext context) {
    return Container(
      height: double.infinity,
      width: double.infinity,
      color: Colors.blueGrey[50],
      child: Center(
        child: Transform.rotate(
          angle: math.pi / 2,
          child: Transform.translate(
            offset: Offset(-size.height * 0.3, -size.width * 0.23),
            child: Container(),
          ),
        ),
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    _items = _generateItems;
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text('易租中介中心'),
        backgroundColor: Color(0xFFfb966e),
      ),
      body: CollapsibleSidebar(
        items: _items,
        title: '易租',
        toggleTitle: '收回',
        body: _siderBarBody(size, context),
        backgroundColor: Color.fromARGB(255, 247, 238, 213),
        selectedTextColor: Colors.white,
        selectedIconBox: Color(0xFFfb966e),
        selectedIconColor: Colors.white,
        unselectedIconColor: Colors.black87,
        unselectedTextColor: Colors.black87,
        textStyle: TextStyle(
          fontSize: 15,
        ),
        titleStyle: TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.bold,
        ),
        toggleTitleStyle: TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}

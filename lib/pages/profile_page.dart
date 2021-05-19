import 'package:flutter/material.dart';
import 'package:easy_rent/model/user.dart';
import 'package:easy_rent/utils/list_item.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';

class ProfilePage extends StatefulWidget {
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          '个人中心',
        ),
        iconTheme: IconThemeData(color: Colors.white),
        elevation: 0.0,
        backgroundColor: Color.fromARGB(255, 251, 150, 110),
      ),
      body: Stack(
        children: <Widget>[
          Container(
            height: double.infinity,
            child: Column(
              children: <Widget>[
                Expanded(
                  flex: 1,
                  child: Container(
                    color: Color.fromARGB(255, 251, 150, 110),
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Container(
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),
          EasyRefresh.custom(
            slivers: <Widget>[
              SliverList(
                delegate: SliverChildListDelegate(
                  [
                    Stack(
                      children: <Widget>[
                        Container(
                          width: double.infinity,
                          height: 220.0,
                          color: Colors.white,
                        ),
                        ClipPath(
                          clipper: TopBarClipper(
                            MediaQuery.of(context).size.width,
                            200.0,
                          ),
                          child: SizedBox(
                            height: 200.0,
                            child: Container(
                              width: double.infinity,
                              height: 240.0,
                              color: Color.fromARGB(255, 251, 150, 110),
                            ),
                          ),
                        ),
                        Container(
                          margin: new EdgeInsets.only(top: 40.0),
                          child: new Center(
                            child: new Text(
                              'KnoYo',
                              style: new TextStyle(
                                  fontSize: 30.0, color: Colors.white),
                            ),
                          ),
                        ),
                        Container(
                          margin: new EdgeInsets.only(top: 100.0),
                          child: new Center(
                            child: new Container(
                              width: 100.0,
                              height: 100.0,
                              child: new PreferredSize(
                                child: new Container(
                                  child: new ClipOval(
                                    child: new Container(
                                      color: Colors.white,
                                      child: new Image.asset(
                                          'assets/images/icon.png'),
                                    ),
                                  ),
                                ),
                                preferredSize: new Size(80.0, 80.0),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    // Container(
                    //   width: double.infinity,
                    //   color: Colors.white,
                    //   padding: EdgeInsets.all(10.0),
                    //   child: Card(
                    //     color: Colors.blue,
                    //     child: Container(
                    //       padding: EdgeInsets.all(10.0),
                    //       child: Column(
                    //         children: <Widget>[
                    //           ListItem(
                    //             icon: Icon(
                    //               Icons.supervised_user_circle,
                    //               color: Colors.white,
                    //             ),
                    //             title: 'QQ 群',
                    //             titleColor: Colors.white,
                    //             describe: '554981921',
                    //             describeColor: Colors.white,
                    //             onPressed: () {},
                    //           ),
                    //           ListItem(
                    //             icon: Icon(
                    //               Icons.http,
                    //               color: Colors.white,
                    //             ),
                    //             title: 'GitHub',
                    //             titleColor: Colors.white,
                    //             describe: 'https://github.com/xuelongqy',
                    //             describeColor: Colors.white,
                    //             onPressed: () {},
                    //           )
                    //         ],
                    //       ),
                    //     ),
                    //   ),
                    // ),
                    Container(
                      width: double.infinity,
                      color: Colors.white,
                      padding: EdgeInsets.all(10.0),
                      child: Card(
                          color: Colors.green,
                          child: Container(
                            padding: EdgeInsets.all(10.0),
                            child: Column(
                              children: <Widget>[
                                ListItem(
                                  icon: Icon(
                                    Icons.person,
                                    color: Colors.white,
                                  ),
                                  title: '用户名',
                                  titleColor: Colors.white,
                                  describe: 'KnoYo',
                                  describeColor: Colors.white,
                                ),
                              ],
                            ),
                          )),
                    ),
                    Container(
                      width: double.infinity,
                      color: Colors.white,
                      padding: EdgeInsets.all(10.0),
                      child: Card(
                        color: Colors.teal,
                        child: Container(
                          padding: EdgeInsets.all(10.0),
                          child: ListItem(
                            icon: Icon(
                              Icons.email,
                              color: Colors.white,
                            ),
                            title: '邮箱',
                            titleColor: Colors.white,
                            describe: currentUser.name,
                            describeColor: Colors.white,
                            onPressed: () {},
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class TopBarClipper extends CustomClipper<Path> {
  double width;
  double height;

  TopBarClipper(this.width, this.height);

  @override
  Path getClip(Size size) {
    Path path = new Path();
    path.moveTo(0.0, 0.0);
    path.lineTo(width, 0.0);
    path.lineTo(width, height / 2);
    path.lineTo(0.0, height);
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return true;
  }
}

class ProfileInfoTile extends StatelessWidget {
  late final Icon? icon;
  late final String? title;
  late final Color? titleColor;
  late final Color? background;
  late final String? describe;
  late final Color? describeColor;
  late final VoidCallback? onPressed;

  ProfileInfoTile({
    Key? key,
    this.title,
    this.background,
    this.icon,
    this.titleColor,
    this.describe,
    this.describeColor,
    this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      color: Colors.white,
      padding: EdgeInsets.all(10.0),
      child: Card(
        color: background,
        child: Container(
          padding: EdgeInsets.all(10.0),
          child: ListItem(
            icon: icon,
            title: title,
            titleColor: titleColor!,
            describe: describe,
            describeColor: describeColor!,
            onPressed: onPressed,
          ),
        ),
      ),
    );
  }
}

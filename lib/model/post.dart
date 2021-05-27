import 'dart:typed_data';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:easy_rent/utils/contact.dart';
import 'package:flutter_swiper_null_safety/flutter_swiper_null_safety.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

enum PostKind {
  Rent,
  Help,
}

var submitPageType = PostKind.Rent;

List<Post> allPosts = [
  HelpPost(
    "张三",
    "14434236932",
    "2020/4/22",
    expectedAddr: "江苏 南京 鼓楼区",
    expectedPrice: 2400,
    demands: "临近地铁，南北通透最好",
  ),
  HelpPost(
    "李四",
    "14534238912",
    "2020/12/31",
    expectedAddr: "北京 朝阳区",
    expectedPrice: 5300,
    demands: "在学校附近，有电梯的优先",
  ),
  // RentPost(
  // "张杰",
  // "19841814534",
  // "2020/12/31",
  // pictures: [
  // rootBundle.load("assets/images/1/a.jpg").
  // ],
  // roomAddr: "安徽 芜湖 弋江区",
  // description: "波尔卡精装修两房 家具电齐全 价格可谈",
  // price: 1400,
  // restriction: "押一付三",
  // roomType: "2室2厅1卫",
  // roomArea: 87,
  // roomFloor: 6,
  // roomOrientation: "南",
  // )
];

abstract class Post {
  String name;
  String phone;
  String releaseTime;

  static const card_padding = EdgeInsets.all(7);
  static const card_elevation = 0.0;
  static const symmetric_horizontal_padding =
      EdgeInsets.symmetric(horizontal: 25.0);
  static const symmetric_vertical_margin = EdgeInsets.symmetric(vertical: 20.0);

  static const headline_style = TextStyle(
    color: Color.fromRGBO(48, 47, 48, 1.0),
    fontFamily: 'Montserrat',
    fontWeight: FontWeight.w700,
    fontSize: 26.0,
  );

  static const min_body_style = TextStyle(
    color: Color.fromRGBO(141, 141, 141, 1.0),
    fontFamily: 'Montserrat',
    fontWeight: FontWeight.w400,
    fontSize: 12,
  );

  static const subtitle_style = TextStyle(
    color: Color.fromRGBO(48, 47, 48, 1.0),
    fontFamily: 'Montserrat',
    fontWeight: FontWeight.w700,
    fontSize: 16.0,
  );

  static const body_style = TextStyle(
    color: Color.fromRGBO(141, 141, 141, 1.0),
    fontFamily: 'SourceHanSansCN',
    fontWeight: FontWeight.w500,
    fontSize: 14,
    height: 1.5,
  );

  static const sub_headline_style = TextStyle(
    color: Color.fromRGBO(48, 47, 48, 1.0),
    fontFamily: 'Montserrat',
    fontWeight: FontWeight.w700,
    fontSize: 20.0,
  );

  Post(this.name, this.phone, this.releaseTime);

  Widget showPicture();
  String toString();
  Widget buildCard(BuildContext context);
  Widget buildDetail(BuildContext context);

  Widget showHead(BuildContext context) {
    return Stack(
      children: [
        showPicture(),
        SafeArea(
          child: Padding(
            padding: EdgeInsets.only(left: 5),
            child: Padding(
              padding: const EdgeInsets.only(top: 5.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                    color: Colors.white,
                    icon: FaIcon(FontAwesomeIcons.chevronLeft),
                    onPressed: () => Navigator.pop(context),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class HelpPost extends Post {
  String? expectedAddr;
  int? expectedPrice;
  String? demands;

  HelpPost(
    String name,
    String phone,
    String releaseTime, {
    String? expectedAddr,
    int? expectedPrice,
    String? demands,
  })  : expectedAddr = expectedAddr,
        expectedPrice = expectedPrice,
        demands = demands,
        super(name, phone, releaseTime);

  @override
  Widget showPicture() => Image.asset("assets/images/help.png");

  @override
  String toString() => [
        this.expectedAddr,
        this.expectedPrice,
        this.demands,
        this.name,
        this.phone,
      ].join(" ");

  @override
  Widget buildCard(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.of(context)
          .push(MaterialPageRoute(builder: (context) => buildDetail(context))),
      child: Padding(
        padding: Post.card_padding,
        child: Card(
          elevation: Post.card_elevation,
          child: Container(
            padding: Post.symmetric_horizontal_padding,
            margin: Post.symmetric_vertical_margin,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(25.0),
                  child: showPicture(),
                ),
                SizedBox(
                  height: 15,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "￥$expectedPrice",
                      style: TextStyle(
                        color: Colors.green,
                        fontWeight: FontWeight.w700,
                        fontSize: 26.0,
                        fontFamily: "Montserrat",
                      ),
                      overflow: TextOverflow.ellipsis,
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Row(
                      children: [
                        Text(
                          "$expectedAddr",
                          style: TextStyle(
                            color: Color.fromRGBO(141, 141, 141, 1.0),
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                            height: 1.5,
                          ),
                          overflow: TextOverflow.ellipsis,
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        Icon(Icons.location_on_outlined),
                      ],
                    )
                  ],
                ),
                Row(
                  // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Flexible(
                      flex: 5,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Flexible(
                            flex: 3,
                            child: Icon(Icons.fact_check_outlined),
                          ),
                          Spacer(
                            flex: 1,
                          ),
                          Flexible(
                            flex: 16,
                            // fit: FlexFit.tight,
                            child: Text(
                              demands!,
                              style: TextStyle(
                                color: Color.fromRGBO(48, 47, 48, 1.0),
                                fontWeight: FontWeight.w700,
                                fontSize: 12.0,
                              ),
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Flexible(
                      flex: 3,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Flexible(
                            flex: 9,
                            child: Text(
                              releaseTime,
                              style: TextStyle(
                                color: Color.fromRGBO(48, 47, 48, 1.0),
                                fontWeight: FontWeight.w700,
                                fontSize: 12.0,
                              ),
                            ),
                          ),
                          Spacer(
                            flex: 1,
                          ),
                          Flexible(
                            flex: 3,
                            child: Icon(Icons.access_time_outlined),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget buildDetail(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        width: size.width,
        height: size.height,
        child: Stack(
          children: [
            SingleChildScrollView(
              physics: BouncingScrollPhysics(),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  showHead(context),
                  SizedBox(
                    height: 25,
                  ),
                  Padding(
                    padding: Post.symmetric_horizontal_padding,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          '￥$expectedPrice / 月',
                          style: Post.headline_style,
                        ),
                        SizedBox(
                          width: 20,
                        ),
                        Column(
                          children: [
                            Text(
                              name,
                              style: Post.subtitle_style,
                            ),
                            Text(
                              expectedAddr!,
                              style: Post.min_body_style,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 25,
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 25),
                    child: Text(
                      "需求",
                      style: Post.subtitle_style,
                    ),
                  ),
                  SizedBox(
                    height: 25,
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 25),
                    child: Text(
                      demands!,
                      textAlign: TextAlign.justify,
                      style: Post.body_style,
                    ),
                  ),
                  SizedBox(
                    height: 100,
                  ),
                ],
              ),
            ),
            Positioned(
              bottom: 20,
              width: size.width,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  OptionButton(
                    text: "发消息",
                    icon: Icons.message,
                    width: size.width * 0.35,
                    onPressed: () => makeSMSMessage(phone),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  OptionButton(
                    text: "打电话",
                    icon: Icons.call,
                    width: size.width * 0.35,
                    onPressed: () => makePhoneCall(phone),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class RentPost extends Post {
  String? roomAddr;
  int? roomArea;
  String? roomType;
  String? roomOrientation;
  int? roomFloor;
  String? description;
  int? price;
  String? restriction;
  List<Uint8List>? pictures;

  RentPost(
    String name,
    String phone,
    String releaseTime, {
    String? roomAddr,
    String? description,
    int? price,
    String? restriction,
    String? roomType,
    int? roomArea,
    int? roomFloor,
    String? roomOrientation,
    List<Uint8List>? pictures,
  })  : pictures = pictures,
        roomAddr = roomAddr,
        description = description,
        price = price,
        restriction = restriction,
        roomType = roomType,
        roomArea = roomArea,
        roomFloor = roomFloor,
        roomOrientation = roomOrientation,
        super(name, phone, releaseTime);

  @override
  Widget showPicture() {
    return Container(
      height: 220,
      child: Swiper(
        itemBuilder: (BuildContext context, int index) {
          return Image.memory(
            pictures![index],
            fit: BoxFit.fill,
          );
        },
        autoplay: true,
        itemCount: pictures!.length,
        pagination: SwiperPagination(builder: SwiperPagination.fraction),
        control: SwiperControl(),
      ),
    );
  }

  @override
  String toString() => [
        this.roomType,
        this.restriction,
        this.roomOrientation,
        this.roomAddr,
        this.price,
        this.roomFloor,
        this.roomArea,
        this.description,
        this.name,
        this.phone,
      ].join(" ");

  @override
  Widget buildCard(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.of(context)
          .push(MaterialPageRoute(builder: (context) => buildDetail(context))),
      child: Padding(
        padding: Post.card_padding,
        child: Card(
          elevation: Post.card_elevation,
          child: Container(
            padding: Post.symmetric_horizontal_padding,
            margin: Post.symmetric_vertical_margin,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(25.0),
                  child: showPicture(),
                ),
                SizedBox(
                  height: 15,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "￥$price",
                      style: TextStyle(
                        color: Color.fromRGBO(48, 47, 48, 1.0),
                        fontWeight: FontWeight.w700,
                        fontSize: 26.0,
                        fontFamily: "Montserrat",
                      ),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Row(
                      children: [
                        Text(
                          "$roomAddr",
                          style: TextStyle(
                            color: Color.fromRGBO(141, 141, 141, 1.0),
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                            height: 1.5,
                          ),
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        Icon(Icons.location_on_outlined),
                      ],
                    )
                  ],
                ),
                Row(
                  children: [
                    Flexible(
                      flex: 5,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Flexible(
                            flex: 3,
                            child: Icon(Icons.fact_check_outlined),
                          ),
                          Spacer(
                            flex: 1,
                          ),
                          Flexible(
                            flex: 16,
                            child: Text(
                              "朝$roomOrientation / $restriction / $roomType",
                              style: TextStyle(
                                color: Color.fromRGBO(48, 47, 48, 1.0),
                                fontWeight: FontWeight.w700,
                                fontSize: 12.0,
                              ),
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Flexible(
                      flex: 3,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Flexible(
                            flex: 9,
                            child: Text(
                              releaseTime,
                              style: TextStyle(
                                color: Color.fromRGBO(48, 47, 48, 1.0),
                                fontWeight: FontWeight.w700,
                                fontSize: 12.0,
                              ),
                            ),
                          ),
                          Spacer(
                            flex: 1,
                          ),
                          Flexible(
                            flex: 3,
                            child: Icon(Icons.access_time_outlined),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget buildDetail(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        width: size.width,
        height: size.height,
        child: Stack(
          children: [
            SingleChildScrollView(
              physics: BouncingScrollPhysics(),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  showHead(context),
                  SizedBox(
                    height: 25,
                  ),
                  Padding(
                    padding: Post.symmetric_horizontal_padding,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          '￥$price / 月',
                          style: Post.headline_style,
                        ),
                        SizedBox(
                          width: 20,
                        ),
                        Column(
                          children: [
                            Text(
                              name,
                              style: Post.subtitle_style,
                            ),
                            Text(
                              roomAddr!,
                              style: Post.min_body_style,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 25,
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 25),
                    child: Text(
                      "简介",
                      style: Post.subtitle_style,
                    ),
                  ),
                  SizedBox(
                    height: 25,
                  ),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    physics: BouncingScrollPhysics(),
                    child: Row(
                      children: [
                        InfoTile(
                          name: '室型',
                          content: roomType!,
                        ),
                        InfoTile(
                          name: '面积(m²)',
                          content: '$roomArea',
                        ),
                        InfoTile(
                          name: '楼层',
                          content: roomFloor.toString(),
                        ),
                        InfoTile(
                          name: '朝向',
                          content: roomOrientation!,
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 25,
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 25),
                    child: Text(
                      description!,
                      textAlign: TextAlign.justify,
                      style: Post.body_style,
                    ),
                  ),
                  SizedBox(
                    height: 100,
                  ),
                ],
              ),
            ),
            Positioned(
              bottom: 20,
              width: size.width,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  OptionButton(
                    text: "发消息",
                    icon: Icons.message,
                    width: size.width * 0.35,
                    onPressed: () => makeSMSMessage(phone),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  OptionButton(
                    text: "打电话",
                    icon: Icons.call,
                    width: size.width * 0.35,
                    onPressed: () => makePhoneCall(phone),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class InfoTile extends StatelessWidget {
  final String content;
  final String name;

  const InfoTile({Key? key, required this.content, required this.name})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    final double tileSize = size.width * 0.20;
    return Container(
      margin: EdgeInsets.only(left: 25),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          BorderIcon(
            width: tileSize,
            height: tileSize,
            child: Text(
              content,
              style: Post.sub_headline_style,
            ),
          ),
          SizedBox(
            height: 15,
          ),
          Text(
            name,
            style: Post.min_body_style,
          ),
        ],
      ),
    );
  }
}

class BorderIcon extends StatelessWidget {
  final Widget child;
  final double width, height;

  const BorderIcon(
      {Key? key,
      required this.child,
      required this.width,
      required this.height})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15.0),
        border: Border.all(
          width: 2,
          color: Color.fromRGBO(141, 141, 141, 1.0).withAlpha(40),
        ),
      ),
      padding: EdgeInsets.all(8.0),
      child: Center(
        child: child,
      ),
    );
  }
}

class OptionButton extends StatelessWidget {
  final String text;
  final IconData icon;
  final double width;
  final void Function() onPressed;
  const OptionButton({
    Key? key,
    required this.text,
    required this.icon,
    required this.width,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      child: MaterialButton(
        color: Color.fromRGBO(20, 25, 45, 1.0),
        splashColor: Colors.white.withAlpha(55),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
        onPressed: onPressed,
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              icon,
              color: Colors.white,
            ),
            SizedBox(
              width: 10,
            ),
            Text(
              text,
              style: TextStyle(color: Colors.white),
            ),
          ],
        ),
      ),
    );
  }
}

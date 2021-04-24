import 'package:easy_rent/pages/detail_page.dart';
import 'package:easy_rent/utils/contact.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

enum PostKind {
  Rent,
  Help,
}

var submitPageType = PostKind.Rent;

List<Post> allPosts = [
  HelpPost(
    "张三",
    "14434236932",
    expectedAddr: "南京 鼓楼区",
    expectedPrice: 2400,
    demands: "临近地铁，最好是南北通透类型的",
  ),
  HelpPost(
    "李四",
    "14534238912",
    expectedAddr: "北京 朝阳区",
    expectedPrice: 5300,
    demands: "在学校附近，有电梯的优先",
  ),
  RentPost(
    "张杰",
    "19841814534",
    pictures: ["assets/images/1/a.jpg"],
    roomAddr: "安徽 芜湖",
    description: "波尔卡精装修两房 家具电齐全 价格可谈",
    price: 1400,
    restriction: "押一付三",
    roomType: "2室2厅1卫",
    roomArea: 87,
    roomFloor: 6,
    roomOrientation: "南",
  )
];

abstract class Post {
  String name;
  String phone;

  Post(this.name, this.phone);

  Widget showPicture();
  String toString();
  Widget buildCard(BuildContext context);
  Widget buildDetail(BuildContext context);
}

class HelpPost extends Post {
  String expectedAddr;
  int expectedPrice;
  String demands;

  HelpPost(String name, String phone,
      {String expectedAddr, int expectedPrice, String demands})
      : expectedAddr = expectedAddr,
        expectedPrice = expectedPrice,
        demands = demands,
        super(name, phone);

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
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 30.0),
        margin: const EdgeInsets.symmetric(vertical: 20),
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
                Text(
                  "$expectedAddr",
                  style: TextStyle(
                    color: Color.fromRGBO(141, 141, 141, 1.0),
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    height: 1.5,
                  ),
                  overflow: TextOverflow.ellipsis,
                )
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "$demands",
                  style: TextStyle(
                    color: Color.fromRGBO(48, 47, 48, 1.0),
                    fontWeight: FontWeight.w700,
                    fontSize: 12.0,
                  ),
                  overflow: TextOverflow.ellipsis,
                ),
                TextButton(
                  onPressed: () => makePhoneCall(phone),
                  child: Text(
                    "$name - $phone",
                    style: TextStyle(
                      color: Color.fromRGBO(48, 47, 48, 1.0),
                      fontWeight: FontWeight.w700,
                      fontSize: 12.0,
                    ),
                  ),
                ),
              ],
            ),
            Divider(
              thickness: 2.0,
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget buildDetail(BuildContext context) {
    throw UnimplementedError();
  }
}

class RentPost extends Post {
  List<String> pictures;
  String roomAddr;
  String description;
  int price;
  String restriction;
  String roomType;
  int roomArea;
  int roomFloor;
  String roomOrientation;

  RentPost(String name, String phone,
      {List<String> pictures,
      String roomAddr,
      String description,
      int price,
      String restriction,
      String roomType,
      int roomArea,
      int roomFloor,
      String roomOrientation})
      : pictures = pictures,
        roomAddr = roomAddr,
        description = description,
        price = price,
        restriction = restriction,
        roomType = roomType,
        roomArea = roomArea,
        roomFloor = roomFloor,
        roomOrientation = roomOrientation,
        super(name, phone);

  @override
  Widget showPicture() => Image.asset(pictures[0]);

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
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 30.0),
        margin: const EdgeInsets.symmetric(vertical: 20),
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
                Text(
                  "$roomAddr",
                  style: TextStyle(
                    color: Color.fromRGBO(141, 141, 141, 1.0),
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    height: 1.5,
                  ),
                )
              ],
            ),
            // SizedBox(
            //   height: 5,
            // ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "朝$roomOrientation / $restriction / $roomType",
                  style: TextStyle(
                    color: Color.fromRGBO(48, 47, 48, 1.0),
                    fontWeight: FontWeight.w700,
                    fontSize: 12.0,
                  ),
                  overflow: TextOverflow.ellipsis,
                ),
                TextButton(
                  onPressed: () => makePhoneCall(phone),
                  child: Text(
                    "$name - $phone",
                    style: TextStyle(
                      color: Color.fromRGBO(48, 47, 48, 1.0),
                      fontWeight: FontWeight.w700,
                      fontSize: 12.0,
                    ),
                  ),
                ),
              ],
            ),
            Divider(
              thickness: 2.0,
            ),
          ],
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
                  Image.asset(pictures[0]),
                  SizedBox(
                    height: 25,
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 25),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          '￥${price}',
                          style: TextStyle(
                            color: Color.fromRGBO(48, 47, 48, 1.0),
                            fontFamily: 'Montserrat',
                            fontWeight: FontWeight.w700,
                            fontSize: 26.0,
                          ),
                        ),
                        SizedBox(
                          width: 20,
                        ),
                        Text(
                          roomAddr,
                          style: TextStyle(
                            color: Color.fromRGBO(141, 141, 141, 1.0),
                            fontFamily: 'Montserrat',
                            fontWeight: FontWeight.w400,
                            fontSize: 12,
                          ),
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
                      style: TextStyle(
                        color: Color.fromRGBO(48, 47, 48, 1.0),
                        fontFamily: 'Montserrat',
                        fontWeight: FontWeight.w700,
                        fontSize: 16.0,
                      ),
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
                          content: roomType,
                        ),
                        InfoTile(
                          name: '面积',
                          content: '${roomArea}m²',
                        ),
                        InfoTile(
                          name: '楼层',
                          content: roomFloor.toString(),
                        ),
                        InfoTile(
                          name: '朝向',
                          content: roomOrientation,
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
                      description,
                      textAlign: TextAlign.justify,
                      style: TextStyle(
                        color: Color.fromRGBO(141, 141, 141, 1.0),
                        fontFamily: 'SourceHanSansCN',
                        fontWeight: FontWeight.w500,
                        fontSize: 14,
                        height: 1.5,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 100,
                  )
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
                  SizedBox(width: 10,),
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

  const InfoTile({Key key, @required this.content, @required this.name})
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
              style: TextStyle(
                color: Color.fromRGBO(48, 47, 48, 1.0),
                fontFamily: 'Montserrat',
                fontWeight: FontWeight.w700,
                fontSize: 20.0,
              ),
            ),
          ),
          SizedBox(
            height: 15,
          ),
          Text(
            name,
            style: TextStyle(
              color: Color.fromRGBO(48, 47, 48, 1.0),
              fontFamily: 'Montserrat',
              fontWeight: FontWeight.w700,
              fontSize: 12.0,
            ),
          ),
        ],
      ),
    );
  }
}

class BorderIcon extends StatelessWidget {
  final Widget child;
  final double width, height;

  const BorderIcon({Key key, @required this.child, this.width, this.height})
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
  const OptionButton(
      {Key key, @required this.text, @required this.icon, @required this.width, this.onPressed})
      : super(key: key);

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

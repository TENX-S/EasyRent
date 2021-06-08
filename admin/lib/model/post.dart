import 'dart:typed_data';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

abstract class Post {
  String uuid;
  String name;
  String phone;
  String releaseTime;

  Post(this.uuid, this.name, this.phone, this.releaseTime);

  Widget buildPanel(BuildContext context,
      {required void Function()? onVerified});
}

class HelpPost extends Post {
  String? expectedAddr;
  int? expectedPrice;
  String? demands;

  HelpPost(
    String uuid,
    String name,
    String phone,
    String releaseTime, {
    String? expectedAddr,
    int? expectedPrice,
    String? demands,
  })  : expectedAddr = expectedAddr,
        expectedPrice = expectedPrice,
        demands = demands,
        super(uuid, name, phone, releaseTime);

  @override
  Widget buildPanel(BuildContext context,
      {required void Function()? onVerified}) {
    return Padding(
      padding: EdgeInsets.all(8),
      child: Card(
        elevation: 0,
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(vertical: 5),
              child: Text('姓名: $name'),
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 5),
              child: Text('手机: $phone'),
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 5),
              child: Text('期望住址: $expectedAddr'),
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 5),
              child: Text('期望租金: $expectedPrice'),
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 5),
              child: Text('其他需求: $demands'),
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 5),
              child: Text('发布时间: $releaseTime'),
            ),
            Padding(
              padding: EdgeInsets.only(left: 0, top: 0, right: 5, bottom: 5),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  MaterialButton(
                    onPressed: onVerified,
                    shape: StadiumBorder(),
                    color: Color(0xFFfb966e),
                    elevation: 0,
                    child: Text('审核通过'),
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
    String uuid,
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
        super(uuid, name, phone, releaseTime);

  @override
  Widget buildPanel(BuildContext context,
      {required void Function()? onVerified}) {
    return Padding(
      padding: EdgeInsets.all(8),
      child: Card(
        elevation: 0,
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.only(left: 0, top: 0, right: 5, bottom: 5),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 5),
                    child: Text('姓名: $name'),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 5),
                    child: Text('手机: $phone'),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 5),
                    child: Text('地址: $roomAddr'),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 5),
                    child: Text('面积: $roomArea'),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 5),
                    child: Text('室型: $roomType'),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 5),
                    child: Text('朝向: $roomOrientation'),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 5),
                    child: Text('楼层: $roomFloor'),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 5),
                    child: Text('月租金: $price'),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 5),
                    child: Text('支付限制: $restriction'),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 5),
                    child: Text('其他描述: $description'),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 5),
                    child: Text('发布时间: $releaseTime'),
                  ),
                  MaterialButton(
                    onPressed: onVerified,
                    shape: StadiumBorder(),
                    color: Color(0xFFfb966e),
                    elevation: 0,
                    child: Text('认证通过'),
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

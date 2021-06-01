import 'dart:typed_data';

enum PostKind {
  Rent,
  Help,
}

var submitPageType = PostKind.Rent;

abstract class Post {
  String uuid;
  String name;
  String phone;
  String releaseTime;

  Post(this.uuid, this.name, this.phone, this.releaseTime);
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
}

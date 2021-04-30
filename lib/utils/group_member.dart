import 'package:flutter/material.dart';

Widget groupMember({
  @required String realName,
  @required String nickName,
  @required String workContent,
  String realNameFontFamily,
  String nickNameFontFamily,
  double nickNameFontSize,
}) {
  return Column(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            nickName,
            style: TextStyle(
              color: Color.fromRGBO(48, 47, 48, 1.0),
              fontFamily: nickNameFontFamily ?? 'Vladimir',
              fontWeight: FontWeight.w300,
              fontSize: nickNameFontSize ?? 24.0,
            ),
          ),
          Text(
            '(',
            style: TextStyle(
              color: Color.fromRGBO(48, 47, 48, 1.0),
              fontFamily: 'NLXJT',
              fontWeight: FontWeight.w300,
              fontSize: 20.0,
            ),
          ),
          Text(
            realName,
            style: TextStyle(
              color: Color.fromRGBO(48, 47, 48, 1.0),
              fontFamily: realNameFontFamily ?? 'NLXJT',
              fontWeight: FontWeight.w300,
              fontSize: 20.0,
            ),
          ),
          Text(
            ')',
            style: TextStyle(
              color: Color.fromRGBO(48, 47, 48, 1.0),
              fontFamily: 'NLXJT',
              fontWeight: FontWeight.w300,
              fontSize: 20.0,
            ),
          ),
        ],
      ),
      Text(
        workContent,
        style: TextStyle(
          color: Color.fromRGBO(141, 141, 141, 1.0),
          fontFamily: 'Montserrat',
          fontWeight: FontWeight.w400,
          fontSize: 12,
        ),
      ),
    ],
  );
}

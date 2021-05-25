import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

void showTip({required String msg, ToastGravity gravity = ToastGravity.BOTTOM}) {
  Fluttertoast.showToast(
    msg: msg,
    gravity: gravity,
    backgroundColor: Color.fromARGB(255, 247, 238, 213),
    textColor: Color.fromRGBO(141, 141, 141, 1.0),
  );
}

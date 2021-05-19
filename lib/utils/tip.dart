import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

void showTip({required String msg}) {
  Fluttertoast.showToast(
    msg: msg,
    backgroundColor: Color.fromARGB(255, 247, 238, 213),
    textColor: Color.fromRGBO(141, 141, 141, 1.0),
  );
}

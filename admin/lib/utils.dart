import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';


void showPendingDialog(BuildContext context) {
  showDialog(
    barrierDismissible: false,
    context: context,
    builder: (BuildContext context) {
      return SpinKitFoldingCube(color: Color.fromARGB(255, 251, 150, 110));
    },
  );
}

void showTip({required String msg, ToastGravity gravity = ToastGravity.BOTTOM}) {
  Fluttertoast.showToast(
    msg: msg,
    gravity: gravity,
    backgroundColor: Color.fromARGB(255, 247, 238, 213),
    textColor: Color.fromRGBO(141, 141, 141, 1.0),
  );
}

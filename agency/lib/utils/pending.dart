import 'package:flutter/material.dart';
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

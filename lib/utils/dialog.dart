import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:giffy_dialog/giffy_dialog.dart';

mixin PendingDialog {
  void showPendingDialog(BuildContext context) {
    showDialog(
      barrierDismissible: false,
      context: context,
      builder: (BuildContext context) {
        return SpinKitFoldingCube(color: Colors.white);
      },
    );
  }
}

mixin OkDialog {
  void showOkDialog(BuildContext context, {String title, String description}) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AssetGiffyDialog(
            onlyOkButton: true,
            buttonRadius: 20.0,
            buttonOkText: Text(
              '确 定',
              style: TextStyle(
                  fontSize: 19,
                  wordSpacing: 10.0,
                  color: Colors.white,
              ),
            ),
            buttonOkColor: Color(0xFF141414),
            onOkButtonPressed: () {
              Navigator.pop(context);
            },
            title: Text(
              title,
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.w600,
              ),
            ),
            description: Text(description),
            image: Image.asset('assets/images/success.gif'),
          );
        }
    );
  }
}

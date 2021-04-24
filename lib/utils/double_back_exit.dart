import 'package:flutter/material.dart';

class DoubleBackExit extends StatefulWidget {
  final Widget child; // Make Sure this child has a Scaffold widget as parent.

  const DoubleBackExit({@required this.child});

  @override
  _DoubleBackExitState createState() => _DoubleBackExitState();
}

class _DoubleBackExitState extends State<DoubleBackExit> {
  int _lastTimeBackButtonWasTapped;
  static const exitTimeInMillis = 2000;

  bool get _isAndroid => Theme.of(context).platform == TargetPlatform.android;

  @override
  Widget build(BuildContext context) {
    if (_isAndroid) {
      return WillPopScope(
        onWillPop: _handleWillPop,
        child: widget.child,
      );
    } else {
      return widget.child;
    }
  }

  Future<bool> _handleWillPop() async {
    final _currentTime = DateTime.now().millisecondsSinceEpoch;

    if (_lastTimeBackButtonWasTapped != null &&
        (_currentTime - _lastTimeBackButtonWasTapped) < exitTimeInMillis) {
      ScaffoldMessenger.of(context).removeCurrentSnackBar();
      return true;
    } else {
      _lastTimeBackButtonWasTapped = DateTime.now().millisecondsSinceEpoch;
      ScaffoldMessenger.of(context).removeCurrentSnackBar();
      ScaffoldMessenger.of(context).showSnackBar(_getExitSnackBar(context));
      return false;
    }

  }

  SnackBar _getExitSnackBar(BuildContext context) {
    return SnackBar(
      content: ClipRRect(
        borderRadius: BorderRadius.all(Radius.circular(40)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              '再按一次返回键退出',
              style: TextStyle(
                color: Colors.white.withOpacity(0.7),
                fontFamily: 'SourceHanSansCN',
                fontWeight: FontWeight.w500,
                fontSize: 19,
                height: 1.5,
              ),
            ),
          ],
        ),
      ),
      // content: Text('再按一次返回键退出'),
      shape: StadiumBorder(),
      backgroundColor: Colors.grey,
      duration: const Duration(
        seconds: 2,
      ),
      behavior: SnackBarBehavior.floating,
    );
  }
}

import 'dart:ui';
import 'dart:convert';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:flutter/material.dart';
import 'package:easy_rent/model/app_routes.dart';
import 'package:easy_rent/model/user.dart';
import 'package:easy_rent/utils/remote_host.dart';
import 'package:easy_rent/utils/dialog.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> with PendingDialog, RemoteHost {
  String _errorAccountText;
  String _errorPasswordText;
  bool _visiblePassword = false;
  bool _formChanged = false;
  final _user = User(MessageKind.Login);
  final _formKey = GlobalKey<FormState>();
  FocusNode focusNode;
  DateTime currentBackPressTime;

  @override
  void initState() {
    super.initState();
    focusNode = FocusNode();
    listenServer();
  }

  @override
  void dispose() {
    focusNode.dispose();
    disposeRemoteHost();
    super.dispose();
  }

  void _onFormChange() {
    if (_formChanged) return;
    setState(() {
      _formChanged = true;
    });
  }

  void _reverseVisibility() {
    setState(() {
      _visiblePassword = !_visiblePassword;
    });
  }

  void _onErrorAccount() {
    setState(() {
      _errorAccountText = '用户名不存在！';
    });
  }

  void _onErrorPassword() {
    setState(() {
      _errorPasswordText = '密码错误！';
    });
  }

  void _clearErrorText() {
    setState(() {
      _errorAccountText = null;
      _errorPasswordText = null;
    });
  }

  Future<bool> _onWillPop() {
    DateTime now = DateTime.now();
    if (currentBackPressTime == null ||
        now.difference(currentBackPressTime) > Duration(seconds: 2)) {
      currentBackPressTime = now;
      Fluttertoast.showToast(msg: '再按一次返回键退出');
      return Future.value(false);
    }
    return Future.value(true);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: WillPopScope(
          onWillPop: _onWillPop,
          child: Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/bg.png'),
                fit: BoxFit.cover,
              ),
            ),
            child: TweenAnimationBuilder(
              builder: (BuildContext context, double _val, Widget child) {
                return Opacity(
                  opacity: _val,
                  child: child,
                );
              },
              tween: Tween<double>(begin: 0, end: 1),
              curve: Curves.slowMiddle,
              duration: Duration(milliseconds: 1400),
              child: Center(
                child: Card(
                  elevation: 15.0,
                  color: Colors.white.withOpacity(0.7),
                  child: Container(
                    width: 360,
                    height: 330,
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 8.0),
                      child: Form(
                        key: _formKey,
                        onChanged: _onFormChange,
                        autovalidateMode: AutovalidateMode.disabled,
                        child: ListView(
                          shrinkWrap: true,
                          children: <Widget>[
                            Padding(
                              padding: EdgeInsets.symmetric(vertical: 8.0),
                              child: TextFormField(
                                onSaved: (String email) => _user.email = email,
                                keyboardType: TextInputType.emailAddress,
                                decoration: InputDecoration(
                                  prefixIcon: Icon(Icons.account_circle_outlined),
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(28.7),
                                    ),
                                  ),
                                  focusColor: Colors.black,
                                  hintText: '用户名（邮箱）',
                                  errorText: _errorAccountText,
                                ),
                                validator: (String val) {
                                  if (val.isEmpty) {
                                    return '用户名不能为空！';
                                  }
                                  return null;
                                },
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.symmetric(vertical: 8.0),
                              child: TextFormField(
                                onSaved: (String password) =>
                                    _user.password = password,
                                keyboardType: TextInputType.visiblePassword,
                                decoration: InputDecoration(
                                  suffixIcon: IconButton(
                                    icon: Icon(_visiblePassword
                                        ? Icons.visibility_outlined
                                        : Icons.visibility_off_outlined),
                                    onPressed: _reverseVisibility,
                                  ),
                                  prefixIcon: Icon(Icons.lock_outlined),
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(28.7),
                                    ),
                                  ),
                                  hintText: '密码',
                                  errorText: _errorPasswordText,
                                ),
                                obscureText: !_visiblePassword,
                                validator: (String val) {
                                  if (val.isEmpty) {
                                    return '密码不能为空！';
                                  }
                                  return null;
                                },
                              ),
                            ),
                            Divider(
                              height: 50.0,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: <Widget>[
                                Padding(
                                  padding: EdgeInsets.all(8.0),
                                  child: Container(
                                    width: 120.0,
                                    height: 40.0,
                                    decoration: ShapeDecoration(
                                      shape: StadiumBorder(),
                                      color: _formChanged
                                          ? Color(0xFF141414)
                                          : Colors.grey,
                                    ),
                                    child: MaterialButton(
                                      materialTapTargetSize:
                                          MaterialTapTargetSize.shrinkWrap,
                                      shape: StadiumBorder(),
                                      child: Text(
                                        '登 录',
                                        style: TextStyle(
                                          fontSize: 18.0,
                                          wordSpacing: 12.0,
                                          color: Colors.white,
                                        ),
                                      ),
                                      onPressed: _formChanged
                                          ? () async {
                                              _clearErrorText();
                                              if (_formKey.currentState
                                                  .validate()) {
                                                _formKey.currentState.save();
                                                sendMessage(jsonEncode(_user));
                                                showPendingDialog(context);
                                                var resp =
                                                    await getLoginResponse();
                                                print(resp);
                                                if (resp == 'ls0') {
                                                  Navigator.pop(context);
                                                  _formKey.currentState.reset();
                                                  Navigator.pushNamed(context,
                                                      AppRoutes.mainPage);
                                                } else {
                                                  Navigator.pop(context);
                                                  if (resp == 'lf0') {
                                                    _onErrorAccount();
                                                  }
                                                  if (resp == 'lf1') {
                                                    _onErrorPassword();
                                                  }
                                                }

                                                // await Future.delayed(Duration(seconds: 3));
                                                // Navigator.pop(context);
                                                // _formKey.currentState.reset();
                                                // Navigator.pushNamed(context, AppRoutes.mainPage);
                                                // show dialog
                                                // error: 1 - username doesn't exist
                                                // error: 2 - password not match
                                                // error: 3 - network error
                                                // result: 1 - Success, forward to main screen
                                              } else {
                                                FocusScope.of(context)
                                                    .requestFocus(focusNode);
                                              }
                                            }
                                          : null,
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.all(8.0),
                                  child: Container(
                                    width: 120.0,
                                    height: 40.0,
                                    decoration: ShapeDecoration(
                                      shape: StadiumBorder(),
                                      color: Colors.grey,
                                    ),
                                    child: MaterialButton(
                                      materialTapTargetSize:
                                          MaterialTapTargetSize.shrinkWrap,
                                      shape: StadiumBorder(),
                                      child: Text(
                                        '注 册',
                                        style: TextStyle(
                                          fontSize: 18.0,
                                          wordSpacing: 12.0,
                                          color: Colors.white,
                                        ),
                                      ),
                                      onPressed: () => Navigator.pushNamed(
                                          context, AppRoutes.registerPage),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

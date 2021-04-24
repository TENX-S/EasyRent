import 'dart:ui';
import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:email_validator/email_validator.dart';
import 'package:easy_rent/model/user.dart';
import 'package:easy_rent/utils/remote_host.dart';
import 'package:easy_rent/utils/dialog.dart';

class RegisterPage extends StatefulWidget {
  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> with RemoteHost, PendingDialog, OkDialog {

  String _errorAccountText;
  bool _visiblePassword = false;
  bool _formChanged = false;
  final _newUser = User(MessageKind.Register);
  final _formKey = GlobalKey<FormState>();
  FocusNode focusNode;
  var _passwordCandidate = '';

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
      _errorAccountText = '用户名已存在，请直接登录！';
    });
  }

  void _clearErrorText() {
    setState(() {
      _errorAccountText = null;
    });
  }

  Future<bool> _onWillPop() {
    if (!_formChanged) return Future<bool>.value(true);
    return showDialog<bool>(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
                content: Text('您确定要放弃注册吗？若如此，所有已填写的信息都会丢失！'),
                actions: <Widget>[
                  TextButton(
                    onPressed: () => Navigator.of(context).pop(false),
                    child: Text(
                      "取消",
                      style: TextStyle(
                        color: Colors.black,
                      ),
                    ),
                  ),
                  TextButton(
                    onPressed: () => Navigator.pop(context, true),
                    child: Text(
                      "确定",
                      style: TextStyle(
                        color: Colors.red,
                      ),
                    ),
                  ),
                ],
              ) ??
              false;
        });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/bg.png'),
            fit: BoxFit.cover,
          ),
        ),
        child: Center(
          child: Card(
            elevation: 10.0,
            color: Colors.white.withOpacity(0.5),
            child: Container(
              width: 340,
              height: 420,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 8.0),
                child: Form(
                  key: _formKey,
                  onChanged: _onFormChange,
                  onWillPop: _onWillPop,
                  autovalidateMode: AutovalidateMode.disabled,
                  child: ListView(
                    shrinkWrap: true,
                    children: <Widget>[
                      Padding(
                        padding: EdgeInsets.symmetric(vertical: 8.0),
                        child: TextFormField(
                          onSaved: (String val) => _newUser.email = val,
                          keyboardType: TextInputType.emailAddress,
                          decoration: InputDecoration(
                            prefixIcon: Icon(Icons.account_circle),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.all(
                                Radius.circular(28.7),
                              ),
                            ),
                            hintText: '邮箱，作为用户名',
                            errorText: _errorAccountText,
                          ),
                          autofocus: true,
                          validator: (String val) {
                            if (!EmailValidator.validate(val)) {
                              return '邮箱格式不正确！';
                            }
                            return null;
                          },
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(vertical: 8.0),
                        child: TextFormField(
                          onChanged: (String val) => _passwordCandidate = val,
                          onSaved: (String val) => _newUser.password = val,
                          keyboardType: TextInputType.visiblePassword,
                          decoration: InputDecoration(
                            suffixIcon: IconButton(
                              icon: Icon(_visiblePassword
                                  ? Icons.visibility
                                  : Icons.visibility_off),
                              onPressed: _reverseVisibility,
                            ),
                            prefixIcon: Icon(Icons.lock),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.all(
                                Radius.circular(28.7),
                              ),
                            ),
                            hintText: '输入密码',
                            helperText: '不少于6位的数字、字母或标点符号的组合',
                            helperStyle: TextStyle(fontSize: 14.0),
                          ),
                          obscureText: !_visiblePassword,
                          validator: (String val) {
                            if (val.length < 6) {
                              return '密码格式不正确！';
                            }
                            return null;
                          },
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(vertical: 8.0),
                        child: TextFormField(
                          keyboardType: TextInputType.visiblePassword,
                          decoration: InputDecoration(
                            suffixIcon: IconButton(
                              icon: Icon(_visiblePassword
                                  ? Icons.visibility
                                  : Icons.visibility_off),
                              onPressed: _reverseVisibility,
                            ),
                            prefixIcon: Icon(Icons.lock),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.all(
                                Radius.circular(28.7),
                              ),
                            ),
                            hintText: '确认密码',
                          ),
                          obscureText: !_visiblePassword,
                          validator: (String val) {
                            if (val != _passwordCandidate) {
                              return '两次输入的密码不一致！';
                            }
                            return null;
                          },
                        ),
                      ),
                      Divider(
                        height: 30.0,
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
                                  '确 定',
                                  style: TextStyle(
                                    fontSize: 20.0,
                                    wordSpacing: 12.0,
                                    color: Colors.white,
                                  ),
                                ),
                                onPressed: _formChanged
                                    ? () async {
                                        _clearErrorText();
                                        if (_formKey.currentState.validate()) {
                                          _formKey.currentState.save();
                                          // send to server
                                          sendMessage(jsonEncode(_newUser));
                                          showPendingDialog(context);
                                          var resp = await getRegisterResponse();
                                          print(resp);
                                          if (resp == 'rs0') {
                                            _formKey.currentState.reset();
                                            Navigator.pop(context);
                                            Navigator.pop(context);
                                            showOkDialog(
                                              context,
                                              title: '注册成功',
                                              description: '感谢您的信任，租房从此不再困难！'
                                            );
                                          } else if (resp == 'rf0') {
                                            Navigator.pop(context);
                                            _onErrorAccount();
                                          }
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
                                  '取 消',
                                  style: TextStyle(
                                    fontSize: 20.0,
                                    wordSpacing: 12.0,
                                    color: Colors.white,
                                  ),
                                ),
                                onPressed: () async {
                                  if (await _onWillPop()) {
                                    Navigator.of(context).pop(false);
                                  }
                                },
                              ),
                            ),
                          ),
                        ],
                      )
                    ],
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

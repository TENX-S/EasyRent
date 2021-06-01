import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {


  void _onDone() {

  }

  Widget _actionButton(
      BuildContext context,
      Color color,
      String content,
      bool save,
      ) =>
      TextButton(
        onPressed: () => Navigator.of(context).pop(save),
        child: Text(
          content,
          style: TextStyle(
            color: color,
            fontFamily: 'SourceHanSansCN',
            fontWeight: FontWeight.w500,
            fontSize: 14,
            height: 1.5,
          ),
        ),
      );

  Future<bool> _onWillPop() async {
    return await showDialog(
      context: context,
      builder: (BuildContext context) => AlertDialog(
        // backgroundColor: Color.fromARGB(255, 247, 238, 213),
        content: Text('您确定要返回吗，所有已填写的信息都将丢失'),
        actions: <Widget>[
          _actionButton(context, Colors.black, '取消', false),
          _actionButton(context, Colors.red, '确定', true),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text('易租中介中心'),
        backgroundColor: Color(0xFFfb966e),
      ),
      body: WillPopScope(
        onWillPop: _onWillPop,
        child: Stack(
          children: [
            Center(
              child: Container(
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage("assets/images/auth_bg.jpg"),
                    fit: BoxFit.fill,
                  ),
                ),
              ),
            ),
            Center(
              child: ClipRRect(
                borderRadius: BorderRadius.all(Radius.circular(10.0)),
                child: BackdropFilter(
                  filter: ImageFilter.blur(sigmaX: 10.0, sigmaY: 10.0),
                  child: Container(
                    width: size.width / 3.5,
                    height: size.height / 1.5,
                    decoration: BoxDecoration(
                        color: Colors.grey.shade200.withOpacity(0.5)),
                    child: Container(
                      margin: EdgeInsets.symmetric(horizontal: 20),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          FormBuilderTextField(
                            cursorColor: Colors.black,
                            name: 'corp',
                            decoration: InputDecoration(
                              hintText: '法人代表',
                              hintStyle: TextStyle(fontSize: 19),
                            ),
                          ),
                          FormBuilderTextField(
                            cursorColor: Colors.black,
                            name: 'corpId',
                            decoration: InputDecoration(
                              hintText: '法人身份证号',
                              hintStyle: TextStyle(fontSize: 19),
                            ),
                          ),
                          FormBuilderTextField(
                            cursorColor: Colors.black,
                            name: 'comRegdAddr',
                            decoration: InputDecoration(
                              hintText: '机构注册地址',
                              hintStyle: TextStyle(fontSize: 19),
                            ),
                          ),
                          FormBuilderTextField(
                            cursorColor: Colors.black,
                            name: 'name',
                            decoration: InputDecoration(
                              hintText: '邮箱（作为登录名）',
                              hintStyle: TextStyle(fontSize: 19),
                            ),
                            // TODO: - validators
                          ),
                          FormBuilderTextField(
                            cursorColor: Colors.black,
                            name: 'password',
                            decoration: InputDecoration(
                              hintText: '密码',
                              hintStyle: TextStyle(fontSize: 19),
                            ),
                          ),
                          FormBuilderTextField(
                            cursorColor: Colors.black,
                            name: 'rePassword',
                            decoration: InputDecoration(
                              hintText: '请重复输入密码',
                              hintStyle: TextStyle(fontSize: 19),
                            ),
                          ),
                          MaterialButton(
                            onPressed: _onDone,
                            child: Text('完 成'),
                            shape: StadiumBorder(),
                            color: Color(0xFFfb966e),
                            elevation: 0,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

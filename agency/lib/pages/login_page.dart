import 'dart:ui';
import 'package:agency/model/agent.dart';
import 'package:agency/model/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  var agent = Agent(name: '', password: '');

  void _onLogin() {
    Navigator.pushNamed(context, AppRoutes.mainPage);
  }

  void _onRegister() {
    Navigator.pushNamed(context, AppRoutes.registerPage);
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text('易租中介中心'),
        backgroundColor: Color(0xFFfb966e),
      ),
      body: Stack(
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
                  width: size.width / 4,
                  height: size.height / 3,
                  decoration: BoxDecoration(
                      color: Colors.grey.shade200.withOpacity(0.5)),
                  child: Container(
                    margin: EdgeInsets.symmetric(horizontal: 10),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Flexible(
                              flex: 1,
                              child: Icon(Icons.account_circle),
                            ),
                            Flexible(
                              flex: 5,
                              child: FormBuilderTextField(
                                cursorColor: Colors.black,
                                name: 'name',
                                decoration: InputDecoration(
                                  hintText: '邮箱',
                                  hintStyle: TextStyle(fontSize: 19),
                                ),
                              ),
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Flexible(
                              flex: 1,
                              child: Icon(Icons.lock),
                            ),
                            Flexible(
                              flex: 5,
                              child: FormBuilderTextField(
                                cursorColor: Colors.black,
                                name: 'password',
                                decoration: InputDecoration(
                                  hintText: '密码',
                                  hintStyle: TextStyle(fontSize: 19),
                                ),
                              ),
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            MaterialButton(
                              onPressed: _onLogin,
                              shape: StadiumBorder(),
                              color: Color(0xFFfb966e),
                              elevation: 0,
                              child: Text('登 录'),
                            ),
                            MaterialButton(
                              onPressed: _onRegister,
                              shape: StadiumBorder(),
                              child: Text('注 册'),
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
        ],
      ),
    );
  }
}

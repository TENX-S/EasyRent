import 'dart:ui';
import 'package:agency/grpc/auth.pb.dart';
import 'package:agency/model/agent.dart';
import 'package:agency/model/client.dart';
import 'package:agency/model/app_routes.dart';
import 'package:agency/utils/pending.dart';
import 'package:agency/utils/tip.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  var agent = Agent();
  final _formKey = GlobalKey<FormBuilderState>();
  final authClient = AuthClient(serverAddr: '1.116.216.141', serverPort: 8082);

  void _onLogin() async {
    bool? validate = _formKey.currentState?.saveAndValidate();
    if (validate!) {
      final value = _formKey.currentState?.value;
      agent
        ..name = value!['name']
        ..password = value['password'];
      showPendingDialog(context);
      final resp = await authClient.onLogin(agent);
      Navigator.pop(context);
      if (!resp.success) {
        switch (resp.error) {
          case AuthError.NONEXISTENT_USER:
            showTip(msg: '用户名不存在', gravity: ToastGravity.TOP);
            return;
          case AuthError.MISMATCHED_PASSWORD:
            showTip(msg: '密码错误', gravity: ToastGravity.TOP);
            return;
          case AuthError.UNVERIFIED:
            showTip(msg: '账户审核中', gravity: ToastGravity.TOP);
            return;
          case AuthError.UNKNOWN:
            showTip(msg: '未知的错误', gravity: ToastGravity.TOP);
            return;
        }
      }
      currentAgent!..name = agent.name;
      Navigator.pushNamed(context, AppRoutes.mainPage);
    }
    return;
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
                  child: FormBuilder(
                    key: _formKey,
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
                                    hintText: '用户名',
                                    hintStyle: TextStyle(fontSize: 19),
                                  ),
                                  validator: FormBuilderValidators.compose([
                                    FormBuilderValidators.required(
                                      context,
                                      errorText: '不能为空',
                                    ),
                                  ]),
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
                                  validator: FormBuilderValidators.compose([
                                    FormBuilderValidators.required(
                                      context,
                                      errorText: '不能为空',
                                    ),
                                  ]),
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
                                onPressed: () => Navigator.pushNamed(context, AppRoutes.registerPage),
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
          ),
        ],
      ),
    );
  }
}

import 'package:easy_rent/easyrent.pb.dart';
import 'package:easy_rent/easyrent.pbgrpc.dart';
import 'package:easy_rent/utils/auth.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:easy_rent/model/app_routes.dart';
import 'package:easy_rent/model/user.dart';
import 'package:flutter_login/flutter_login.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  DateTime? currentBackPressTime;
  AuthClient _authClient = AuthClient();

  Future<String?> _onLogin(LoginData input) async {
    final resp = await _authClient.onLogin(
      User(
        kind: MessageKind.Login,
        email: input.name,
        password: input.password,
      ),
    );
    if (!resp.success) {
      switch (resp.failedReason) {
        case LoginFailedReason.INEXISTENT_USER:
          return '用户名不存在';
        case LoginFailedReason.WRONG_PASSWORD:
          return '密码错误';
      }
    }
  }

  Future<String?> _onRegister(LoginData input) async {
    final resp = await _authClient.onRegister(
      User(
        kind: MessageKind.Register,
        email: input.name,
        password: input.password,
      ),
    );
    if (!resp.success) {
      switch (resp.failedReason) {
        case RegisterFailedReason.DUPLICATED_USER:
          return '用户名已存在，请直接登录';
      }
    }
  }

  Future<String?> _onRecover(String _) async {
    return null;
  }

  Future<bool> _onWillPop() {
    DateTime now = DateTime.now();
    if (currentBackPressTime == null ||
        now.difference(currentBackPressTime!) > Duration(seconds: 2)) {
      currentBackPressTime = now;
      Fluttertoast.showToast(
        msg: '再按一次返回键退出',
        backgroundColor: Color.fromARGB(255, 240, 235, 213),
        textColor: Color.fromRGBO(141, 141, 141, 1.0),
      );
      return Future.value(false);
    }
    return Future.value(true);
  }

  @override
  void initState() {
    super.initState();

    // listenServer();
  }

  @override
  void dispose() {
    disposeRemoteHost();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: _onWillPop,
      child: FlutterLogin(
        title: 'Easy Rent',
        hideForgotPasswordButton: true,
        loginAfterSignUp: false,
        onLogin: _onLogin,
        onSignup: _onRegister,
        onRecoverPassword: _onRecover,
        onSubmitAnimationCompleted: () =>
            Navigator.pushNamed(context, AppRoutes.mainPage),
        messages: LoginMessages(
          usernameHint: '用户名',
          passwordHint: '密码',
          confirmPasswordHint: '重复输入密码',
          loginButton: '登录',
          signupButton: '注册',
          confirmPasswordError: '密码不匹配',
          flushbarTitleError: '😅😅😅',
          flushbarTitleSuccess: '🎉🎉🎉',
          signUpSuccess: '注册成功',
        ),
        theme: LoginTheme(
          primaryColor: Color.fromARGB(255, 251, 150, 110),
          accentColor: Color.fromARGB(255, 251, 150, 110),
          buttonTheme: LoginButtonTheme(
            splashColor: Color.fromARGB(255, 247, 238, 213),
          ),
          titleStyle: TextStyle(
            color: Color.fromARGB(255, 247, 238, 213),
            fontFamily: 'Vladimir',
            fontWeight: FontWeight.w600,
            wordSpacing: 10.0,
            fontSize: 60.0,
          ),
          cardTheme: CardTheme(
            color: Color.fromARGB(255, 247, 238, 213),
          ),
        ),
        emailValidator: (email) {
          if (!EmailValidator.validate(email!)) {
            return '用户名格式不正确';
          }
          return null;
        },
        passwordValidator: (password) {
          if (password!.isEmpty || password.length < 6) {
            return '密码格式不正确';
          }
          return null;
        },
      ),
      // ),
    );
  }
}

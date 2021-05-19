import 'package:flutter/material.dart';
import 'package:easy_rent/grpc/auth.pb.dart';
import 'package:easy_rent/grpc/auth.pbgrpc.dart';
import 'package:easy_rent/model/auth.dart';
import 'package:easy_rent/model/app_routes.dart';
import 'package:easy_rent/model/user.dart';
import 'package:email_validator/email_validator.dart';
import 'package:easy_rent/utils/tip.dart';
import 'package:flutter_login/flutter_login.dart';

class AuthPage extends StatefulWidget {
  @override
  _AuthPageState createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> {
  DateTime? currentBackPressTime;
  AuthClient _authClient = AuthClient(
    serverAddr: '1.116.216.141',
    serverPort: 8081,
  );

  Future<String?> _onLogin(LoginData input) async {
    final user = User(
      name: input.name,
      password: input.password,
    );
    late final resp;
    try {
      resp = await _authClient.onLogin(user);
    } catch (e) {
      showTip(msg: e.toString());
    }

    if (!resp.success) {
      switch (resp.error) {
        case AuthError.NONEXISTENT_USER:
          return '用户名不存在';
        case AuthError.MISMATCHED_PASSWORD:
          return '密码错误';
        case AuthError.UNKNOWN:
          return '未知的错误';
      }
    }
    currentUser = user;
  }

  Future<String?> _onRegister(LoginData input) async {
    final user = User(
      name: input.name,
      password: input.password,
    );
    late final resp;
    try {
      resp = await _authClient.onRegister(user);
    } catch (e) {
      showTip(msg: e.toString());
    }

    if (!resp.success) {
      switch (resp.error) {
        case AuthError.DUPLICATED_NAME:
          return '用户名已存在，请直接登录';
        case AuthError.UNKNOWN:
          return '未知的错误';
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
      showTip(msg: '再按一次返回键退出');
      return Future.value(false);
    }
    return Future.value(true);
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
            Navigator.of(context).pushReplacementNamed(AppRoutes.mainPage),
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

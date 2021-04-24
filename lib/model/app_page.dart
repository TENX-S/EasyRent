import 'package:flutter/material.dart';
import 'package:easy_rent/pages/login_page.dart';
import 'package:easy_rent/pages/main_page.dart';
import 'package:easy_rent/pages/register_page.dart';
import 'package:easy_rent/pages/submit_page.dart';

enum PageType {
  Login,
  Register,
  Main,
  Submit,
}

class AppPage {
  final PageType pageType;

  AppPage({Key key, @required this.pageType});

  Widget get page {
    switch (pageType) {
      case PageType.Login:
        return LoginPage();
      case PageType.Register:
        return RegisterPage();
      case PageType.Main:
        return MainPage();
      case PageType.Submit:
        return SubmitPage();
    }
  }

}
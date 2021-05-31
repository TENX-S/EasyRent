import 'package:flutter/material.dart';
import 'package:agency/pages/login_page.dart';
import 'package:agency/pages/register_page.dart';
import 'package:agency/pages/release_page.dart';
import 'package:agency/pages/main_page.dart';

enum PageType {
  Login,
  Register,
  Release,
  Main,
}

class AppPage {
  final PageType pageType;

  AppPage({Key? key, required this.pageType});

  Widget get page {
    switch (pageType) {
      case PageType.Login:
        return LoginPage();
      case PageType.Register:
        return RegisterPage();
      case PageType.Release:
        return ReleasePage();
      case PageType.Main:
        return MainPage();
    }
  }
}
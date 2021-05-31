import 'package:flutter/material.dart';
import 'package:easy_rent/pages/auth_page.dart';
import 'package:easy_rent/pages/main_page.dart';
import 'package:easy_rent/pages/submit_page.dart';
import 'package:easy_rent/pages/select_page.dart';

enum PageType {
  Auth,
  Main,
  Submit,
  Select,
}

class AppPage {
  final PageType pageType;

  AppPage({Key? key, required this.pageType});

  Widget get page {
    switch (pageType) {
      case PageType.Auth:
        return AuthPage();
      case PageType.Main:
        return MainPage();
      case PageType.Submit:
        return SubmitPage();
      case PageType.Select:
        return SelectPage();
    }
  }
}

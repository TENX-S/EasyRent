import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:easy_rent/model/app_page.dart';
import 'package:easy_rent/model/app_routes.dart';

void main() {
  // Disable landscape mode
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);

  runApp(App());
}

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Easy Rent',
      theme: ThemeData(
        fontFamily: 'SourceHanSansCN',
        primaryColor: Color(0xFF3A3B3C),
        pageTransitionsTheme: PageTransitionsTheme(builders: {
          TargetPlatform.android: CupertinoPageTransitionsBuilder(),
          TargetPlatform.iOS: CupertinoPageTransitionsBuilder(),
        }),
      ),
      routes: {
        AppRoutes.loginPage: (context) =>
            AppPage(pageType: PageType.Login).page,
        AppRoutes.registerPage: (context) =>
            AppPage(pageType: PageType.Register).page,
        AppRoutes.mainPage: (context) =>
            AppPage(pageType: PageType.Main).page,
        AppRoutes.submitPage: (context) =>
            AppPage(pageType: PageType.Submit).page,
      },
    );
  }
}

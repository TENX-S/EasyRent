import 'dart:ui' as ui;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:agency/model/app_page.dart';
import 'package:agency/model/app_routes.dart';

extension ColorExtension on Color {
  MaterialColor get swatch => Colors.primaries.firstWhere(
        (Color c) => c.value == value,
    orElse: () => _swatch,
  );

  Map<int, Color> get getMaterialColorValues => <int, Color>{
    50: _swatchShade(50),
    100: _swatchShade(100),
    200: _swatchShade(200),
    300: _swatchShade(300),
    400: _swatchShade(400),
    500: _swatchShade(500),
    600: _swatchShade(600),
    700: _swatchShade(700),
    800: _swatchShade(800),
    900: _swatchShade(900),
  };

  MaterialColor get _swatch => MaterialColor(value, getMaterialColorValues);

  Color _swatchShade(int swatchValue) => HSLColor.fromColor(this)
      .withLightness(1 - (swatchValue / 1000))
      .toColor();
}

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);

  runApp(App());
}

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: 'SourceHanSansCN',
        brightness: MediaQueryData.fromWindow(ui.window).platformBrightness,
        primarySwatch: Color(0xFFfb966e).swatch,
        primaryColor: Color(0xFF3A3B3C),
      ),
      routes: {
        AppRoutes.loginPage: (context) => AppPage(pageType: PageType.Login).page,
        AppRoutes.registerPage: (context) => AppPage(pageType: PageType.Register).page,
        AppRoutes.releasePage: (context) => AppPage(pageType: PageType.Release).page,
        AppRoutes.mainPage: (context) => AppPage(pageType: PageType.Main).page,
      },
    );
  }
}

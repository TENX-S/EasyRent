import 'package:flutter/material.dart';
import 'package:easy_rent/model/post.dart';
import 'package:easy_rent/model/app_routes.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class SelectPage extends StatelessWidget {
  static const headline_style = TextStyle(
    color: Color.fromRGBO(48, 47, 48, 1.0),
    fontFamily: 'Montserrat',
    fontWeight: FontWeight.w500,
    fontSize: 84.0,
  );

  Widget buildPanel(
    BuildContext context, {
    required String top,
    required String bottom,
    VoidCallback? onPressed,
    Color? color,
  }) {
    return Expanded(
      child: Container(
        color: color,
        child: TextButton(
          onPressed: onPressed,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                top,
                style: headline_style,
              ),
              Text(
                bottom,
                style: headline_style,
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                buildPanel(
                  context,
                  top: '出',
                  bottom: '租',
                  color: Color.fromARGB(255, 251, 150, 110),
                  onPressed: () {
                    submitPageType = PostKind.Rent;
                    Navigator.pushNamed(context, AppRoutes.submitPage);
                  },
                ),
                buildPanel(
                  context,
                  top: '求',
                  bottom: '租',
                  color: Color.fromARGB(255, 247, 238, 213),
                  onPressed: () {
                    submitPageType = PostKind.Help;
                    Navigator.pushNamed(context, AppRoutes.submitPage);
                  },
                ),
              ],
            ),
          ),
          SafeArea(
            child: Row(
              children: [
                IconButton(
                  onPressed: () => Navigator.pop(context),
                  icon: FaIcon(FontAwesomeIcons.chevronLeft),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

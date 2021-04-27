import 'package:flutter/material.dart';
import 'package:easy_rent/model/post.dart';

class SelectPage extends StatelessWidget {
  static const headline_style = TextStyle(
    color: Color.fromRGBO(48, 47, 48, 1.0),
    fontFamily: 'Montserrat',
    fontWeight: FontWeight.w500,
    fontSize: 84.0,
  );

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        width: size.width,
        height: size.height,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              child: Container(
                color: Color.fromARGB(255, 247, 238, 213),
                child: TextButton(
                  onPressed: () => submitPageType = PostKind.Help,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        '求',
                        style: headline_style,
                      ),
                      SizedBox(
                        height: size.height / 6,
                      ),
                      Text(
                        '租',
                        style: headline_style,
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Expanded(
              child: Container(
                color: Color.fromARGB(255, 251, 150, 110),
                child: TextButton(
                  onPressed: () => submitPageType = PostKind.Rent,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        '出',
                        style: headline_style,
                      ),
                      SizedBox(
                        height: size.height / 6,
                      ),
                      Text(
                        '租',
                        style: headline_style,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

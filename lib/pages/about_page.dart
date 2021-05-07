import 'package:flutter/material.dart';

class AboutPage extends StatefulWidget {
  const AboutPage({Key? key}) : super(key: key);

  @override
  _AboutPageState createState() => _AboutPageState();
}

class _AboutPageState extends State<AboutPage> {

  Widget groupMember({
    required String realName,
    required String nickName,
    required String workContent,
    String? realNameFontFamily,
    String? nickNameFontFamily,
    double? nickNameFontSize,
  }) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              nickName,
              style: TextStyle(
                color: Color.fromRGBO(48, 47, 48, 1.0),
                fontFamily: nickNameFontFamily ?? 'Vladimir',
                fontWeight: FontWeight.w300,
                fontSize: nickNameFontSize ?? 24.0,
              ),
            ),
            Text(
              '(',
              style: TextStyle(
                color: Color.fromRGBO(48, 47, 48, 1.0),
                fontFamily: 'NLXJT',
                fontWeight: FontWeight.w300,
                fontSize: 20.0,
              ),
            ),
            Text(
              realName,
              style: TextStyle(
                color: Color.fromRGBO(48, 47, 48, 1.0),
                fontFamily: realNameFontFamily ?? 'NLXJT',
                fontWeight: FontWeight.w300,
                fontSize: 20.0,
              ),
            ),
            Text(
              ')',
              style: TextStyle(
                color: Color.fromRGBO(48, 47, 48, 1.0),
                fontFamily: 'NLXJT',
                fontWeight: FontWeight.w300,
                fontSize: 20.0,
              ),
            ),
          ],
        ),
        Text(
          workContent,
          style: TextStyle(
            color: Color.fromRGBO(141, 141, 141, 1.0),
            fontFamily: 'Montserrat',
            fontWeight: FontWeight.w400,
            fontSize: 12,
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        height: MediaQuery.of(context).size.height / 1.25,
        child: Padding(
          padding: EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Flexible(
                flex: 6,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Flexible(
                      flex: 2,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          ShaderMask(
                            shaderCallback: (Rect bounds) => LinearGradient(
                              colors: [
                                Color(0xFF6CC6CB),
                                Color(0xFFEAE5C9),
                              ],
                            ).createShader(
                              Rect.fromLTWH(
                                0,
                                0,
                                bounds.width,
                                bounds.height,
                              ),
                            ),
                            child: Text(
                              'Easy Rent ',
                              style: TextStyle(
                                color: Color.fromARGB(255, 240, 235, 213),
                                fontFamily: 'Vladimir',
                                fontWeight: FontWeight.w600,
                                fontSize: 32.0,
                              ),
                            ),
                          ),
                          Text(
                            'A.K.A',
                            style: TextStyle(
                              color: Color.fromRGBO(48, 47, 48, 1.0),
                              fontFamily: 'Montserrat',
                              fontWeight: FontWeight.w500,
                              fontSize: 10.0,
                            ),
                          ),
                          Text(
                            '易租',
                            style: TextStyle(
                              color: Color.fromRGBO(48, 47, 48, 1.0),
                              fontFamily: 'Montserrat',
                              fontWeight: FontWeight.w500,
                              fontSize: 24.0,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Flexible(
                      flex: 1,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'VERSION',
                            style: TextStyle(
                              color: Color.fromRGBO(48, 47, 48, 1.0),
                              fontFamily: 'Montserrat',
                              fontWeight: FontWeight.w500,
                              fontSize: 14.0,
                            ),
                          ),
                          SizedBox(
                            width: MediaQuery.of(context).size.height / 48,
                          ),
                          Text(
                            '1.0.0',
                            style: TextStyle(
                              color: Color.fromRGBO(48, 47, 48, 1.0),
                              fontFamily: 'Montserrat',
                              fontWeight: FontWeight.w500,
                              fontSize: 14.0,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Flexible(
                      flex: 10,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          groupMember(
                            realName: '朱国建',
                            nickName: 'Vitale',
                            workContent: '测试/文档/封装',
                          ),
                          groupMember(
                            realName: '姚华为',
                            nickName: '桃花碧海',
                            nickNameFontFamily: 'NLXJT',
                            nickNameFontSize: 18,
                            workContent: '测试/前端/后端',
                          ),
                          groupMember(
                            realName: '周志国',
                            nickName: '一本书',
                            nickNameFontFamily: 'NLXJT',
                            nickNameFontSize: 18,
                            workContent: '测试/UI设计/文档',
                          ),
                          groupMember(
                            realName: '张杰',
                            nickName: 'Ares ',
                            workContent: '测试/全栈',
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Flexible(
                flex: 1,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text(
                          'Copyright',
                          style: TextStyle(
                            color: Color.fromRGBO(48, 47, 48, 1.0),
                            fontFamily: 'Montserrat',
                            fontWeight: FontWeight.w500,
                            fontSize: 12.0,
                          ),
                        ),
                        Icon(
                          Icons.copyright_outlined,
                          size: 12.0,
                        ),
                        Text(
                          'Ares',
                          style: TextStyle(
                            color: Color.fromRGBO(48, 47, 48, 1.0),
                            fontFamily: 'Montserrat',
                            fontWeight: FontWeight.w500,
                            fontSize: 12.0,
                          ),
                        ),
                        Text(
                          '2021',
                          style: TextStyle(
                            color: Color.fromRGBO(48, 47, 48, 1.0),
                            fontFamily: 'Montserrat',
                            fontWeight: FontWeight.w500,
                            fontSize: 12.0,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

import 'dart:ui';
import 'dart:typed_data';
import 'package:agency/model/post.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:image_picker_web/image_picker_web.dart';

class SubmitPage extends StatefulWidget {
  const SubmitPage({Key? key}) : super(key: key);

  @override
  _SubmitPageState createState() => _SubmitPageState();
}

class _SubmitPageState extends State<SubmitPage> {
  late RentPost rentPost;
  late HelpPost helpPost;
  List<Uint8List>? assets;

  Widget _actionButton(
    BuildContext context,
    Color color,
    String content,
    bool save,
  ) =>
      TextButton(
        onPressed: () => Navigator.of(context).pop(save),
        child: Text(
          content,
          style: TextStyle(
            color: color,
            fontFamily: 'SourceHanSansCN',
            fontWeight: FontWeight.w500,
            fontSize: 14,
            height: 1.5,
          ),
        ),
      );

  Future<bool> _onWillPop() async {
    return await showDialog(
      context: context,
      builder: (BuildContext context) => AlertDialog(
        // backgroundColor: Color.fromARGB(255, 247, 238, 213),
        content: Text('您确定要返回吗，所有已填写的信息都将丢失'),
        actions: <Widget>[
          _actionButton(context, Colors.black, '取消', false),
          _actionButton(context, Colors.red, '确定', true),
        ],
      ),
    );
  }

  Widget _formBase({required Widget child}) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: WillPopScope(
        onWillPop: _onWillPop,
        child: Stack(
          children: [
            Center(
              child: Container(
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage("assets/images/auth_bg.jpg"),
                    fit: BoxFit.fill,
                  ),
                ),
              ),
            ),
            Center(
              child: ClipRRect(
                borderRadius: BorderRadius.all(Radius.circular(10.0)),
                child: BackdropFilter(
                  filter: ImageFilter.blur(sigmaX: 10.0, sigmaY: 10.0),
                  child: Container(
                    width: size.width / 1.5,
                    height: size.height / 1.5,
                    decoration: BoxDecoration(
                        color: Colors.grey.shade200.withOpacity(0.5)),
                    child: Container(
                      margin: EdgeInsets.symmetric(
                        horizontal: 20,
                        vertical: 10,
                      ),
                      child: child,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _body() {
    switch (submitPageType) {
      case PostKind.Rent:
        return _formBase(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Flexible(
                          flex: 1,
                          child: Text('地址 :'),
                        ),
                        Flexible(
                          flex: 3,
                          child: FormBuilderTextField(
                            name: 'roomAddr',
                            cursorColor: Colors.black,
                            textAlign: TextAlign.center,
                            decoration: InputDecoration(
                              hintText: '填写房屋地址',
                              hintStyle: TextStyle(fontSize: 22),
                            ),
                            validator: FormBuilderValidators.compose([
                              FormBuilderValidators.required(
                                context,
                                errorText: '地址不能为空',
                              ),
                              FormBuilderValidators.minLength(context, 6,
                                  errorText: '地址不得少于6位'),
                              FormBuilderValidators.maxLength(context, 30,
                                  errorText: '地址不得多于30位')
                            ]),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Flexible(
                          flex: 1,
                          child: Text('面积 :'),
                        ),
                        Flexible(
                          flex: 3,
                          child: FormBuilderTextField(
                            name: 'roomArea',
                            cursorColor: Colors.black,
                            textAlign: TextAlign.center,
                            decoration: InputDecoration(
                              hintText: '填写房屋面积',
                              hintStyle: TextStyle(fontSize: 22),
                            ),
                            validator: FormBuilderValidators.compose([
                              FormBuilderValidators.required(
                                context,
                                errorText: '面积不能为空',
                              ),
                              FormBuilderValidators.numeric(
                                context,
                                errorText: '面积必须为数字',
                              ),
                              FormBuilderValidators.max(
                                context,
                                5000,
                                errorText: '面积不得大于5000m²',
                              ),
                              FormBuilderValidators.min(
                                context,
                                0,
                                errorText: '面积不得小于0',
                              ),
                            ]),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Flexible(
                          flex: 1,
                          child: Text('户型: '),
                        ),
                        Flexible(
                          flex: 3,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Flexible(
                                child: FormBuilderDropdown(
                                  name: 'bedrooms',
                                  items: [],
                                ),
                              ),
                              Flexible(
                                flex: 1,
                                child: Text('室'),
                              ),
                              Flexible(
                                child: FormBuilderDropdown(
                                  name: 'livingrooms',
                                  items: [],
                                ),
                              ),
                              Flexible(
                                flex: 1,
                                child: Text('厅'),
                              ),
                              Flexible(
                                child: FormBuilderDropdown(
                                  name: 'bathrooms',
                                  items: [],
                                ),
                              ),
                              Flexible(
                                flex: 1,
                                child: Text('卫'),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Flexible(
                          flex: 1,
                          child: Text('朝向'),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Flexible(
                          flex: 1,
                          child: Text('楼层'),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        );
      case PostKind.Help:
        return _formBase(
          child: Container(),
        );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('易租中介中心'),
        backgroundColor: Color(0xFFfb966e),
      ),
      body: _body(),
    );
  }
}

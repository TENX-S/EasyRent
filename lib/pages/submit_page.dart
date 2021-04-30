import 'package:flutter/material.dart';
import 'package:easy_rent/model/post.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class SubmitPage extends StatefulWidget {
  @override
  _SubmitPageState createState() => _SubmitPageState();
}

class _SubmitPageState extends State<SubmitPage> {
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

  Future<bool> _onWillPop() {
    return showDialog(
      context: context,
      builder: (BuildContext context) =>
          AlertDialog(
            backgroundColor: Color.fromARGB(255, 247, 238, 213),
            content: Text('您确定要返回吗，所有已填写的信息都将丢失'),
            actions: <Widget>[
              _actionButton(context, Colors.black, '取消', false),
              _actionButton(context, Colors.red, '确定', true),
            ],
          ) ??
          false,
    );
  }

  Widget _formBase({@required BuildContext context, @required Widget child}) {
    final size = MediaQuery.of(context).size;
    return WillPopScope(
      onWillPop: _onWillPop,
      child: Scaffold(
        appBar: AppBar(
          title: Text('发布帖子'),
          leading: IconButton(
            onPressed: () => Navigator.pop(context),
            icon: FaIcon(FontAwesomeIcons.chevronLeft),
          ),
          backgroundColor: Color.fromARGB(255, 251, 150, 110),
        ),
        body: Container(
          width: size.width,
          height: size.height,
          color: Color.fromARGB(255, 247, 238, 213),
          child: child,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    switch (submitPageType) {
      case PostKind.Rent:
        return _formBase(
          context: context,
          child: Container(),
        );
      case PostKind.Help:
        return _formBase(
          context: context,
          child: Container(),
        );
    }
  }
}

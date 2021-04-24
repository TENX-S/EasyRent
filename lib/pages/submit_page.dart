import 'package:flutter/material.dart';
import 'package:easy_rent/model/post.dart';

class SubmitPage extends StatefulWidget {
  @override
  _SubmitPageState createState() => _SubmitPageState();
}

class _SubmitPageState extends State<SubmitPage> {

  @override
  Widget build(BuildContext context) {

    switch (submitPageType) {
      case PostKind.Rent:
        return Container(

        );
        break;
      case PostKind.Help:
        return Container(

        );
        break;
    }


  }
}

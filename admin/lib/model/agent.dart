import 'package:flutter/material.dart';

class Agent {
  String? corp;
  String? corpId;
  String? comRegdAddr;
  String? contact;
  String? name;
  String? password;

  Agent({
    this.corp,
    this.corpId,
    this.comRegdAddr,
    this.contact,
    this.name,
    this.password,
  });

  Widget buildPanel({required void Function()? onVerified}) {
    return Padding(
      padding: EdgeInsets.all(10),
      child: Card(
        elevation: 0,
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(vertical: 5),
              child: Text('法人代表: $corp'),
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 5),
              child: Text('注册身份证号: $corpId'),
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 5),
              child: Text('公司注册地址: $comRegdAddr'),
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 5),
              child: Text('联系方式: $contact'),
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 5),
              child: Text('注册名: $name'),
            ),
            Padding(
              padding: EdgeInsets.only(left: 0, top: 0, right: 5, bottom: 5),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  MaterialButton(
                    onPressed: onVerified,
                    shape: StadiumBorder(),
                    color: Color(0xFFfb966e),
                    elevation: 0,
                    child: Text('认证通过'),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

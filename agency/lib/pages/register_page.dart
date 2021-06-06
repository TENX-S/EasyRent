import 'dart:ui';
import 'package:agency/grpc/auth.pb.dart';
import 'package:agency/model/agent.dart';
import 'package:agency/model/client.dart';
import 'package:agency/utils/pending.dart';
import 'package:agency/utils/tip.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  var agent = Agent();
  final _formKey = GlobalKey<FormBuilderState>();
  final authClient = AuthClient(serverAddr: '1.116.216.141', serverPort: 8082);

  void _onDone() async {
    bool? validate = _formKey.currentState?.saveAndValidate();
    if (validate!) {
      final value = _formKey.currentState?.value;
      if (value!['password'] != value['password']) {
        showTip(msg: '两次输入的密码不一致', gravity: ToastGravity.BOTTOM);
        return;
      }
      agent
        ..corp = value['corp']
        ..corpId = value['corpId']
        ..comRegdAddr = value['comRegdAddr']
        ..contact = value['contact']
        ..name = value['name']
        ..password = value['password'];

      showPendingDialog(context);
      final resp = await authClient.onRegister(agent);
      Navigator.pop(context);
      if (!resp.success) {
        switch (resp.error) {
          case AuthError.DUPLICATED_NAME:
            showTip(msg: '用户名不存在', gravity: ToastGravity.TOP);
            return;
          case AuthError.UNKNOWN:
            showTip(msg: '未知的错误', gravity: ToastGravity.TOP);
            return;
        }
      }
      Navigator.pop(context);
    }

    return;
  }

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

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text('易租中介中心'),
        backgroundColor: Color(0xFFfb966e),
      ),
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
                    width: size.width / 3.5,
                    height: size.height / 1.5,
                    decoration: BoxDecoration(
                        color: Colors.grey.shade200.withOpacity(0.5)),
                    child: FormBuilder(
                      key: _formKey,
                      child: Container(
                        margin: EdgeInsets.symmetric(horizontal: 20),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            FormBuilderTextField(
                              cursorColor: Colors.black,
                              name: 'corp',
                              decoration: InputDecoration(
                                hintText: '法人代表',
                                hintStyle: TextStyle(fontSize: 19),
                              ),
                              validator: FormBuilderValidators.compose([
                                FormBuilderValidators.required(
                                  context,
                                  errorText: '不能为空',
                                ),
                                FormBuilderValidators.max(
                                  context,
                                  8,
                                  errorText: '2至8个字符',
                                ),
                                FormBuilderValidators.min(
                                  context,
                                  2,
                                  errorText: '2至8个字符',
                                ),
                              ]),
                            ),
                            FormBuilderTextField(
                              cursorColor: Colors.black,
                              name: 'corpId',
                              decoration: InputDecoration(
                                hintText: '法人身份证号',
                                hintStyle: TextStyle(fontSize: 19),
                              ),
                              validator: FormBuilderValidators.compose([
                                FormBuilderValidators.required(
                                  context,
                                  errorText: '不能为空',
                                ),
                                FormBuilderValidators.match(context,
                                    r'^([1-6][1-9]|50)\d{4}(18|19|20)\d{2}((0[1-9])|10|11|12)(([0-2][1-9])|10|20|30|31)\d{3}[0-9Xx]$',
                                    errorText: '请输入正确的身份证号'),
                              ]),
                            ),
                            FormBuilderTextField(
                              cursorColor: Colors.black,
                              name: 'comRegdAddr',
                              decoration: InputDecoration(
                                hintText: '机构注册地址',
                                hintStyle: TextStyle(fontSize: 19),
                              ),
                              validator: FormBuilderValidators.compose([
                                FormBuilderValidators.required(
                                  context,
                                  errorText: '不能为空',
                                ),
                                FormBuilderValidators.max(
                                  context,
                                  25,
                                  errorText: '5至25个字符',
                                ),
                                FormBuilderValidators.min(
                                  context,
                                  5,
                                  errorText: '5至25个字符',
                                ),
                              ]),
                            ),
                            FormBuilderTextField(
                              cursorColor: Colors.black,
                              name: 'contact',
                              decoration: InputDecoration(
                                hintText: '联系方式（邮箱）',
                                hintStyle: TextStyle(fontSize: 19),
                              ),
                              validator: FormBuilderValidators.email(
                                context,
                                errorText: '邮箱格式不正确',
                              ),
                            ),
                            FormBuilderTextField(
                              cursorColor: Colors.black,
                              name: 'name',
                              decoration: InputDecoration(
                                hintText: '用户名',
                                hintStyle: TextStyle(fontSize: 19),
                              ),
                              validator: FormBuilderValidators.compose([
                                FormBuilderValidators.required(
                                  context,
                                  errorText: '不能为空',
                                ),
                                FormBuilderValidators.max(
                                  context,
                                  16,
                                  errorText: '2至16个字符',
                                ),
                                FormBuilderValidators.min(
                                  context,
                                  2,
                                  errorText: '2至16个字符',
                                ),
                              ]),
                            ),
                            FormBuilderTextField(
                              cursorColor: Colors.black,
                              name: 'password',
                              decoration: InputDecoration(
                                hintText: '密码',
                                hintStyle: TextStyle(fontSize: 19),
                              ),
                              autovalidateMode: AutovalidateMode.onUserInteraction,
                              validator: FormBuilderValidators.compose([
                                FormBuilderValidators.required(
                                  context,
                                  errorText: '不能为空',
                                ),
                                // FormBuilderValidators.max(
                                //   context,
                                //   16,
                                //   errorText: '6至16个字符',
                                // ),
                                // FormBuilderValidators.min(
                                //   context,
                                //   6,
                                //   errorText: '6至16个字符',
                                // ),
                              ]),
                            ),
                            FormBuilderTextField(
                              cursorColor: Colors.black,
                              name: 'rePassword',
                              decoration: InputDecoration(
                                hintText: '请重复输入密码',
                                hintStyle: TextStyle(fontSize: 19),
                              ),
                              autovalidateMode: AutovalidateMode.onUserInteraction,
                              validator: FormBuilderValidators.compose([
                                FormBuilderValidators.required(
                                  context,
                                  errorText: '不能为空',
                                ),
                                // FormBuilderValidators.max(
                                //   context,
                                //   16,
                                //   errorText: '6至16个字符',
                                // ),
                                // FormBuilderValidators.min(
                                //   context,
                                //   6,
                                //   errorText: '6至16个字符',
                                // ),
                              ]),
                            ),
                            MaterialButton(
                              onPressed: _onDone,
                              child: Text('完 成'),
                              shape: StadiumBorder(),
                              color: Color(0xFFfb966e),
                              elevation: 0,
                            ),
                          ],
                        ),
                      ),
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
}

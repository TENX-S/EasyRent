import 'dart:ui';
import 'dart:typed_data';
import 'package:agency/model/post.dart';
import 'package:agency/model/client.dart';
import 'package:agency/utils/pending.dart';
import 'package:agency/utils/tip.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:image_picker_web/image_picker_web.dart';
import 'package:uuid/uuid.dart';

class SubmitPage extends StatefulWidget {
  const SubmitPage({Key? key}) : super(key: key);

  @override
  _SubmitPageState createState() => _SubmitPageState();
}

class _SubmitPageState extends State<SubmitPage> {
  var rentPost = RentPost('', '', '', '');
  var helpPost = HelpPost('', '', '', '');
  List<Uint8List> assets = [];
  final _formKey = GlobalKey<FormBuilderState>();
  final _posterClient =
      PosterClient(serverAddr: '1.116.216.141', serverPort: 8082);

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

  Future<void> _pickMultiImages() async {
    var images =
        await ImagePickerWeb.getMultiImages(outputType: ImageType.bytes);
    setState(() {
      assets.clear();
      assets.addAll(images! as List<Uint8List>);
    });
  }

  List<Widget> _pictureView() {
    if (assets.isEmpty) {
      return [Container()];
    } else {
      return assets
          .map(
            (p) => Padding(
              padding: EdgeInsets.all(5),
              child: Container(
                width: 150,
                height: 150,
                child: Image.memory(
                  p,
                  fit: BoxFit.fill,
                ),
              ),
            ),
          )
          .toList();
    }
  }

  Widget _formBase({
    required BuildContext context,
    required Widget child,
  }) {
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
                    width: size.width / 1.2,
                    decoration: BoxDecoration(
                        color: Colors.grey.shade200.withOpacity(0.5)),
                    child: FormBuilder(
                      key: _formKey,
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
          context: context,
          child: Row(
            children: [
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: EdgeInsets.fromLTRB(15, 5, 15, 20),
                      child: Column(
                        children: [
                          Row(
                            children: [
                              Text(
                                '基本信息',
                                style: TextStyle(fontSize: 15),
                              ),
                            ],
                          ),
                          Divider(
                            thickness: 1,
                          ),
                          Row(
                            children: [
                              Expanded(
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      '地址',
                                      style: TextStyle(fontSize: 11),
                                    ),
                                    FormBuilderTextField(
                                      cursorColor: Colors.black,
                                      textAlign: TextAlign.center,
                                      autovalidateMode:
                                      AutovalidateMode.onUserInteraction,
                                      name: 'roomAddr',
                                      maxLines: 2,
                                      decoration: InputDecoration(
                                        hintText: '填写房屋住址',
                                        hintStyle: TextStyle(fontSize: 19),
                                        border: InputBorder.none,
                                        errorBorder: InputBorder.none,
                                        focusedBorder: InputBorder.none,
                                        enabledBorder: InputBorder.none,
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
                                  ],
                                ),
                              ),
                              Container(
                                height: 60,
                                child: VerticalDivider(
                                  thickness: 1,
                                ),
                              ),
                              Expanded(
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      '面积',
                                      style: TextStyle(fontSize: 11),
                                    ),
                                    FormBuilderTextField(
                                      cursorColor: Colors.black,
                                      textAlign: TextAlign.center,
                                      autovalidateMode:
                                      AutovalidateMode.onUserInteraction,
                                      name: 'roomArea',
                                      keyboardType: TextInputType.number,
                                      textInputAction: TextInputAction.next,
                                      decoration: InputDecoration(
                                        hintText: '请填写',
                                        hintStyle: TextStyle(fontSize: 19),
                                        border: InputBorder.none,
                                        errorBorder: InputBorder.none,
                                        focusedBorder: InputBorder.none,
                                        enabledBorder: InputBorder.none,
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
                                  ],
                                ),
                              ),
                            ],
                          ),

                          // Divider(
                          //   thickness: 1,
                          // ),

                          Divider(
                            thickness: 1,
                          ),
                          Row(
                            children: [
                              Expanded(
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                      children: [
                                        Expanded(
                                          child: FormBuilderTextField(
                                            name: 'bedrooms',
                                            cursorColor: Colors.black,
                                            textAlign: TextAlign.center,
                                            autovalidateMode:
                                            AutovalidateMode.onUserInteraction,
                                            decoration: InputDecoration(
                                              hintText: '室',
                                              hintStyle: TextStyle(fontSize: 19),
                                              border: InputBorder.none,
                                              errorBorder: InputBorder.none,
                                              focusedBorder: InputBorder.none,
                                              enabledBorder: InputBorder.none,
                                            ),
                                            validator: FormBuilderValidators.compose([
                                              FormBuilderValidators.required(
                                                context,
                                                errorText: '不能为空',
                                              ),
                                              FormBuilderValidators.numeric(
                                                context,
                                                errorText: '须为数字',
                                              ),
                                              FormBuilderValidators.max(
                                                context,
                                                15,
                                                errorText: '不大于15',
                                              ),
                                              FormBuilderValidators.min(
                                                context,
                                                1,
                                                errorText: '不小于1',
                                              ),
                                            ]),
                                          ),
                                        ),
                                        Expanded(
                                          child: FormBuilderTextField(
                                            name: 'livingrooms',
                                            cursorColor: Colors.black,
                                            textAlign: TextAlign.center,
                                            autovalidateMode:
                                            AutovalidateMode.onUserInteraction,
                                            decoration: InputDecoration(
                                              hintText: '厅',
                                              hintStyle: TextStyle(fontSize: 19),
                                              border: InputBorder.none,
                                              errorBorder: InputBorder.none,
                                              focusedBorder: InputBorder.none,
                                              enabledBorder: InputBorder.none,
                                            ),
                                            validator: FormBuilderValidators.compose([
                                              FormBuilderValidators.required(
                                                context,
                                                errorText: '不能为空',
                                              ),
                                              FormBuilderValidators.numeric(
                                                context,
                                                errorText: '须为数字',
                                              ),
                                              FormBuilderValidators.max(
                                                context,
                                                15,
                                                errorText: '不大于15',
                                              ),
                                              FormBuilderValidators.min(
                                                context,
                                                0,
                                                errorText: '不小于0',
                                              ),
                                            ]),
                                          ),
                                        ),
                                        Expanded(
                                          child: FormBuilderTextField(
                                            name: 'bathrooms',
                                            cursorColor: Colors.black,
                                            textAlign: TextAlign.center,
                                            autovalidateMode:
                                            AutovalidateMode.onUserInteraction,
                                            decoration: InputDecoration(
                                              hintText: '卫',
                                              hintStyle: TextStyle(fontSize: 19),
                                              border: InputBorder.none,
                                              errorBorder: InputBorder.none,
                                              focusedBorder: InputBorder.none,
                                              enabledBorder: InputBorder.none,
                                            ),
                                            validator: FormBuilderValidators.compose([
                                              FormBuilderValidators.required(
                                                context,
                                                errorText: '不能为空',
                                              ),
                                              FormBuilderValidators.numeric(
                                                context,
                                                errorText: '须为数字',
                                              ),
                                              FormBuilderValidators.max(
                                                context,
                                                15,
                                                errorText: '不大于15',
                                              ),
                                              FormBuilderValidators.min(
                                                context,
                                                0,
                                                errorText: '不小于0',
                                              ),
                                            ]),
                                          ),
                                        ),
                                      ],
                                    )
                                  ],
                                ),
                              ),
                              Container(
                                height: 60,
                                child: VerticalDivider(
                                  thickness: 1,
                                ),
                              ),
                              Expanded(
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        Expanded(
                                          child: FormBuilderDropdown(
                                            name: 'roomOrientation',
                                            autovalidateMode:
                                            AutovalidateMode.onUserInteraction,
                                            decoration: InputDecoration(
                                              hintText: '朝向',
                                              hintStyle: TextStyle(fontSize: 19),
                                              border: InputBorder.none,
                                              errorBorder: InputBorder.none,
                                              focusedBorder: InputBorder.none,
                                              enabledBorder: InputBorder.none,
                                            ),
                                            items: [
                                              '东',
                                              '南',
                                              '西',
                                              '北',
                                              '东南',
                                              '东北',
                                              '西南',
                                              '西北',
                                            ]
                                                .map((e) => DropdownMenuItem(
                                              value: e,
                                              child: Text(
                                                e,
                                                style:
                                                TextStyle(fontSize: 19),
                                              ),
                                            ))
                                                .toList(),
                                          ),
                                        )
                                      ],
                                    )
                                  ],
                                ),
                              ),
                              Container(
                                height: 60,
                                child: VerticalDivider(
                                  thickness: 1,
                                ),
                              ),
                              Expanded(
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        Expanded(
                                          child: FormBuilderTextField(
                                            name: 'roomFloor',
                                            cursorColor: Colors.black,
                                            textAlign: TextAlign.center,
                                            autovalidateMode:
                                            AutovalidateMode.onUserInteraction,
                                            decoration: InputDecoration(
                                              hintText: '楼层',
                                              hintStyle: TextStyle(fontSize: 19),
                                              border: InputBorder.none,
                                              errorBorder: InputBorder.none,
                                              focusedBorder: InputBorder.none,
                                              enabledBorder: InputBorder.none,
                                            ),
                                            validator: FormBuilderValidators.compose([
                                              FormBuilderValidators.required(
                                                context,
                                                errorText: '不能为空',
                                              ),
                                              FormBuilderValidators.numeric(
                                                context,
                                                errorText: '须为数字',
                                              ),
                                              FormBuilderValidators.max(
                                                context,
                                                15,
                                                errorText: '不大于99',
                                              ),
                                              FormBuilderValidators.min(
                                                context,
                                                0,
                                                errorText: '不小于0',
                                              ),
                                            ]),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.fromLTRB(15, 5, 15, 20),
                      child: Column(
                        children: [
                          Row(
                            children: [
                              Text(
                                '租金详情',
                                style: TextStyle(fontSize: 15),
                              ),
                            ],
                          ),
                          Divider(
                            thickness: 1,
                          ),
                          Row(
                            children: [
                              Expanded(
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      '月租金',
                                      style: TextStyle(fontSize: 11),
                                    ),
                                    FormBuilderTextField(
                                      cursorColor: Colors.black,
                                      textAlign: TextAlign.center,
                                      autovalidateMode:
                                      AutovalidateMode.onUserInteraction,
                                      name: 'price',
                                      keyboardType: TextInputType.numberWithOptions(
                                          signed: false),
                                      textInputAction: TextInputAction.next,
                                      decoration: InputDecoration(
                                        hintText: '请填写',
                                        hintStyle: TextStyle(fontSize: 19),
                                        border: InputBorder.none,
                                        errorBorder: InputBorder.none,
                                        focusedBorder: InputBorder.none,
                                        enabledBorder: InputBorder.none,
                                      ),
                                      onChanged: (val) {
                                        setState(() {
                                          _formKey.currentState?.fields['monthlyRent']
                                              ?.validate();
                                        });
                                      },
                                      validator: FormBuilderValidators.compose([
                                        FormBuilderValidators.required(
                                          context,
                                          errorText: '租金不能为空',
                                        ),
                                        FormBuilderValidators.numeric(
                                          context,
                                          errorText: '租金必须为数字',
                                        ),
                                        FormBuilderValidators.max(
                                          context,
                                          400000,
                                          errorText: '租金不得大于400000',
                                        ),
                                        FormBuilderValidators.min(
                                          context,
                                          100,
                                          errorText: '租金不得小于100',
                                        ),
                                      ]),
                                    ),
                                  ],
                                ),
                              ),
                              Container(
                                height: 60,
                                child: VerticalDivider(
                                  thickness: 1,
                                ),
                              ),
                              Expanded(
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      '支付限制',
                                      style: TextStyle(fontSize: 11),
                                    ),
                                    FormBuilderChoiceChip(
                                      name: 'restriction',
                                      alignment: WrapAlignment.center,
                                      selectedColor:
                                      Color.fromARGB(255, 251, 150, 110),
                                      backgroundColor: Colors.grey.withOpacity(0.4),
                                      pressElevation: 0,
                                      autovalidateMode:
                                      AutovalidateMode.onUserInteraction,
                                      decoration: InputDecoration(
                                        border: InputBorder.none,
                                        errorBorder: InputBorder.none,
                                        focusedBorder: InputBorder.none,
                                        enabledBorder: InputBorder.none,
                                      ),
                                      validator: FormBuilderValidators.required(
                                        context,
                                        errorText: '支付限制不能为空',
                                      ),
                                      options: [
                                        FormBuilderFieldOption(
                                          value: '押一付一',
                                          child: Text('押一付一'),
                                        ),
                                        FormBuilderFieldOption(
                                          value: '押一付三',
                                          child: Text('押一付三'),
                                        ),
                                        FormBuilderFieldOption(
                                          value: '半年付',
                                          child: Text('半年付'),
                                        ),
                                        FormBuilderFieldOption(
                                          value: '年付',
                                          child: Text('年付'),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.fromLTRB(15, 5, 15, 20),
                      child: Column(
                        children: [
                          Row(
                            children: [
                              Text(
                                '联系方式',
                                style: TextStyle(fontSize: 15),
                              ),
                            ],
                          ),
                          Divider(
                            thickness: 1,
                          ),
                          Row(
                            children: [
                              Expanded(
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    FormBuilderTextField(
                                      cursorColor: Colors.black,
                                      textAlign: TextAlign.center,
                                      autovalidateMode:
                                      AutovalidateMode.onUserInteraction,
                                      name: 'name',
                                      decoration: InputDecoration(
                                        hintText: '请填写姓名',
                                        hintStyle: TextStyle(fontSize: 19),
                                        border: InputBorder.none,
                                        errorBorder: InputBorder.none,
                                        focusedBorder: InputBorder.none,
                                        enabledBorder: InputBorder.none,
                                      ),
                                      validator: FormBuilderValidators.required(
                                        context,
                                        errorText: '姓名不能为空',
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Container(
                                height: 60,
                                child: VerticalDivider(
                                  thickness: 1,
                                ),
                              ),
                              Expanded(
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      '手机号',
                                      style: TextStyle(fontSize: 11),
                                    ),
                                    FormBuilderTextField(
                                      cursorColor: Colors.black,
                                      textAlign: TextAlign.center,
                                      autovalidateMode:
                                      AutovalidateMode.onUserInteraction,
                                      name: 'phone',
                                      decoration: InputDecoration(
                                        hintText: '请填写',
                                        hintStyle: TextStyle(fontSize: 19),
                                        border: InputBorder.none,
                                        errorBorder: InputBorder.none,
                                        focusedBorder: InputBorder.none,
                                        enabledBorder: InputBorder.none,
                                      ),
                                      keyboardType: TextInputType.phone,
                                      validator: FormBuilderValidators.compose([
                                        FormBuilderValidators.required(
                                          context,
                                          errorText: '手机号不能为空',
                                        ),
                                        FormBuilderValidators.match(
                                          context,
                                          r'^((13[0-9])|(14[0-9])|(15[0-9])|(16[0-9])|(17[0-9])|(18[0-9])|(19[0-9]))\d{8}$',
                                          errorText: '手机号的格式不正确',
                                        ),
                                      ]),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.fromLTRB(15, 5, 15, 20),
                      child: Column(
                        children: [
                          Row(
                            children: [
                              Text(
                                '其他说明',
                                style: TextStyle(fontSize: 15),
                              ),
                            ],
                          ),
                          Divider(
                            thickness: 1,
                          ),
                          Container(
                            height: 100,
                            child: FormBuilderTextField(
                              cursorColor: Colors.black,
                              autovalidateMode: AutovalidateMode.onUserInteraction,
                              name: 'description',
                              maxLines: 15,
                              decoration: InputDecoration(
                                hintText: '补充说明，例：房子临近地铁和学校',
                                hintStyle: TextStyle(fontSize: 19),
                                border: InputBorder.none,
                                errorBorder: InputBorder.none,
                                focusedBorder: InputBorder.none,
                                enabledBorder: InputBorder.none,
                              ),
                              validator: FormBuilderValidators.compose([
                                FormBuilderValidators.required(
                                  context,
                                  errorText: '补充说明不得为空',
                                ),
                                FormBuilderValidators.maxLength(
                                  context,
                                  80,
                                  errorText: '补充说明不得多于80个字符',
                                ),
                              ]),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Padding(
                  padding: EdgeInsets.fromLTRB(15, 5, 15, 20),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Text(
                            '附件',
                            style: TextStyle(fontSize: 15),
                          ),
                        ],
                      ),
                      Divider(
                        thickness: 1,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          ElevatedButton(
                            onPressed: _pickMultiImages,
                            child: Text('选择图片'),
                          ),
                          ElevatedButton(
                            onPressed: () async {
                              bool? validate = _formKey.currentState?.saveAndValidate();
                              if (assets.isEmpty) {
                                showTip(msg: '至少拍摄一张图片', gravity: ToastGravity.CENTER);
                                return;
                              }
                              if (validate!) {
                                showPendingDialog(context);
                                final value = _formKey.currentState?.value;
                                rentPost
                                  ..uuid = Uuid().v4()
                                  ..name = value!['name']
                                  ..phone = value['phone']
                                  ..roomAddr = value['roomAddr']
                                  ..roomArea = int.parse(value['roomArea'])
                                  ..roomType = "${value['bedrooms']}室${value['livingrooms']}厅${value['bathrooms']}卫"
                                  ..roomOrientation = value['roomOrientation']
                                  ..roomFloor = int.parse(value['roomFloor'])
                                  ..description = value['description']
                                  ..price = int.parse(value['price'])
                                  ..restriction = value['restriction']
                                  ..releaseTime = DateTime.now().toString().substring(0, 19)
                                  ..pictures = assets;

                                final result = await _posterClient.onRent(rentPost);
                                Navigator.pop(context);
                                if (result.success) {
                                  showTip(msg: '提交成功', gravity: ToastGravity.CENTER);
                                  Navigator.pop(context);
                                } else {
                                  showTip(msg: '提交失败', gravity: ToastGravity.CENTER);
                                }
                              }
                              return;
                            },
                            child: Text('提 交'),
                          ),
                        ],
                      ),
                      SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        physics: BouncingScrollPhysics(),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: _pictureView(),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        );
      case PostKind.Help:
        return _formBase(
          context: context,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: EdgeInsets.fromLTRB(15, 5, 15, 20),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Text(
                          '基本信息',
                          style: TextStyle(fontSize: 15),
                        ),
                      ],
                    ),
                    Divider(
                      thickness: 1,
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                '地址',
                                style: TextStyle(fontSize: 11),
                              ),
                              FormBuilderTextField(
                                cursorColor: Colors.black,
                                textAlign: TextAlign.center,
                                autovalidateMode:
                                    AutovalidateMode.onUserInteraction,
                                name: 'expectedAddr',
                                maxLines: 2,
                                decoration: InputDecoration(
                                  hintText: '您期望的住址',
                                  hintStyle: TextStyle(fontSize: 19),
                                  border: InputBorder.none,
                                  errorBorder: InputBorder.none,
                                  focusedBorder: InputBorder.none,
                                  enabledBorder: InputBorder.none,
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
                            ],
                          ),
                        ),
                        Container(
                          height: 60,
                          child: VerticalDivider(
                            thickness: 1,
                          ),
                        ),
                        Expanded(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                '月租金',
                                style: TextStyle(fontSize: 11),
                              ),
                              FormBuilderTextField(
                                cursorColor: Colors.black,
                                textAlign: TextAlign.center,
                                autovalidateMode:
                                    AutovalidateMode.onUserInteraction,
                                name: 'expectedPrice',
                                keyboardType: TextInputType.numberWithOptions(
                                    signed: false),
                                textInputAction: TextInputAction.next,
                                decoration: InputDecoration(
                                  hintText: '您期望的月租金',
                                  hintStyle: TextStyle(fontSize: 19),
                                  border: InputBorder.none,
                                  errorBorder: InputBorder.none,
                                  focusedBorder: InputBorder.none,
                                  enabledBorder: InputBorder.none,
                                ),
                                validator: FormBuilderValidators.compose([
                                  FormBuilderValidators.required(
                                    context,
                                    errorText: '租金不能为空',
                                  ),
                                  FormBuilderValidators.numeric(
                                    context,
                                    errorText: '租金必须为数字',
                                  ),
                                  FormBuilderValidators.max(
                                    context,
                                    400000,
                                    errorText: '租金不得大于400000',
                                  ),
                                  FormBuilderValidators.min(
                                    context,
                                    100,
                                    errorText: '租金不得小于100',
                                  ),
                                ]),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(15, 5, 15, 20),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Text(
                          '需求说明',
                          style: TextStyle(fontSize: 15),
                        ),
                      ],
                    ),
                    Divider(
                      thickness: 1,
                    ),
                    Container(
                      height: 150,
                      child: FormBuilderTextField(
                        cursorColor: Colors.black,
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        name: 'demands',
                        maxLines: 15,
                        decoration: InputDecoration(
                          hintText: '填写需求，例：优先考虑南北通透，临近地铁',
                          hintStyle: TextStyle(fontSize: 19),
                          border: InputBorder.none,
                          errorBorder: InputBorder.none,
                          focusedBorder: InputBorder.none,
                          enabledBorder: InputBorder.none,
                        ),
                        validator: FormBuilderValidators.compose([
                          FormBuilderValidators.required(
                            context,
                            errorText: '需求不能为空',
                          ),
                          FormBuilderValidators.maxLength(
                            context,
                            80,
                            errorText: '需求不得多于80个字符',
                          ),
                        ]),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: 50,
                  vertical: 5,
                ),
                child: ElevatedButton(
                  onPressed: () async {
                    bool? validate = _formKey.currentState?.saveAndValidate();
                    if (validate!) {
                      showPendingDialog(context);
                      final value = _formKey.currentState?.value;
                      helpPost
                        ..uuid = Uuid().v4()
                        ..name = value!['name']
                        ..phone = value['phone']
                        ..expectedAddr = value['expectedAddr']
                        ..expectedPrice = int.parse(value['expectedPrice'])
                        ..demands = value['demands'];

                      final result = await _posterClient.onHelp(helpPost);
                      Navigator.pop(context);
                      if (result.success) {
                        showTip(msg: '提交成功', gravity: ToastGravity.CENTER);
                        Navigator.pop(context);
                      } else {
                        showTip(msg: '提交失败', gravity: ToastGravity.CENTER);
                      }
                    }
                    return;
                  },
                  child: Text('提 交'),
                ),
              ),
            ],
          ),
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

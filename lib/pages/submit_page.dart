import 'dart:ui';
import 'package:easy_rent/utils/pending.dart';
import 'package:easy_rent/utils/tip.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:easy_rent/model/post.dart';
import 'package:easy_rent/model/client.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';

extension RangeExtension on int {
  List<int> to(int maxInclusive) =>
      [for (int i = this; i <= maxInclusive; i++) i];
}

class SubmitPage extends StatefulWidget {
  @override
  _SubmitPageState createState() => _SubmitPageState();
}

class _SubmitPageState extends State<SubmitPage> {
  late RentPost rentPost;
  Map<int, String> _roomType = {1: '', 2: '', 3: ''};
  List<String> _orientations = [
    '东',
    '南',
    '西',
    '北',
    '东南',
    '东北',
    '西南',
    '西北',
  ];
  late HelpPost helpPost;
  final _formKey = GlobalKey<FormBuilderState>();
  final _posterClient = PosterClient();
  bool _formChanged = false;

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

  Widget _formBase({
    required BuildContext context,
    required Widget child,
  }) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        title: Text('发布帖子'),
        leading: IconButton(
          onPressed: () => _formChanged
              ? _onWillPop()
                  .then((value) => value ? Navigator.pop(context) : null)
              : Navigator.pop(context),
          icon: FaIcon(FontAwesomeIcons.chevronLeft),
        ),
        backgroundColor: Color.fromARGB(255, 251, 150, 110),
      ),
      body: SingleChildScrollView(
        child: Container(
          width: size.width,
          color: Colors.white30,
          child: FormBuilder(
            key: _formKey,
            child: child,
            onChanged: () => setState(() => _formChanged = true),
          ),
        ),
      ),
    );
  }

  Widget _bottomSheetBase(
      {required Widget child, required void Function()? onDone}) {
    return Stack(
      children: [
        child,
        Positioned(
          top: 10,
          left: 10,
          right: 10,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              MaterialButton(
                onPressed: () => Navigator.pop(context),
                child: Text('取消'),
              ),
              MaterialButton(
                onPressed: onDone,
                child: Text('确定'),
              ),
            ],
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    switch (submitPageType) {
      case PostKind.Rent:
        rentPost = RentPost('', '', '');
        return _formBase(
          context: context,
          child: Column(
            children: [
              Container(
                height: 10,
                color: Colors.grey.withOpacity(0.09),
              ),
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
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          '地址',
                          style: TextStyle(fontSize: 11),
                        ),
                        FormBuilderTextField(
                          cursorColor: Colors.black,
                          textAlign: TextAlign.center,
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          name: 'roomAddr',
                          maxLines: 2,
                          decoration: InputDecoration(
                            hintText: '填写房屋地址',
                            hintStyle: TextStyle(fontSize: 19),
                            // border: InputBorder.none,
                            // errorBorder: InputBorder.none,
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
                    Divider(
                      thickness: 1,
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          '面积',
                          style: TextStyle(fontSize: 11),
                        ),
                        FormBuilderTextField(
                          cursorColor: Colors.black,
                          textAlign: TextAlign.center,
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          name: 'roomArea',
                          keyboardType:
                              TextInputType.numberWithOptions(signed: false),
                          textInputAction: TextInputAction.next,
                          decoration: InputDecoration(
                            hintText: '请填写',
                            hintStyle: TextStyle(fontSize: 19),
                            // border: InputBorder.none,
                            // errorBorder: InputBorder.none,
                            focusedBorder: InputBorder.none,
                            enabledBorder: InputBorder.none,
                          ),
                          onChanged: (val) {
                            setState(() {
                              _formKey.currentState?.fields['roomArea']
                                  ?.validate();
                            });
                          },
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
                                '厅室',
                                style: TextStyle(fontSize: 11),
                              ),
                              Padding(
                                padding: EdgeInsets.only(top: 13),
                                child: GestureDetector(
                                  child: Text(
                                    '请选择',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      fontSize: 19,
                                      color: Colors.grey.shade700,
                                    ),
                                  ),
                                  onTap: () {
                                    showModalBottomSheet(
                                      context: context,
                                      builder: (BuildContext context) {
                                        return _bottomSheetBase(
                                            child: Container(
                                              height: MediaQuery.of(context)
                                                      .size
                                                      .height /
                                                  2.4,
                                              color: Colors.white,
                                              child: Row(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: <Widget>[
                                                  Expanded(
                                                    child: CupertinoPicker(
                                                      scrollController:
                                                          FixedExtentScrollController(
                                                        initialItem: 0,
                                                      ),
                                                      itemExtent: 35,
                                                      backgroundColor:
                                                          Colors.white,
                                                      onSelectedItemChanged: (int
                                                              index) =>
                                                          setState(() =>
                                                              _roomType[1] =
                                                                  '${index + 1}室'),
                                                      children: 1
                                                          .to(15)
                                                          .map(
                                                            (val) => Center(
                                                              child: Text(
                                                                '$val 室',
                                                                style:
                                                                    TextStyle(
                                                                  fontSize: 20,
                                                                ),
                                                              ),
                                                            ),
                                                          )
                                                          .toList(),
                                                    ),
                                                  ),
                                                  Expanded(
                                                    child: CupertinoPicker(
                                                      scrollController:
                                                          FixedExtentScrollController(
                                                        initialItem: 0,
                                                      ),
                                                      itemExtent: 35,
                                                      backgroundColor:
                                                          Colors.white,
                                                      onSelectedItemChanged: (int
                                                              index) =>
                                                          setState(() =>
                                                              _roomType[1] =
                                                                  '${index + 1}厅'),
                                                      children: 0
                                                          .to(15)
                                                          .map(
                                                            (val) => Center(
                                                              child: Text(
                                                                '$val 厅',
                                                                style:
                                                                    TextStyle(
                                                                  fontSize: 20,
                                                                ),
                                                              ),
                                                            ),
                                                          )
                                                          .toList(),
                                                    ),
                                                  ),
                                                  Expanded(
                                                    child: CupertinoPicker(
                                                      scrollController:
                                                          FixedExtentScrollController(
                                                        initialItem: 0,
                                                      ),
                                                      itemExtent: 35,
                                                      backgroundColor:
                                                          Colors.white,
                                                      onSelectedItemChanged: (int
                                                              index) =>
                                                          setState(() =>
                                                              _roomType[1] =
                                                                  '${index + 1}卫'),
                                                      children: 0
                                                          .to(15)
                                                          .map(
                                                            (val) => Center(
                                                              child: Text(
                                                                '$val 卫',
                                                                style:
                                                                    TextStyle(
                                                                  fontSize: 20,
                                                                ),
                                                              ),
                                                            ),
                                                          )
                                                          .toList(),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                            onDone: () {
                                              rentPost.roomType =
                                                  _roomType.values.join();
                                              setState(
                                                  () => _formChanged = true);
                                              Navigator.pop(context);
                                            });
                                      },
                                    );
                                  },
                                ),
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
                              Text(
                                '朝向',
                                style: TextStyle(fontSize: 11),
                              ),
                              Padding(
                                padding: EdgeInsets.only(top: 12),
                                child: GestureDetector(
                                  child: Text(
                                    '请选择',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      fontSize: 19,
                                      color: Colors.grey.shade700,
                                    ),
                                  ),
                                  onTap: () {
                                    showModalBottomSheet(
                                      context: context,
                                      builder: (BuildContext context) {
                                        return _bottomSheetBase(
                                          child: Container(
                                            height: MediaQuery.of(context)
                                                    .size
                                                    .height /
                                                2.4,
                                            color: Colors.white,
                                            child: CupertinoPicker(
                                              scrollController:
                                                  FixedExtentScrollController(
                                                initialItem: 0,
                                              ),
                                              itemExtent: 35,
                                              backgroundColor: Colors.white,
                                              onSelectedItemChanged:
                                                  (int index) => setState(() =>
                                                      rentPost.roomOrientation =
                                                          _orientations[index]),
                                              children: _orientations
                                                  .map(
                                                    (val) => Text(
                                                      val,
                                                      style: TextStyle(
                                                        fontSize: 20,
                                                      ),
                                                    ),
                                                  )
                                                  .toList(),
                                            ),
                                          ),
                                          onDone: () {
                                            setState(() => _formChanged = true);
                                            Navigator.pop(context);
                                          },
                                        );
                                      },
                                    );
                                  },
                                ),
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
                              Text(
                                '楼层',
                                style: TextStyle(fontSize: 11),
                              ),
                              Padding(
                                padding: EdgeInsets.only(top: 12),
                                child: GestureDetector(
                                  child: Text(
                                    '请选择',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      fontSize: 19,
                                      color: Colors.grey.shade700,
                                    ),
                                  ),
                                  onTap: () {
                                    showModalBottomSheet(
                                      context: context,
                                      builder: (BuildContext context) {
                                        return _bottomSheetBase(
                                          child: Container(
                                            height: MediaQuery.of(context)
                                                    .size
                                                    .height /
                                                2.4,
                                            color: Colors.white,
                                            child: CupertinoPicker(
                                              scrollController:
                                                  FixedExtentScrollController(
                                                initialItem: 2,
                                              ),
                                              itemExtent: 35,
                                              backgroundColor: Colors.white,
                                              onSelectedItemChanged:
                                                  (int index) => setState(() =>
                                                      rentPost.roomFloor =
                                                          index + 1),
                                              children: (-2)
                                                  .to(99)
                                                  .where((value) => value != 0)
                                                  .map(
                                                    (val) => Text(
                                                      '$val 层 ',
                                                      style: TextStyle(
                                                        fontSize: 20,
                                                      ),
                                                    ),
                                                  )
                                                  .toList(),
                                            ),
                                          ),
                                          onDone: () {
                                            setState(() => _formChanged = true);
                                            Navigator.pop(context);
                                          },
                                        );
                                      },
                                    );
                                  },
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Container(
                height: 10,
                color: Colors.grey.withOpacity(0.09),
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
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          '月租金',
                          style: TextStyle(fontSize: 11),
                        ),
                        FormBuilderTextField(
                          cursorColor: Colors.black,
                          textAlign: TextAlign.center,
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          name: 'price',
                          keyboardType:
                              TextInputType.numberWithOptions(signed: false),
                          textInputAction: TextInputAction.next,
                          decoration: InputDecoration(
                            hintText: '请填写',
                            hintStyle: TextStyle(fontSize: 19),
                            // border: InputBorder.none,
                            // errorBorder: InputBorder.none,
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
                    Divider(
                      thickness: 1,
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          '支付限制',
                          style: TextStyle(fontSize: 11),
                        ),
                        FormBuilderChoiceChip(
                          name: 'paymentRestrictions',
                          alignment: WrapAlignment.center,
                          selectedColor: Color.fromARGB(255, 251, 150, 110),
                          backgroundColor: Colors.grey.withOpacity(0.4),
                          pressElevation: 0,
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          decoration: InputDecoration(
                            // border: InputBorder.none,
                            // errorBorder: InputBorder.none,
                            focusedBorder: InputBorder.none,
                            enabledBorder: InputBorder.none,
                          ),
                          validator: FormBuilderValidators.required(
                            context,
                            errorText: '支付限制不能为空',
                          ),
                          options: [
                            FormBuilderFieldOption(
                              value: 'y1f1',
                              child: Text('押一付一'),
                            ),
                            FormBuilderFieldOption(
                              value: 'y1f3',
                              child: Text('押一付三'),
                            ),
                            FormBuilderFieldOption(
                              value: 'bnf',
                              child: Text('半年付'),
                            ),
                            FormBuilderFieldOption(
                              value: 'nf',
                              child: Text('年付'),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Container(
                height: 10,
                color: Colors.grey.withOpacity(0.09),
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
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        FormBuilderTextField(
                          cursorColor: Colors.black,
                          textAlign: TextAlign.center,
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          name: 'name',
                          decoration: InputDecoration(
                            hintText: '请填写姓名',
                            hintStyle: TextStyle(fontSize: 19),
                            // border: InputBorder.none,
                            // errorBorder: InputBorder.none,
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
                    Divider(
                      thickness: 1,
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          '手机号',
                          style: TextStyle(fontSize: 11),
                        ),
                        FormBuilderTextField(
                          cursorColor: Colors.black,
                          textAlign: TextAlign.center,
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          name: 'phone',
                          decoration: InputDecoration(
                            hintText: '请填写',
                            hintStyle: TextStyle(fontSize: 19),
                            // border: InputBorder.none,
                            // errorBorder: InputBorder.none,
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
                  ],
                ),
              ),
              Container(
                height: 10,
                color: Colors.grey.withOpacity(0.09),
              ),
              Container(
                width: MediaQuery.of(context).size.width,
                height: 50,
                child: MaterialButton(
                  onPressed: () async {
                    _formKey.currentState?.saveAndValidate();
                    final value = _formKey.currentState?.value;
                    rentPost
                      ..roomAddr = value!['roomAddr']
                      ..roomArea = value['roomArea']
                      ..price = value['price']
                      ..restriction = value['restriction']
                      ..name = value['name']
                      ..phone = value['phone'];
                    showPendingDialog(context);
                    final result = await _posterClient.onRent(rentPost);
                    Navigator.pop(context);
                    if (result.success) {
                      showTip(msg: '提交成功', gravity: ToastGravity.CENTER);
                    } else {
                      showTip(msg: '提交失败', gravity: ToastGravity.CENTER);
                    }
                  },
                  color: Color.fromARGB(255, 251, 150, 110),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(5)),
                  ),
                  elevation: 0,
                  child: Text(
                    '提 交',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 22,
                      fontFamily: 'SourceHanSansCN',
                    ),
                  ),
                ),
              ),
              Container(
                height: 10,
                color: Colors.grey.withOpacity(0.09),
              ),
            ],
          ),
        );
      case PostKind.Help:
        helpPost = HelpPost('', '', '');
        return _formBase(
          context: context,
          child: Container(),
        );
    }
  }
}

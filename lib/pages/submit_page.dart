import 'dart:ui';
import 'dart:typed_data';
import 'package:uuid/uuid.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:easy_rent/utils/tip.dart';
import 'package:easy_rent/model/post.dart';
import 'package:easy_rent/model/client.dart';
import 'package:easy_rent/utils/pending.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:wechat_assets_picker/wechat_assets_picker.dart';
import 'package:wechat_camera_picker/wechat_camera_picker.dart';

extension RangeExtension on int {
  List<int> to(int maxInclusive) =>
      [for (int i = this; i <= maxInclusive; i++) i];
}

extension BuildContextExtension on BuildContext {
  MediaQueryData get mediaQuery => MediaQuery.of(this);
  ThemeData get themeData => Theme.of(this);
}

class SubmitPage extends StatefulWidget {
  @override
  _SubmitPageState createState() => _SubmitPageState();
}

class _SubmitPageState extends State<SubmitPage>
    with AutomaticKeepAliveClientMixin {
  late RentPost rentPost;
  late HelpPost helpPost;

  Map<int, String> _roomType = {1: '', 2: '', 3: ''};
  int? _roomFloor;
  String? _roomOrientation;
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
  List<AssetEntity> assets = <AssetEntity>[];

  final _formKey = GlobalKey<FormBuilderState>();
  final _posterClient =
      PosterClient(serverAddr: '1.116.216.141', serverPort: 8081);
  bool _formChanged = false;
  bool isDisplayingDetail = true;

  bool roomFloorSelected = false;
  bool roomTypeBedRoomSelected = false;
  bool roomTypeLivingRoomSelected = false;
  bool roomTypeToiletSelected = false;
  bool roomOrientationSelected = false;

  String roomFloorStr = '请选择';
  String roomTypeStr = '请选择';
  String roomOrientationStr = '请选择';

  TextStyle roomFloorPickerTextStyle = TextStyle(
    fontSize: 19,
    color: Colors.grey.shade700,
  );

  TextStyle roomOrientationPickerTextStyle = TextStyle(
    fontSize: 19,
    color: Colors.grey.shade700,
  );

  TextStyle roomTypePickerTextStyle = TextStyle(
    fontSize: 19,
    color: Colors.grey.shade700,
  );

  TextStyle selectedPickerTextStyle = TextStyle(
    fontSize: 19,
    color: Colors.black87,
  );

  int get assetsLength => assets.length;

  ThemeData get currentTheme => context.themeData;

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

  Widget _bottomSheetBase({
    required Widget child,
    required void Function()? onDone,
  }) {
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

  Widget get selectedAssetsWidget {
    return AnimatedContainer(
      duration: kThemeChangeDuration,
      curve: Curves.easeInOut,
      height: assets.isNotEmpty
          ? isDisplayingDetail
              ? 120.0
              : 80.0
          : 40.0,
      child: Column(
        children: <Widget>[
          SizedBox(
            height: 20.0,
            child: GestureDetector(
              onTap: () {
                if (assets.isNotEmpty) {
                  setState(() {
                    isDisplayingDetail = !isDisplayingDetail;
                  });
                }
              },
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 10.0),
                    padding: EdgeInsets.all(4.0),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.grey,
                    ),
                    child: Text(
                      '${assets.length}',
                      style: TextStyle(
                        height: 1.0,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  if (assets.isNotEmpty)
                    Icon(
                      isDisplayingDetail
                          ? Icons.arrow_upward
                          : Icons.arrow_downward,
                      size: 23.0,
                    ),
                ],
              ),
            ),
          ),
          selectedAssetsListView,
        ],
      ),
    );
  }

  Widget _imageAssetWidget(AssetEntity asset) {
    return Image(
      image: AssetEntityImageProvider(asset, isOriginal: false),
      fit: BoxFit.cover,
    );
  }

  Widget _selectedAssetWidget(int index) {
    final AssetEntity asset = assets.elementAt(index);
    return GestureDetector(
      onTap: isDisplayingDetail
          ? () async {
              final List<AssetEntity>? result =
                  await AssetPickerViewer.pushToViewer(
                context,
                currentIndex: index,
                previewAssets: assets,
                themeData:
                    AssetPicker.themeData(Color.fromARGB(255, 251, 150, 110)),
              );
              if (result != null && result != assets) {
                assets = List<AssetEntity>.from(result);
                if (mounted) {
                  setState(() {});
                }
              }
            }
          : null,
      child: RepaintBoundary(
        child: ClipRRect(
          borderRadius: BorderRadius.circular(8.0),
          child: _imageAssetWidget(asset),
        ),
      ),
    );
  }

  void removeAsset(int index) {
    setState(() {
      assets.removeAt(index);
      if (assets.isEmpty) {
        isDisplayingDetail = false;
      }
    });
  }

  Widget _selectedAssetDeleteButton(int index) {
    return GestureDetector(
      onTap: () => removeAsset(index),
      child: DecoratedBox(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(4.0),
          color: currentTheme.canvasColor.withOpacity(0.5),
        ),
        child: Icon(
          Icons.close,
          color: currentTheme.iconTheme.color,
          size: 18.0,
        ),
      ),
    );
  }

  Widget get selectedAssetsListView {
    return Expanded(
      child: ListView.builder(
        physics: BouncingScrollPhysics(),
        padding: EdgeInsets.symmetric(horizontal: 8.0),
        scrollDirection: Axis.horizontal,
        shrinkWrap: true,
        itemCount: assetsLength,
        itemBuilder: (_, int index) => Padding(
          padding: EdgeInsets.symmetric(horizontal: 8.0, vertical: 16.0),
          child: AspectRatio(
            aspectRatio: 1.0,
            child: Stack(
              children: <Widget>[
                Positioned.fill(child: _selectedAssetWidget(index)),
                AnimatedPositioned(
                  duration: kThemeAnimationDuration,
                  top: isDisplayingDetail ? 6.0 : -30.0,
                  right: isDisplayingDetail ? 6.0 : -30.0,
                  child: _selectedAssetDeleteButton(index),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget buildImagePicker(BuildContext context) {
    return GestureDetector(
      child: Stack(
        alignment: Alignment.center,
        children: [
          Container(
            height: 200,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/images/camera_bg.jpg"),
                fit: BoxFit.fill,
              ),
            ),
          ),
          ElevatedButton(
            onPressed: null,
            style: ElevatedButton.styleFrom(
              shape: CircleBorder(),
              padding: EdgeInsets.all(24),
              primary: Colors.grey.shade400.withOpacity(0.02),
            ),
            child: Column(
              children: [
                Icon(
                  Icons.camera_alt,
                  color: Colors.white70,
                ),
                Text(
                  '上传照片',
                  style: TextStyle(
                    color: Colors.white70,
                    fontSize: 12,
                  ),
                )
              ],
            ),
          ),
          Positioned(
            top: 0.0,
            left: 0.0,
            right: 0.0,
            child: selectedAssetsWidget,
          ),
        ],
      ),
      onTap: () => selectAssets(pickCamera),
    );
  }

  Future<List<AssetEntity>?> get pickCamera {
    return AssetPicker.pickAssets(
      context,
      maxAssets: 9,
      selectedAssets: assets,
      themeColor: Color.fromARGB(255, 251, 150, 110),
      requestType: RequestType.common,
      specialItemPosition: SpecialItemPosition.prepend,
      specialItemBuilder: (BuildContext context) {
        return GestureDetector(
          behavior: HitTestBehavior.opaque,
          onTap: () async {
            final AssetEntity? result = await CameraPicker.pickFromCamera(
              context,
              enableRecording: false,
            );
            if (result != null) {
              Navigator.of(context).pop(<AssetEntity>[...assets, result]);
            }
          },
          child: Center(
            child: Icon(Icons.camera_alt, size: 42.0),
          ),
        );
      },
    );
  }

  Future<void> selectAssets(Future<List<AssetEntity>?> model) async {
    final List<AssetEntity>? result = await model;
    if (result != null) {
      assets = List<AssetEntity>.from(result);
      if (mounted) {
        setState(() {});
      }
    }
  }

  @override
  bool get wantKeepAlive => true;

  @override
  @mustCallSuper
  Widget build(BuildContext context) {
    super.build(context);
    switch (submitPageType) {
      case PostKind.Rent:
        rentPost = RentPost('', '', '', '');
        return _formBase(
          context: context,
          child: Column(
            children: [
              buildImagePicker(context),
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
                                    roomTypeStr,
                                    textAlign: TextAlign.center,
                                    style: roomTypePickerTextStyle,
                                    softWrap: false,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                  onTap: () {
                                    setState(() {
                                      roomFloorSelected = false;
                                      roomTypeBedRoomSelected = false;
                                      roomTypeLivingRoomSelected = false;
                                      roomTypeToiletSelected = false;
                                      roomOrientationSelected = false;
                                    });
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
                                                      onSelectedItemChanged:
                                                          (int index) =>
                                                              setState(() {
                                                        roomTypeBedRoomSelected =
                                                            true;
                                                        _roomType[1] =
                                                            '${index + 1}室';
                                                      }),
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
                                                      onSelectedItemChanged:
                                                          (int index) =>
                                                              setState(() {
                                                        if (index != 0) {
                                                          roomTypeLivingRoomSelected =
                                                              true;
                                                          _roomType[2] =
                                                              '$index厅';
                                                        }
                                                      }),
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
                                                      onSelectedItemChanged:
                                                          (int index) =>
                                                              setState(() {
                                                        if (index != 0) {
                                                          roomTypeToiletSelected =
                                                              true;
                                                          _roomType[3] =
                                                              '$index卫';
                                                        }
                                                      }),
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
                                              setState(() {
                                                _formChanged = true;
                                                if (!roomTypeBedRoomSelected) {
                                                  _roomType[1] = '1室';
                                                }
                                                if (!roomTypeLivingRoomSelected) {
                                                  _roomType[2] = '';
                                                }
                                                if (!roomTypeToiletSelected) {
                                                  _roomType[3] = '';
                                                }
                                                roomTypePickerTextStyle =
                                                    selectedPickerTextStyle;
                                                roomTypeStr =
                                                    _roomType.values.join();
                                              });
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
                                    roomOrientationStr,
                                    textAlign: TextAlign.center,
                                    style: roomOrientationPickerTextStyle,
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
                                                  (int index) => setState(() {
                                                _roomOrientation =
                                                    _orientations[index];
                                              }),
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
                                            setState(() {
                                              _formChanged = true;
                                              if (_roomOrientation == null) {
                                                _roomOrientation = '东';
                                              }
                                              roomOrientationPickerTextStyle =
                                                  selectedPickerTextStyle;
                                              roomOrientationStr =
                                                  _roomOrientation!;
                                            });
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
                                    roomFloorStr,
                                    textAlign: TextAlign.center,
                                    style: roomFloorPickerTextStyle,
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
                                                  (int index) => setState(() {
                                                roomFloorSelected = true;
                                                if (index < 2) {
                                                  _roomFloor = index - 2;
                                                } else if (index == 2) {
                                                  _roomFloor = 1;
                                                } else {
                                                  _roomFloor = index - 1;
                                                }
                                              }),
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
                                            setState(() {
                                              _formChanged = true;
                                              roomFloorPickerTextStyle =
                                                  selectedPickerTextStyle;
                                              if (!roomFloorSelected) {
                                                _roomFloor = 1;
                                              }
                                              roomFloorStr =
                                                  _roomFloor.toString();
                                            });
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
                          name: 'restriction',
                          alignment: WrapAlignment.center,
                          selectedColor: Color.fromARGB(255, 251, 150, 110),
                          backgroundColor: Colors.grey.withOpacity(0.4),
                          pressElevation: 0,
                          autovalidateMode: AutovalidateMode.onUserInteraction,
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
                          '其他说明',
                          style: TextStyle(fontSize: 15),
                        ),
                      ],
                    ),
                    Divider(
                      thickness: 1,
                    ),
                    Container(
                      height: MediaQuery.of(context).size.height * 0.33,
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
              Container(
                height: 10,
                color: Colors.grey.withOpacity(0.09),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 5),
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  height: 50,
                  child: MaterialButton(
                    onPressed: () async {
                      bool? partlyValidate =
                          _formKey.currentState?.saveAndValidate();
                      if (partlyValidate!) {
                        if (_roomType.values.join().isEmpty) {
                          showTip(msg: '厅室不得为空', gravity: ToastGravity.CENTER);
                          return;
                        }
                        if (_roomOrientation == null) {
                          showTip(msg: '朝向不得为空', gravity: ToastGravity.CENTER);
                          return;
                        }
                        if (_roomFloor == null) {
                          showTip(msg: '楼层不得为空', gravity: ToastGravity.CENTER);
                          return;
                        }
                        if (assets.isEmpty) {
                          showTip(
                              msg: '至少拍摄一张图片', gravity: ToastGravity.CENTER);
                          return;
                        }
                        showPendingDialog(context);
                        var pictures = <Uint8List>[];
                        for (var e in assets) {
                          var file = await e.loadFile();
                          pictures.add(file!.readAsBytesSync());
                        }

                        final value = _formKey.currentState?.value;
                        rentPost
                          ..uuid = Uuid().v4()
                          ..name = value!['name']
                          ..phone = value['phone']
                          ..roomAddr = value['roomAddr']
                          ..roomArea = int.parse(value['roomArea'])
                          ..roomType = roomTypeStr
                          ..roomOrientation = _roomOrientation
                          ..roomFloor = _roomFloor
                          ..description = value['description']
                          ..price = int.parse(value['price'])
                          ..restriction = value['restriction']
                          ..pictures = pictures;

                        final result = await _posterClient.onRent(rentPost);
                        Navigator.pop(context);
                        if (result.success) {
                          showTip(msg: '提交成功', gravity: ToastGravity.CENTER);
                          Navigator.pop(context);
                          Navigator.pop(context);
                        } else {
                          showTip(msg: '提交失败', gravity: ToastGravity.CENTER);
                        }
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
              ),
              Container(
                height: 10,
                color: Colors.grey.withOpacity(0.09),
              ),
            ],
          ),
        );
      case PostKind.Help:
        helpPost = HelpPost('', '', '', '');
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
                          name: 'expectedPrice',
                          keyboardType:
                          TextInputType.numberWithOptions(signed: false),
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
                          '需求说明',
                          style: TextStyle(fontSize: 15),
                        ),
                      ],
                    ),
                    Divider(
                      thickness: 1,
                    ),
                    Container(
                      height: MediaQuery.of(context).size.height * 0.33,
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
                  ],
                ),
              ),
              Container(
                height: 10,
                color: Colors.grey.withOpacity(0.09),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 5),
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  height: 50,
                  child: MaterialButton(
                    onPressed: () async {
                      bool? validate =
                      _formKey.currentState?.saveAndValidate();
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
                          Navigator.pop(context);
                        } else {
                          showTip(msg: '提交失败', gravity: ToastGravity.CENTER);
                        }
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
              ),
              Container(
                height: 10,
                color: Colors.grey.withOpacity(0.09),
              ),
            ],
          ),
        );
    }
  }
}

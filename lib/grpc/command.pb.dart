///
//  Generated code. Do not modify.
//  source: command.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,unnecessary_const,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type,unnecessary_this,prefer_final_fields

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

class PassedRentPost extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'PassedRentPost', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'easyrent.command'), createEmptyInstance: create)
    ..aOS(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'name')
    ..aOS(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'phone')
    ..aOS(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'roomAddr')
    ..a<$core.int>(4, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'roomArea', $pb.PbFieldType.O3)
    ..aOS(5, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'roomType')
    ..aOS(6, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'roomOrientation')
    ..a<$core.int>(7, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'roomFloor', $pb.PbFieldType.O3)
    ..aOS(8, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'description')
    ..a<$core.int>(9, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'price', $pb.PbFieldType.O3)
    ..aOS(10, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'restriction')
    ..aOS(11, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'uuid')
    ..aOS(12, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'releaseTime')
    ..p<$core.List<$core.int>>(13, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'pictures', $pb.PbFieldType.PY)
    ..hasRequiredFields = false
  ;

  PassedRentPost._() : super();
  factory PassedRentPost({
    $core.String? name,
    $core.String? phone,
    $core.String? roomAddr,
    $core.int? roomArea,
    $core.String? roomType,
    $core.String? roomOrientation,
    $core.int? roomFloor,
    $core.String? description,
    $core.int? price,
    $core.String? restriction,
    $core.String? uuid,
    $core.String? releaseTime,
    $core.Iterable<$core.List<$core.int>>? pictures,
  }) {
    final _result = create();
    if (name != null) {
      _result.name = name;
    }
    if (phone != null) {
      _result.phone = phone;
    }
    if (roomAddr != null) {
      _result.roomAddr = roomAddr;
    }
    if (roomArea != null) {
      _result.roomArea = roomArea;
    }
    if (roomType != null) {
      _result.roomType = roomType;
    }
    if (roomOrientation != null) {
      _result.roomOrientation = roomOrientation;
    }
    if (roomFloor != null) {
      _result.roomFloor = roomFloor;
    }
    if (description != null) {
      _result.description = description;
    }
    if (price != null) {
      _result.price = price;
    }
    if (restriction != null) {
      _result.restriction = restriction;
    }
    if (uuid != null) {
      _result.uuid = uuid;
    }
    if (releaseTime != null) {
      _result.releaseTime = releaseTime;
    }
    if (pictures != null) {
      _result.pictures.addAll(pictures);
    }
    return _result;
  }
  factory PassedRentPost.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory PassedRentPost.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  PassedRentPost clone() => PassedRentPost()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  PassedRentPost copyWith(void Function(PassedRentPost) updates) => super.copyWith((message) => updates(message as PassedRentPost)) as PassedRentPost; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static PassedRentPost create() => PassedRentPost._();
  PassedRentPost createEmptyInstance() => create();
  static $pb.PbList<PassedRentPost> createRepeated() => $pb.PbList<PassedRentPost>();
  @$core.pragma('dart2js:noInline')
  static PassedRentPost getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<PassedRentPost>(create);
  static PassedRentPost? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get name => $_getSZ(0);
  @$pb.TagNumber(1)
  set name($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasName() => $_has(0);
  @$pb.TagNumber(1)
  void clearName() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get phone => $_getSZ(1);
  @$pb.TagNumber(2)
  set phone($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasPhone() => $_has(1);
  @$pb.TagNumber(2)
  void clearPhone() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get roomAddr => $_getSZ(2);
  @$pb.TagNumber(3)
  set roomAddr($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasRoomAddr() => $_has(2);
  @$pb.TagNumber(3)
  void clearRoomAddr() => clearField(3);

  @$pb.TagNumber(4)
  $core.int get roomArea => $_getIZ(3);
  @$pb.TagNumber(4)
  set roomArea($core.int v) { $_setSignedInt32(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasRoomArea() => $_has(3);
  @$pb.TagNumber(4)
  void clearRoomArea() => clearField(4);

  @$pb.TagNumber(5)
  $core.String get roomType => $_getSZ(4);
  @$pb.TagNumber(5)
  set roomType($core.String v) { $_setString(4, v); }
  @$pb.TagNumber(5)
  $core.bool hasRoomType() => $_has(4);
  @$pb.TagNumber(5)
  void clearRoomType() => clearField(5);

  @$pb.TagNumber(6)
  $core.String get roomOrientation => $_getSZ(5);
  @$pb.TagNumber(6)
  set roomOrientation($core.String v) { $_setString(5, v); }
  @$pb.TagNumber(6)
  $core.bool hasRoomOrientation() => $_has(5);
  @$pb.TagNumber(6)
  void clearRoomOrientation() => clearField(6);

  @$pb.TagNumber(7)
  $core.int get roomFloor => $_getIZ(6);
  @$pb.TagNumber(7)
  set roomFloor($core.int v) { $_setSignedInt32(6, v); }
  @$pb.TagNumber(7)
  $core.bool hasRoomFloor() => $_has(6);
  @$pb.TagNumber(7)
  void clearRoomFloor() => clearField(7);

  @$pb.TagNumber(8)
  $core.String get description => $_getSZ(7);
  @$pb.TagNumber(8)
  set description($core.String v) { $_setString(7, v); }
  @$pb.TagNumber(8)
  $core.bool hasDescription() => $_has(7);
  @$pb.TagNumber(8)
  void clearDescription() => clearField(8);

  @$pb.TagNumber(9)
  $core.int get price => $_getIZ(8);
  @$pb.TagNumber(9)
  set price($core.int v) { $_setSignedInt32(8, v); }
  @$pb.TagNumber(9)
  $core.bool hasPrice() => $_has(8);
  @$pb.TagNumber(9)
  void clearPrice() => clearField(9);

  @$pb.TagNumber(10)
  $core.String get restriction => $_getSZ(9);
  @$pb.TagNumber(10)
  set restriction($core.String v) { $_setString(9, v); }
  @$pb.TagNumber(10)
  $core.bool hasRestriction() => $_has(9);
  @$pb.TagNumber(10)
  void clearRestriction() => clearField(10);

  @$pb.TagNumber(11)
  $core.String get uuid => $_getSZ(10);
  @$pb.TagNumber(11)
  set uuid($core.String v) { $_setString(10, v); }
  @$pb.TagNumber(11)
  $core.bool hasUuid() => $_has(10);
  @$pb.TagNumber(11)
  void clearUuid() => clearField(11);

  @$pb.TagNumber(12)
  $core.String get releaseTime => $_getSZ(11);
  @$pb.TagNumber(12)
  set releaseTime($core.String v) { $_setString(11, v); }
  @$pb.TagNumber(12)
  $core.bool hasReleaseTime() => $_has(11);
  @$pb.TagNumber(12)
  void clearReleaseTime() => clearField(12);

  @$pb.TagNumber(13)
  $core.List<$core.List<$core.int>> get pictures => $_getList(12);
}

class PassedHelpPost extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'PassedHelpPost', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'easyrent.command'), createEmptyInstance: create)
    ..aOS(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'name')
    ..aOS(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'phone')
    ..aOS(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'expectedAddr')
    ..a<$core.int>(4, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'expectedPrice', $pb.PbFieldType.O3)
    ..aOS(5, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'demands')
    ..aOS(6, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'uuid')
    ..aOS(7, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'releaseTime')
    ..hasRequiredFields = false
  ;

  PassedHelpPost._() : super();
  factory PassedHelpPost({
    $core.String? name,
    $core.String? phone,
    $core.String? expectedAddr,
    $core.int? expectedPrice,
    $core.String? demands,
    $core.String? uuid,
    $core.String? releaseTime,
  }) {
    final _result = create();
    if (name != null) {
      _result.name = name;
    }
    if (phone != null) {
      _result.phone = phone;
    }
    if (expectedAddr != null) {
      _result.expectedAddr = expectedAddr;
    }
    if (expectedPrice != null) {
      _result.expectedPrice = expectedPrice;
    }
    if (demands != null) {
      _result.demands = demands;
    }
    if (uuid != null) {
      _result.uuid = uuid;
    }
    if (releaseTime != null) {
      _result.releaseTime = releaseTime;
    }
    return _result;
  }
  factory PassedHelpPost.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory PassedHelpPost.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  PassedHelpPost clone() => PassedHelpPost()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  PassedHelpPost copyWith(void Function(PassedHelpPost) updates) => super.copyWith((message) => updates(message as PassedHelpPost)) as PassedHelpPost; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static PassedHelpPost create() => PassedHelpPost._();
  PassedHelpPost createEmptyInstance() => create();
  static $pb.PbList<PassedHelpPost> createRepeated() => $pb.PbList<PassedHelpPost>();
  @$core.pragma('dart2js:noInline')
  static PassedHelpPost getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<PassedHelpPost>(create);
  static PassedHelpPost? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get name => $_getSZ(0);
  @$pb.TagNumber(1)
  set name($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasName() => $_has(0);
  @$pb.TagNumber(1)
  void clearName() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get phone => $_getSZ(1);
  @$pb.TagNumber(2)
  set phone($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasPhone() => $_has(1);
  @$pb.TagNumber(2)
  void clearPhone() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get expectedAddr => $_getSZ(2);
  @$pb.TagNumber(3)
  set expectedAddr($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasExpectedAddr() => $_has(2);
  @$pb.TagNumber(3)
  void clearExpectedAddr() => clearField(3);

  @$pb.TagNumber(4)
  $core.int get expectedPrice => $_getIZ(3);
  @$pb.TagNumber(4)
  set expectedPrice($core.int v) { $_setSignedInt32(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasExpectedPrice() => $_has(3);
  @$pb.TagNumber(4)
  void clearExpectedPrice() => clearField(4);

  @$pb.TagNumber(5)
  $core.String get demands => $_getSZ(4);
  @$pb.TagNumber(5)
  set demands($core.String v) { $_setString(4, v); }
  @$pb.TagNumber(5)
  $core.bool hasDemands() => $_has(4);
  @$pb.TagNumber(5)
  void clearDemands() => clearField(5);

  @$pb.TagNumber(6)
  $core.String get uuid => $_getSZ(5);
  @$pb.TagNumber(6)
  set uuid($core.String v) { $_setString(5, v); }
  @$pb.TagNumber(6)
  $core.bool hasUuid() => $_has(5);
  @$pb.TagNumber(6)
  void clearUuid() => clearField(6);

  @$pb.TagNumber(7)
  $core.String get releaseTime => $_getSZ(6);
  @$pb.TagNumber(7)
  set releaseTime($core.String v) { $_setString(6, v); }
  @$pb.TagNumber(7)
  $core.bool hasReleaseTime() => $_has(6);
  @$pb.TagNumber(7)
  void clearReleaseTime() => clearField(7);
}

class PostPackage extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'PostPackage', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'easyrent.command'), createEmptyInstance: create)
    ..pc<PassedRentPost>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'rentPosts', $pb.PbFieldType.PM, subBuilder: PassedRentPost.create)
    ..pc<PassedHelpPost>(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'helpPosts', $pb.PbFieldType.PM, subBuilder: PassedHelpPost.create)
    ..hasRequiredFields = false
  ;

  PostPackage._() : super();
  factory PostPackage({
    $core.Iterable<PassedRentPost>? rentPosts,
    $core.Iterable<PassedHelpPost>? helpPosts,
  }) {
    final _result = create();
    if (rentPosts != null) {
      _result.rentPosts.addAll(rentPosts);
    }
    if (helpPosts != null) {
      _result.helpPosts.addAll(helpPosts);
    }
    return _result;
  }
  factory PostPackage.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory PostPackage.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  PostPackage clone() => PostPackage()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  PostPackage copyWith(void Function(PostPackage) updates) => super.copyWith((message) => updates(message as PostPackage)) as PostPackage; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static PostPackage create() => PostPackage._();
  PostPackage createEmptyInstance() => create();
  static $pb.PbList<PostPackage> createRepeated() => $pb.PbList<PostPackage>();
  @$core.pragma('dart2js:noInline')
  static PostPackage getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<PostPackage>(create);
  static PostPackage? _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<PassedRentPost> get rentPosts => $_getList(0);

  @$pb.TagNumber(2)
  $core.List<PassedHelpPost> get helpPosts => $_getList(1);
}

class LoadRequest extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'LoadRequest', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'easyrent.command'), createEmptyInstance: create)
    ..pPS(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'existPosts')
    ..hasRequiredFields = false
  ;

  LoadRequest._() : super();
  factory LoadRequest({
    $core.Iterable<$core.String>? existPosts,
  }) {
    final _result = create();
    if (existPosts != null) {
      _result.existPosts.addAll(existPosts);
    }
    return _result;
  }
  factory LoadRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory LoadRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  LoadRequest clone() => LoadRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  LoadRequest copyWith(void Function(LoadRequest) updates) => super.copyWith((message) => updates(message as LoadRequest)) as LoadRequest; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static LoadRequest create() => LoadRequest._();
  LoadRequest createEmptyInstance() => create();
  static $pb.PbList<LoadRequest> createRepeated() => $pb.PbList<LoadRequest>();
  @$core.pragma('dart2js:noInline')
  static LoadRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<LoadRequest>(create);
  static LoadRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<$core.String> get existPosts => $_getList(0);
}

class LoadReply extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'LoadReply', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'easyrent.command'), createEmptyInstance: create)
    ..aOM<PostPackage>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'postPackage', subBuilder: PostPackage.create)
    ..hasRequiredFields = false
  ;

  LoadReply._() : super();
  factory LoadReply({
    PostPackage? postPackage,
  }) {
    final _result = create();
    if (postPackage != null) {
      _result.postPackage = postPackage;
    }
    return _result;
  }
  factory LoadReply.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory LoadReply.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  LoadReply clone() => LoadReply()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  LoadReply copyWith(void Function(LoadReply) updates) => super.copyWith((message) => updates(message as LoadReply)) as LoadReply; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static LoadReply create() => LoadReply._();
  LoadReply createEmptyInstance() => create();
  static $pb.PbList<LoadReply> createRepeated() => $pb.PbList<LoadReply>();
  @$core.pragma('dart2js:noInline')
  static LoadReply getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<LoadReply>(create);
  static LoadReply? _defaultInstance;

  @$pb.TagNumber(1)
  PostPackage get postPackage => $_getN(0);
  @$pb.TagNumber(1)
  set postPackage(PostPackage v) { setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasPostPackage() => $_has(0);
  @$pb.TagNumber(1)
  void clearPostPackage() => clearField(1);
  @$pb.TagNumber(1)
  PostPackage ensurePostPackage() => $_ensure(0);
}

class RefreshRequest extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'RefreshRequest', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'easyrent.command'), createEmptyInstance: create)
    ..aOB(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'first')
    ..hasRequiredFields = false
  ;

  RefreshRequest._() : super();
  factory RefreshRequest({
    $core.bool? first,
  }) {
    final _result = create();
    if (first != null) {
      _result.first = first;
    }
    return _result;
  }
  factory RefreshRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory RefreshRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  RefreshRequest clone() => RefreshRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  RefreshRequest copyWith(void Function(RefreshRequest) updates) => super.copyWith((message) => updates(message as RefreshRequest)) as RefreshRequest; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static RefreshRequest create() => RefreshRequest._();
  RefreshRequest createEmptyInstance() => create();
  static $pb.PbList<RefreshRequest> createRepeated() => $pb.PbList<RefreshRequest>();
  @$core.pragma('dart2js:noInline')
  static RefreshRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<RefreshRequest>(create);
  static RefreshRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.bool get first => $_getBF(0);
  @$pb.TagNumber(1)
  set first($core.bool v) { $_setBool(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasFirst() => $_has(0);
  @$pb.TagNumber(1)
  void clearFirst() => clearField(1);
}

class RefreshReply extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'RefreshReply', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'easyrent.command'), createEmptyInstance: create)
    ..aOM<PostPackage>(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'postPackage', subBuilder: PostPackage.create)
    ..hasRequiredFields = false
  ;

  RefreshReply._() : super();
  factory RefreshReply({
    PostPackage? postPackage,
  }) {
    final _result = create();
    if (postPackage != null) {
      _result.postPackage = postPackage;
    }
    return _result;
  }
  factory RefreshReply.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory RefreshReply.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  RefreshReply clone() => RefreshReply()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  RefreshReply copyWith(void Function(RefreshReply) updates) => super.copyWith((message) => updates(message as RefreshReply)) as RefreshReply; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static RefreshReply create() => RefreshReply._();
  RefreshReply createEmptyInstance() => create();
  static $pb.PbList<RefreshReply> createRepeated() => $pb.PbList<RefreshReply>();
  @$core.pragma('dart2js:noInline')
  static RefreshReply getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<RefreshReply>(create);
  static RefreshReply? _defaultInstance;

  @$pb.TagNumber(2)
  PostPackage get postPackage => $_getN(0);
  @$pb.TagNumber(2)
  set postPackage(PostPackage v) { setField(2, v); }
  @$pb.TagNumber(2)
  $core.bool hasPostPackage() => $_has(0);
  @$pb.TagNumber(2)
  void clearPostPackage() => clearField(2);
  @$pb.TagNumber(2)
  PostPackage ensurePostPackage() => $_ensure(0);
}

class SearchRequest extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'SearchRequest', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'easyrent.command'), createEmptyInstance: create)
    ..aOS(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'query')
    ..a<$core.int>(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'index', $pb.PbFieldType.O3)
    ..hasRequiredFields = false
  ;

  SearchRequest._() : super();
  factory SearchRequest({
    $core.String? query,
    $core.int? index,
  }) {
    final _result = create();
    if (query != null) {
      _result.query = query;
    }
    if (index != null) {
      _result.index = index;
    }
    return _result;
  }
  factory SearchRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory SearchRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  SearchRequest clone() => SearchRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  SearchRequest copyWith(void Function(SearchRequest) updates) => super.copyWith((message) => updates(message as SearchRequest)) as SearchRequest; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static SearchRequest create() => SearchRequest._();
  SearchRequest createEmptyInstance() => create();
  static $pb.PbList<SearchRequest> createRepeated() => $pb.PbList<SearchRequest>();
  @$core.pragma('dart2js:noInline')
  static SearchRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<SearchRequest>(create);
  static SearchRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get query => $_getSZ(0);
  @$pb.TagNumber(1)
  set query($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasQuery() => $_has(0);
  @$pb.TagNumber(1)
  void clearQuery() => clearField(1);

  @$pb.TagNumber(2)
  $core.int get index => $_getIZ(1);
  @$pb.TagNumber(2)
  set index($core.int v) { $_setSignedInt32(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasIndex() => $_has(1);
  @$pb.TagNumber(2)
  void clearIndex() => clearField(2);
}

class SearchReply extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'SearchReply', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'easyrent.command'), createEmptyInstance: create)
    ..aOM<PostPackage>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'postPackage', subBuilder: PostPackage.create)
    ..hasRequiredFields = false
  ;

  SearchReply._() : super();
  factory SearchReply({
    PostPackage? postPackage,
  }) {
    final _result = create();
    if (postPackage != null) {
      _result.postPackage = postPackage;
    }
    return _result;
  }
  factory SearchReply.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory SearchReply.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  SearchReply clone() => SearchReply()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  SearchReply copyWith(void Function(SearchReply) updates) => super.copyWith((message) => updates(message as SearchReply)) as SearchReply; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static SearchReply create() => SearchReply._();
  SearchReply createEmptyInstance() => create();
  static $pb.PbList<SearchReply> createRepeated() => $pb.PbList<SearchReply>();
  @$core.pragma('dart2js:noInline')
  static SearchReply getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<SearchReply>(create);
  static SearchReply? _defaultInstance;

  @$pb.TagNumber(1)
  PostPackage get postPackage => $_getN(0);
  @$pb.TagNumber(1)
  set postPackage(PostPackage v) { setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasPostPackage() => $_has(0);
  @$pb.TagNumber(1)
  void clearPostPackage() => clearField(1);
  @$pb.TagNumber(1)
  PostPackage ensurePostPackage() => $_ensure(0);
}

class LogoutRequest extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'LogoutRequest', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'easyrent.command'), createEmptyInstance: create)
    ..aOS(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'name')
    ..hasRequiredFields = false
  ;

  LogoutRequest._() : super();
  factory LogoutRequest({
    $core.String? name,
  }) {
    final _result = create();
    if (name != null) {
      _result.name = name;
    }
    return _result;
  }
  factory LogoutRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory LogoutRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  LogoutRequest clone() => LogoutRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  LogoutRequest copyWith(void Function(LogoutRequest) updates) => super.copyWith((message) => updates(message as LogoutRequest)) as LogoutRequest; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static LogoutRequest create() => LogoutRequest._();
  LogoutRequest createEmptyInstance() => create();
  static $pb.PbList<LogoutRequest> createRepeated() => $pb.PbList<LogoutRequest>();
  @$core.pragma('dart2js:noInline')
  static LogoutRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<LogoutRequest>(create);
  static LogoutRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get name => $_getSZ(0);
  @$pb.TagNumber(1)
  set name($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasName() => $_has(0);
  @$pb.TagNumber(1)
  void clearName() => clearField(1);
}

class LogoutReply extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'LogoutReply', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'easyrent.command'), createEmptyInstance: create)
    ..hasRequiredFields = false
  ;

  LogoutReply._() : super();
  factory LogoutReply() => create();
  factory LogoutReply.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory LogoutReply.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  LogoutReply clone() => LogoutReply()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  LogoutReply copyWith(void Function(LogoutReply) updates) => super.copyWith((message) => updates(message as LogoutReply)) as LogoutReply; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static LogoutReply create() => LogoutReply._();
  LogoutReply createEmptyInstance() => create();
  static $pb.PbList<LogoutReply> createRepeated() => $pb.PbList<LogoutReply>();
  @$core.pragma('dart2js:noInline')
  static LogoutReply getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<LogoutReply>(create);
  static LogoutReply? _defaultInstance;
}


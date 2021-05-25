///
//  Generated code. Do not modify.
//  source: command.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,unnecessary_const,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type,unnecessary_this,prefer_final_fields

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

class FetchedRentPost extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'FetchedRentPost', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'easyrent.command'), createEmptyInstance: create)
    ..aOS(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'name')
    ..aOS(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'phone')
    ..aOS(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'roomAddr')
    ..a<$core.int>(4, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'roomArea', $pb.PbFieldType.O3)
    ..aOS(5, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'roomType')
    ..aOS(6, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'roomOrientation')
    ..a<$core.int>(7, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'roomFloor', $pb.PbFieldType.O3)
    ..a<$core.int>(8, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'price', $pb.PbFieldType.O3)
    ..hasRequiredFields = false
  ;

  FetchedRentPost._() : super();
  factory FetchedRentPost({
    $core.String? name,
    $core.String? phone,
    $core.String? roomAddr,
    $core.int? roomArea,
    $core.String? roomType,
    $core.String? roomOrientation,
    $core.int? roomFloor,
    $core.int? price,
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
    if (price != null) {
      _result.price = price;
    }
    return _result;
  }
  factory FetchedRentPost.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory FetchedRentPost.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  FetchedRentPost clone() => FetchedRentPost()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  FetchedRentPost copyWith(void Function(FetchedRentPost) updates) => super.copyWith((message) => updates(message as FetchedRentPost)) as FetchedRentPost; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static FetchedRentPost create() => FetchedRentPost._();
  FetchedRentPost createEmptyInstance() => create();
  static $pb.PbList<FetchedRentPost> createRepeated() => $pb.PbList<FetchedRentPost>();
  @$core.pragma('dart2js:noInline')
  static FetchedRentPost getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<FetchedRentPost>(create);
  static FetchedRentPost? _defaultInstance;

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
  $core.int get price => $_getIZ(7);
  @$pb.TagNumber(8)
  set price($core.int v) { $_setSignedInt32(7, v); }
  @$pb.TagNumber(8)
  $core.bool hasPrice() => $_has(7);
  @$pb.TagNumber(8)
  void clearPrice() => clearField(8);
}

class FetchedHelpPost extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'FetchedHelpPost', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'easyrent.command'), createEmptyInstance: create)
    ..aOS(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'name')
    ..aOS(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'phone')
    ..aOS(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'expectedAddr')
    ..a<$core.int>(4, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'expectedPrice', $pb.PbFieldType.O3)
    ..aOS(5, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'demands')
    ..hasRequiredFields = false
  ;

  FetchedHelpPost._() : super();
  factory FetchedHelpPost({
    $core.String? name,
    $core.String? phone,
    $core.String? expectedAddr,
    $core.int? expectedPrice,
    $core.String? demands,
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
    return _result;
  }
  factory FetchedHelpPost.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory FetchedHelpPost.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  FetchedHelpPost clone() => FetchedHelpPost()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  FetchedHelpPost copyWith(void Function(FetchedHelpPost) updates) => super.copyWith((message) => updates(message as FetchedHelpPost)) as FetchedHelpPost; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static FetchedHelpPost create() => FetchedHelpPost._();
  FetchedHelpPost createEmptyInstance() => create();
  static $pb.PbList<FetchedHelpPost> createRepeated() => $pb.PbList<FetchedHelpPost>();
  @$core.pragma('dart2js:noInline')
  static FetchedHelpPost getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<FetchedHelpPost>(create);
  static FetchedHelpPost? _defaultInstance;

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
}

class RefreshRequest extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'RefreshRequest', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'easyrent.command'), createEmptyInstance: create)
    ..hasRequiredFields = false
  ;

  RefreshRequest._() : super();
  factory RefreshRequest() => create();
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
}

class RefreshReply extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'RefreshReply', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'easyrent.command'), createEmptyInstance: create)
    ..pc<FetchedRentPost>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'rentPost', $pb.PbFieldType.PM, subBuilder: FetchedRentPost.create)
    ..pc<FetchedHelpPost>(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'helpPost', $pb.PbFieldType.PM, subBuilder: FetchedHelpPost.create)
    ..hasRequiredFields = false
  ;

  RefreshReply._() : super();
  factory RefreshReply({
    $core.Iterable<FetchedRentPost>? rentPost,
    $core.Iterable<FetchedHelpPost>? helpPost,
  }) {
    final _result = create();
    if (rentPost != null) {
      _result.rentPost.addAll(rentPost);
    }
    if (helpPost != null) {
      _result.helpPost.addAll(helpPost);
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

  @$pb.TagNumber(1)
  $core.List<FetchedRentPost> get rentPost => $_getList(0);

  @$pb.TagNumber(2)
  $core.List<FetchedHelpPost> get helpPost => $_getList(1);
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


///
//  Generated code. Do not modify.
//  source: post.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,unnecessary_const,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type,unnecessary_this,prefer_final_fields

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

class SubmitRentRequest extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'SubmitRentRequest', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'easyrent.post'), createEmptyInstance: create)
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
    ..aOS(11, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'createBy')
    ..aOS(12, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'uuid')
    ..aOS(13, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'releaseTime')
    ..hasRequiredFields = false
  ;

  SubmitRentRequest._() : super();
  factory SubmitRentRequest({
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
    $core.String? createBy,
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
    if (createBy != null) {
      _result.createBy = createBy;
    }
    if (uuid != null) {
      _result.uuid = uuid;
    }
    if (releaseTime != null) {
      _result.releaseTime = releaseTime;
    }
    return _result;
  }
  factory SubmitRentRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory SubmitRentRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  SubmitRentRequest clone() => SubmitRentRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  SubmitRentRequest copyWith(void Function(SubmitRentRequest) updates) => super.copyWith((message) => updates(message as SubmitRentRequest)) as SubmitRentRequest; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static SubmitRentRequest create() => SubmitRentRequest._();
  SubmitRentRequest createEmptyInstance() => create();
  static $pb.PbList<SubmitRentRequest> createRepeated() => $pb.PbList<SubmitRentRequest>();
  @$core.pragma('dart2js:noInline')
  static SubmitRentRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<SubmitRentRequest>(create);
  static SubmitRentRequest? _defaultInstance;

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
  $core.String get createBy => $_getSZ(10);
  @$pb.TagNumber(11)
  set createBy($core.String v) { $_setString(10, v); }
  @$pb.TagNumber(11)
  $core.bool hasCreateBy() => $_has(10);
  @$pb.TagNumber(11)
  void clearCreateBy() => clearField(11);

  @$pb.TagNumber(12)
  $core.String get uuid => $_getSZ(11);
  @$pb.TagNumber(12)
  set uuid($core.String v) { $_setString(11, v); }
  @$pb.TagNumber(12)
  $core.bool hasUuid() => $_has(11);
  @$pb.TagNumber(12)
  void clearUuid() => clearField(12);

  @$pb.TagNumber(13)
  $core.String get releaseTime => $_getSZ(12);
  @$pb.TagNumber(13)
  set releaseTime($core.String v) { $_setString(12, v); }
  @$pb.TagNumber(13)
  $core.bool hasReleaseTime() => $_has(12);
  @$pb.TagNumber(13)
  void clearReleaseTime() => clearField(13);
}

class SubmitHelpRequest extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'SubmitHelpRequest', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'easyrent.post'), createEmptyInstance: create)
    ..aOS(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'name')
    ..aOS(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'phone')
    ..aOS(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'expectedAddr')
    ..a<$core.int>(4, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'expectedPrice', $pb.PbFieldType.O3)
    ..aOS(5, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'demands')
    ..aOS(6, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'createBy')
    ..aOS(7, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'uuid')
    ..aOS(8, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'releaseTime')
    ..hasRequiredFields = false
  ;

  SubmitHelpRequest._() : super();
  factory SubmitHelpRequest({
    $core.String? name,
    $core.String? phone,
    $core.String? expectedAddr,
    $core.int? expectedPrice,
    $core.String? demands,
    $core.String? createBy,
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
    if (createBy != null) {
      _result.createBy = createBy;
    }
    if (uuid != null) {
      _result.uuid = uuid;
    }
    if (releaseTime != null) {
      _result.releaseTime = releaseTime;
    }
    return _result;
  }
  factory SubmitHelpRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory SubmitHelpRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  SubmitHelpRequest clone() => SubmitHelpRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  SubmitHelpRequest copyWith(void Function(SubmitHelpRequest) updates) => super.copyWith((message) => updates(message as SubmitHelpRequest)) as SubmitHelpRequest; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static SubmitHelpRequest create() => SubmitHelpRequest._();
  SubmitHelpRequest createEmptyInstance() => create();
  static $pb.PbList<SubmitHelpRequest> createRepeated() => $pb.PbList<SubmitHelpRequest>();
  @$core.pragma('dart2js:noInline')
  static SubmitHelpRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<SubmitHelpRequest>(create);
  static SubmitHelpRequest? _defaultInstance;

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
  $core.String get createBy => $_getSZ(5);
  @$pb.TagNumber(6)
  set createBy($core.String v) { $_setString(5, v); }
  @$pb.TagNumber(6)
  $core.bool hasCreateBy() => $_has(5);
  @$pb.TagNumber(6)
  void clearCreateBy() => clearField(6);

  @$pb.TagNumber(7)
  $core.String get uuid => $_getSZ(6);
  @$pb.TagNumber(7)
  set uuid($core.String v) { $_setString(6, v); }
  @$pb.TagNumber(7)
  $core.bool hasUuid() => $_has(6);
  @$pb.TagNumber(7)
  void clearUuid() => clearField(7);

  @$pb.TagNumber(8)
  $core.String get releaseTime => $_getSZ(7);
  @$pb.TagNumber(8)
  set releaseTime($core.String v) { $_setString(7, v); }
  @$pb.TagNumber(8)
  $core.bool hasReleaseTime() => $_has(7);
  @$pb.TagNumber(8)
  void clearReleaseTime() => clearField(8);
}

class SubmitReply extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'SubmitReply', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'easyrent.post'), createEmptyInstance: create)
    ..aOB(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'success')
    ..hasRequiredFields = false
  ;

  SubmitReply._() : super();
  factory SubmitReply({
    $core.bool? success,
  }) {
    final _result = create();
    if (success != null) {
      _result.success = success;
    }
    return _result;
  }
  factory SubmitReply.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory SubmitReply.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  SubmitReply clone() => SubmitReply()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  SubmitReply copyWith(void Function(SubmitReply) updates) => super.copyWith((message) => updates(message as SubmitReply)) as SubmitReply; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static SubmitReply create() => SubmitReply._();
  SubmitReply createEmptyInstance() => create();
  static $pb.PbList<SubmitReply> createRepeated() => $pb.PbList<SubmitReply>();
  @$core.pragma('dart2js:noInline')
  static SubmitReply getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<SubmitReply>(create);
  static SubmitReply? _defaultInstance;

  @$pb.TagNumber(1)
  $core.bool get success => $_getBF(0);
  @$pb.TagNumber(1)
  set success($core.bool v) { $_setBool(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasSuccess() => $_has(0);
  @$pb.TagNumber(1)
  void clearSuccess() => clearField(1);
}


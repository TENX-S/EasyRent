///
//  Generated code. Do not modify.
//  source: cmd.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,unnecessary_const,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type,unnecessary_this,prefer_final_fields

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

class LoadAgentsRequest extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'LoadAgentsRequest', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'easyrent.admin.command'), createEmptyInstance: create)
    ..hasRequiredFields = false
  ;

  LoadAgentsRequest._() : super();
  factory LoadAgentsRequest() => create();
  factory LoadAgentsRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory LoadAgentsRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  LoadAgentsRequest clone() => LoadAgentsRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  LoadAgentsRequest copyWith(void Function(LoadAgentsRequest) updates) => super.copyWith((message) => updates(message as LoadAgentsRequest)) as LoadAgentsRequest; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static LoadAgentsRequest create() => LoadAgentsRequest._();
  LoadAgentsRequest createEmptyInstance() => create();
  static $pb.PbList<LoadAgentsRequest> createRepeated() => $pb.PbList<LoadAgentsRequest>();
  @$core.pragma('dart2js:noInline')
  static LoadAgentsRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<LoadAgentsRequest>(create);
  static LoadAgentsRequest? _defaultInstance;
}

class LoadRentPostsRequest extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'LoadRentPostsRequest', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'easyrent.admin.command'), createEmptyInstance: create)
    ..hasRequiredFields = false
  ;

  LoadRentPostsRequest._() : super();
  factory LoadRentPostsRequest() => create();
  factory LoadRentPostsRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory LoadRentPostsRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  LoadRentPostsRequest clone() => LoadRentPostsRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  LoadRentPostsRequest copyWith(void Function(LoadRentPostsRequest) updates) => super.copyWith((message) => updates(message as LoadRentPostsRequest)) as LoadRentPostsRequest; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static LoadRentPostsRequest create() => LoadRentPostsRequest._();
  LoadRentPostsRequest createEmptyInstance() => create();
  static $pb.PbList<LoadRentPostsRequest> createRepeated() => $pb.PbList<LoadRentPostsRequest>();
  @$core.pragma('dart2js:noInline')
  static LoadRentPostsRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<LoadRentPostsRequest>(create);
  static LoadRentPostsRequest? _defaultInstance;
}

class LoadHelpPostsRequest extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'LoadHelpPostsRequest', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'easyrent.admin.command'), createEmptyInstance: create)
    ..hasRequiredFields = false
  ;

  LoadHelpPostsRequest._() : super();
  factory LoadHelpPostsRequest() => create();
  factory LoadHelpPostsRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory LoadHelpPostsRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  LoadHelpPostsRequest clone() => LoadHelpPostsRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  LoadHelpPostsRequest copyWith(void Function(LoadHelpPostsRequest) updates) => super.copyWith((message) => updates(message as LoadHelpPostsRequest)) as LoadHelpPostsRequest; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static LoadHelpPostsRequest create() => LoadHelpPostsRequest._();
  LoadHelpPostsRequest createEmptyInstance() => create();
  static $pb.PbList<LoadHelpPostsRequest> createRepeated() => $pb.PbList<LoadHelpPostsRequest>();
  @$core.pragma('dart2js:noInline')
  static LoadHelpPostsRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<LoadHelpPostsRequest>(create);
  static LoadHelpPostsRequest? _defaultInstance;
}

class passAgentRequest extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'passAgentRequest', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'easyrent.admin.command'), createEmptyInstance: create)
    ..aOS(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'name')
    ..hasRequiredFields = false
  ;

  passAgentRequest._() : super();
  factory passAgentRequest({
    $core.String? name,
  }) {
    final _result = create();
    if (name != null) {
      _result.name = name;
    }
    return _result;
  }
  factory passAgentRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory passAgentRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  passAgentRequest clone() => passAgentRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  passAgentRequest copyWith(void Function(passAgentRequest) updates) => super.copyWith((message) => updates(message as passAgentRequest)) as passAgentRequest; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static passAgentRequest create() => passAgentRequest._();
  passAgentRequest createEmptyInstance() => create();
  static $pb.PbList<passAgentRequest> createRepeated() => $pb.PbList<passAgentRequest>();
  @$core.pragma('dart2js:noInline')
  static passAgentRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<passAgentRequest>(create);
  static passAgentRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get name => $_getSZ(0);
  @$pb.TagNumber(1)
  set name($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasName() => $_has(0);
  @$pb.TagNumber(1)
  void clearName() => clearField(1);
}

class passPostRequest extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'passPostRequest', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'easyrent.admin.command'), createEmptyInstance: create)
    ..aOS(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'uuid')
    ..hasRequiredFields = false
  ;

  passPostRequest._() : super();
  factory passPostRequest({
    $core.String? uuid,
  }) {
    final _result = create();
    if (uuid != null) {
      _result.uuid = uuid;
    }
    return _result;
  }
  factory passPostRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory passPostRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  passPostRequest clone() => passPostRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  passPostRequest copyWith(void Function(passPostRequest) updates) => super.copyWith((message) => updates(message as passPostRequest)) as passPostRequest; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static passPostRequest create() => passPostRequest._();
  passPostRequest createEmptyInstance() => create();
  static $pb.PbList<passPostRequest> createRepeated() => $pb.PbList<passPostRequest>();
  @$core.pragma('dart2js:noInline')
  static passPostRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<passPostRequest>(create);
  static passPostRequest? _defaultInstance;

  @$pb.TagNumber(2)
  $core.String get uuid => $_getSZ(0);
  @$pb.TagNumber(2)
  set uuid($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(2)
  $core.bool hasUuid() => $_has(0);
  @$pb.TagNumber(2)
  void clearUuid() => clearField(2);
}

class passReply extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'passReply', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'easyrent.admin.command'), createEmptyInstance: create)
    ..aOB(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'success')
    ..hasRequiredFields = false
  ;

  passReply._() : super();
  factory passReply({
    $core.bool? success,
  }) {
    final _result = create();
    if (success != null) {
      _result.success = success;
    }
    return _result;
  }
  factory passReply.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory passReply.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  passReply clone() => passReply()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  passReply copyWith(void Function(passReply) updates) => super.copyWith((message) => updates(message as passReply)) as passReply; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static passReply create() => passReply._();
  passReply createEmptyInstance() => create();
  static $pb.PbList<passReply> createRepeated() => $pb.PbList<passReply>();
  @$core.pragma('dart2js:noInline')
  static passReply getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<passReply>(create);
  static passReply? _defaultInstance;

  @$pb.TagNumber(1)
  $core.bool get success => $_getBF(0);
  @$pb.TagNumber(1)
  set success($core.bool v) { $_setBool(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasSuccess() => $_has(0);
  @$pb.TagNumber(1)
  void clearSuccess() => clearField(1);
}

class UnverifiedAgent extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'UnverifiedAgent', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'easyrent.admin.command'), createEmptyInstance: create)
    ..aOS(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'corp')
    ..aOS(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'corpId')
    ..aOS(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'comRegdAddr')
    ..aOS(4, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'contact')
    ..aOS(5, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'name')
    ..hasRequiredFields = false
  ;

  UnverifiedAgent._() : super();
  factory UnverifiedAgent({
    $core.String? corp,
    $core.String? corpId,
    $core.String? comRegdAddr,
    $core.String? contact,
    $core.String? name,
  }) {
    final _result = create();
    if (corp != null) {
      _result.corp = corp;
    }
    if (corpId != null) {
      _result.corpId = corpId;
    }
    if (comRegdAddr != null) {
      _result.comRegdAddr = comRegdAddr;
    }
    if (contact != null) {
      _result.contact = contact;
    }
    if (name != null) {
      _result.name = name;
    }
    return _result;
  }
  factory UnverifiedAgent.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory UnverifiedAgent.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  UnverifiedAgent clone() => UnverifiedAgent()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  UnverifiedAgent copyWith(void Function(UnverifiedAgent) updates) => super.copyWith((message) => updates(message as UnverifiedAgent)) as UnverifiedAgent; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static UnverifiedAgent create() => UnverifiedAgent._();
  UnverifiedAgent createEmptyInstance() => create();
  static $pb.PbList<UnverifiedAgent> createRepeated() => $pb.PbList<UnverifiedAgent>();
  @$core.pragma('dart2js:noInline')
  static UnverifiedAgent getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<UnverifiedAgent>(create);
  static UnverifiedAgent? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get corp => $_getSZ(0);
  @$pb.TagNumber(1)
  set corp($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasCorp() => $_has(0);
  @$pb.TagNumber(1)
  void clearCorp() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get corpId => $_getSZ(1);
  @$pb.TagNumber(2)
  set corpId($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasCorpId() => $_has(1);
  @$pb.TagNumber(2)
  void clearCorpId() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get comRegdAddr => $_getSZ(2);
  @$pb.TagNumber(3)
  set comRegdAddr($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasComRegdAddr() => $_has(2);
  @$pb.TagNumber(3)
  void clearComRegdAddr() => clearField(3);

  @$pb.TagNumber(4)
  $core.String get contact => $_getSZ(3);
  @$pb.TagNumber(4)
  set contact($core.String v) { $_setString(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasContact() => $_has(3);
  @$pb.TagNumber(4)
  void clearContact() => clearField(4);

  @$pb.TagNumber(5)
  $core.String get name => $_getSZ(4);
  @$pb.TagNumber(5)
  set name($core.String v) { $_setString(4, v); }
  @$pb.TagNumber(5)
  $core.bool hasName() => $_has(4);
  @$pb.TagNumber(5)
  void clearName() => clearField(5);
}

class UnverifiedRentPost extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'UnverifiedRentPost', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'easyrent.admin.command'), createEmptyInstance: create)
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

  UnverifiedRentPost._() : super();
  factory UnverifiedRentPost({
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
  factory UnverifiedRentPost.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory UnverifiedRentPost.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  UnverifiedRentPost clone() => UnverifiedRentPost()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  UnverifiedRentPost copyWith(void Function(UnverifiedRentPost) updates) => super.copyWith((message) => updates(message as UnverifiedRentPost)) as UnverifiedRentPost; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static UnverifiedRentPost create() => UnverifiedRentPost._();
  UnverifiedRentPost createEmptyInstance() => create();
  static $pb.PbList<UnverifiedRentPost> createRepeated() => $pb.PbList<UnverifiedRentPost>();
  @$core.pragma('dart2js:noInline')
  static UnverifiedRentPost getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<UnverifiedRentPost>(create);
  static UnverifiedRentPost? _defaultInstance;

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

class UnverifiedHelpPost extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'UnverifiedHelpPost', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'easyrent.admin.command'), createEmptyInstance: create)
    ..aOS(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'name')
    ..aOS(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'phone')
    ..aOS(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'expectedAddr')
    ..a<$core.int>(4, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'expectedPrice', $pb.PbFieldType.O3)
    ..aOS(5, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'demands')
    ..aOS(6, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'uuid')
    ..aOS(7, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'releaseTime')
    ..hasRequiredFields = false
  ;

  UnverifiedHelpPost._() : super();
  factory UnverifiedHelpPost({
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
  factory UnverifiedHelpPost.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory UnverifiedHelpPost.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  UnverifiedHelpPost clone() => UnverifiedHelpPost()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  UnverifiedHelpPost copyWith(void Function(UnverifiedHelpPost) updates) => super.copyWith((message) => updates(message as UnverifiedHelpPost)) as UnverifiedHelpPost; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static UnverifiedHelpPost create() => UnverifiedHelpPost._();
  UnverifiedHelpPost createEmptyInstance() => create();
  static $pb.PbList<UnverifiedHelpPost> createRepeated() => $pb.PbList<UnverifiedHelpPost>();
  @$core.pragma('dart2js:noInline')
  static UnverifiedHelpPost getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<UnverifiedHelpPost>(create);
  static UnverifiedHelpPost? _defaultInstance;

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

class RentPosts extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'RentPosts', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'easyrent.admin.command'), createEmptyInstance: create)
    ..pc<UnverifiedRentPost>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'rentPosts', $pb.PbFieldType.PM, subBuilder: UnverifiedRentPost.create)
    ..hasRequiredFields = false
  ;

  RentPosts._() : super();
  factory RentPosts({
    $core.Iterable<UnverifiedRentPost>? rentPosts,
  }) {
    final _result = create();
    if (rentPosts != null) {
      _result.rentPosts.addAll(rentPosts);
    }
    return _result;
  }
  factory RentPosts.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory RentPosts.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  RentPosts clone() => RentPosts()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  RentPosts copyWith(void Function(RentPosts) updates) => super.copyWith((message) => updates(message as RentPosts)) as RentPosts; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static RentPosts create() => RentPosts._();
  RentPosts createEmptyInstance() => create();
  static $pb.PbList<RentPosts> createRepeated() => $pb.PbList<RentPosts>();
  @$core.pragma('dart2js:noInline')
  static RentPosts getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<RentPosts>(create);
  static RentPosts? _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<UnverifiedRentPost> get rentPosts => $_getList(0);
}

class HelpPosts extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'HelpPosts', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'easyrent.admin.command'), createEmptyInstance: create)
    ..pc<UnverifiedHelpPost>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'helpPosts', $pb.PbFieldType.PM, subBuilder: UnverifiedHelpPost.create)
    ..hasRequiredFields = false
  ;

  HelpPosts._() : super();
  factory HelpPosts({
    $core.Iterable<UnverifiedHelpPost>? helpPosts,
  }) {
    final _result = create();
    if (helpPosts != null) {
      _result.helpPosts.addAll(helpPosts);
    }
    return _result;
  }
  factory HelpPosts.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory HelpPosts.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  HelpPosts clone() => HelpPosts()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  HelpPosts copyWith(void Function(HelpPosts) updates) => super.copyWith((message) => updates(message as HelpPosts)) as HelpPosts; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static HelpPosts create() => HelpPosts._();
  HelpPosts createEmptyInstance() => create();
  static $pb.PbList<HelpPosts> createRepeated() => $pb.PbList<HelpPosts>();
  @$core.pragma('dart2js:noInline')
  static HelpPosts getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<HelpPosts>(create);
  static HelpPosts? _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<UnverifiedHelpPost> get helpPosts => $_getList(0);
}

class Agents extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'Agents', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'easyrent.admin.command'), createEmptyInstance: create)
    ..pc<UnverifiedAgent>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'agent', $pb.PbFieldType.PM, subBuilder: UnverifiedAgent.create)
    ..hasRequiredFields = false
  ;

  Agents._() : super();
  factory Agents({
    $core.Iterable<UnverifiedAgent>? agent,
  }) {
    final _result = create();
    if (agent != null) {
      _result.agent.addAll(agent);
    }
    return _result;
  }
  factory Agents.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory Agents.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  Agents clone() => Agents()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  Agents copyWith(void Function(Agents) updates) => super.copyWith((message) => updates(message as Agents)) as Agents; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static Agents create() => Agents._();
  Agents createEmptyInstance() => create();
  static $pb.PbList<Agents> createRepeated() => $pb.PbList<Agents>();
  @$core.pragma('dart2js:noInline')
  static Agents getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<Agents>(create);
  static Agents? _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<UnverifiedAgent> get agent => $_getList(0);
}


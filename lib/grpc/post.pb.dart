///
//  Generated code. Do not modify.
//  source: post.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,unnecessary_const,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type,unnecessary_this,prefer_final_fields

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

class SubmitRequest extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'SubmitRequest', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'easyrent.post'), createEmptyInstance: create)
    ..hasRequiredFields = false
  ;

  SubmitRequest._() : super();
  factory SubmitRequest() => create();
  factory SubmitRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory SubmitRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  SubmitRequest clone() => SubmitRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  SubmitRequest copyWith(void Function(SubmitRequest) updates) => super.copyWith((message) => updates(message as SubmitRequest)) as SubmitRequest; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static SubmitRequest create() => SubmitRequest._();
  SubmitRequest createEmptyInstance() => create();
  static $pb.PbList<SubmitRequest> createRepeated() => $pb.PbList<SubmitRequest>();
  @$core.pragma('dart2js:noInline')
  static SubmitRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<SubmitRequest>(create);
  static SubmitRequest? _defaultInstance;
}

class SubmitReply extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'SubmitReply', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'easyrent.post'), createEmptyInstance: create)
    ..hasRequiredFields = false
  ;

  SubmitReply._() : super();
  factory SubmitReply() => create();
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
}


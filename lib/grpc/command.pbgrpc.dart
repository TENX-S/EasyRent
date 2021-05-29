///
//  Generated code. Do not modify.
//  source: command.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,unnecessary_const,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type,unnecessary_this,prefer_final_fields

import 'dart:async' as $async;

import 'dart:core' as $core;

import 'package:grpc/service_api.dart' as $grpc;
import 'command.pb.dart' as $1;
export 'command.pb.dart';

class CommandClient extends $grpc.Client {
  static final _$onLoad = $grpc.ClientMethod<$1.LoadRequest, $1.LoadReply>(
      '/easyrent.command.Command/OnLoad',
      ($1.LoadRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $1.LoadReply.fromBuffer(value));
  static final _$onRefresh =
      $grpc.ClientMethod<$1.RefreshRequest, $1.RefreshReply>(
          '/easyrent.command.Command/OnRefresh',
          ($1.RefreshRequest value) => value.writeToBuffer(),
          ($core.List<$core.int> value) => $1.RefreshReply.fromBuffer(value));
  static final _$onSearch =
      $grpc.ClientMethod<$1.SearchRequest, $1.SearchReply>(
          '/easyrent.command.Command/OnSearch',
          ($1.SearchRequest value) => value.writeToBuffer(),
          ($core.List<$core.int> value) => $1.SearchReply.fromBuffer(value));
  static final _$onLogout =
      $grpc.ClientMethod<$1.LogoutRequest, $1.LogoutReply>(
          '/easyrent.command.Command/OnLogout',
          ($1.LogoutRequest value) => value.writeToBuffer(),
          ($core.List<$core.int> value) => $1.LogoutReply.fromBuffer(value));

  CommandClient($grpc.ClientChannel channel,
      {$grpc.CallOptions? options,
      $core.Iterable<$grpc.ClientInterceptor>? interceptors})
      : super(channel, options: options, interceptors: interceptors);

  $grpc.ResponseFuture<$1.LoadReply> onLoad($1.LoadRequest request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$onLoad, request, options: options);
  }

  $grpc.ResponseFuture<$1.RefreshReply> onRefresh($1.RefreshRequest request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$onRefresh, request, options: options);
  }

  $grpc.ResponseFuture<$1.SearchReply> onSearch($1.SearchRequest request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$onSearch, request, options: options);
  }

  $grpc.ResponseFuture<$1.LogoutReply> onLogout($1.LogoutRequest request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$onLogout, request, options: options);
  }
}

abstract class CommandServiceBase extends $grpc.Service {
  $core.String get $name => 'easyrent.command.Command';

  CommandServiceBase() {
    $addMethod($grpc.ServiceMethod<$1.LoadRequest, $1.LoadReply>(
        'OnLoad',
        onLoad_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $1.LoadRequest.fromBuffer(value),
        ($1.LoadReply value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$1.RefreshRequest, $1.RefreshReply>(
        'OnRefresh',
        onRefresh_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $1.RefreshRequest.fromBuffer(value),
        ($1.RefreshReply value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$1.SearchRequest, $1.SearchReply>(
        'OnSearch',
        onSearch_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $1.SearchRequest.fromBuffer(value),
        ($1.SearchReply value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$1.LogoutRequest, $1.LogoutReply>(
        'OnLogout',
        onLogout_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $1.LogoutRequest.fromBuffer(value),
        ($1.LogoutReply value) => value.writeToBuffer()));
  }

  $async.Future<$1.LoadReply> onLoad_Pre(
      $grpc.ServiceCall call, $async.Future<$1.LoadRequest> request) async {
    return onLoad(call, await request);
  }

  $async.Future<$1.RefreshReply> onRefresh_Pre(
      $grpc.ServiceCall call, $async.Future<$1.RefreshRequest> request) async {
    return onRefresh(call, await request);
  }

  $async.Future<$1.SearchReply> onSearch_Pre(
      $grpc.ServiceCall call, $async.Future<$1.SearchRequest> request) async {
    return onSearch(call, await request);
  }

  $async.Future<$1.LogoutReply> onLogout_Pre(
      $grpc.ServiceCall call, $async.Future<$1.LogoutRequest> request) async {
    return onLogout(call, await request);
  }

  $async.Future<$1.LoadReply> onLoad(
      $grpc.ServiceCall call, $1.LoadRequest request);
  $async.Future<$1.RefreshReply> onRefresh(
      $grpc.ServiceCall call, $1.RefreshRequest request);
  $async.Future<$1.SearchReply> onSearch(
      $grpc.ServiceCall call, $1.SearchRequest request);
  $async.Future<$1.LogoutReply> onLogout(
      $grpc.ServiceCall call, $1.LogoutRequest request);
}

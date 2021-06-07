///
//  Generated code. Do not modify.
//  source: command.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,unnecessary_const,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type,unnecessary_this,prefer_final_fields

import 'dart:async' as $async;

import 'dart:core' as $core;

import 'package:grpc/service_api.dart' as $grpc;
import 'command.pb.dart' as $4;
export 'command.pb.dart';

class CommandClient extends $grpc.Client {
  static final _$onLoad = $grpc.ClientMethod<$4.LoadRequest, $4.LoadReply>(
      '/easyrent.command.Command/OnLoad',
      ($4.LoadRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $4.LoadReply.fromBuffer(value));
  static final _$onRefresh =
      $grpc.ClientMethod<$4.RefreshRequest, $4.RefreshReply>(
          '/easyrent.command.Command/OnRefresh',
          ($4.RefreshRequest value) => value.writeToBuffer(),
          ($core.List<$core.int> value) => $4.RefreshReply.fromBuffer(value));
  static final _$onSearch =
      $grpc.ClientMethod<$4.SearchRequest, $4.SearchReply>(
          '/easyrent.command.Command/OnSearch',
          ($4.SearchRequest value) => value.writeToBuffer(),
          ($core.List<$core.int> value) => $4.SearchReply.fromBuffer(value));
  static final _$onLogout =
      $grpc.ClientMethod<$4.LogoutRequest, $4.LogoutReply>(
          '/easyrent.command.Command/OnLogout',
          ($4.LogoutRequest value) => value.writeToBuffer(),
          ($core.List<$core.int> value) => $4.LogoutReply.fromBuffer(value));

  CommandClient($grpc.ClientChannel channel,
      {$grpc.CallOptions? options,
      $core.Iterable<$grpc.ClientInterceptor>? interceptors})
      : super(channel, options: options, interceptors: interceptors);

  $grpc.ResponseFuture<$4.LoadReply> onLoad($4.LoadRequest request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$onLoad, request, options: options);
  }

  $grpc.ResponseFuture<$4.RefreshReply> onRefresh($4.RefreshRequest request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$onRefresh, request, options: options);
  }

  $grpc.ResponseFuture<$4.SearchReply> onSearch($4.SearchRequest request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$onSearch, request, options: options);
  }

  $grpc.ResponseFuture<$4.LogoutReply> onLogout($4.LogoutRequest request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$onLogout, request, options: options);
  }
}

abstract class CommandServiceBase extends $grpc.Service {
  $core.String get $name => 'easyrent.command.Command';

  CommandServiceBase() {
    $addMethod($grpc.ServiceMethod<$4.LoadRequest, $4.LoadReply>(
        'OnLoad',
        onLoad_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $4.LoadRequest.fromBuffer(value),
        ($4.LoadReply value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$4.RefreshRequest, $4.RefreshReply>(
        'OnRefresh',
        onRefresh_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $4.RefreshRequest.fromBuffer(value),
        ($4.RefreshReply value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$4.SearchRequest, $4.SearchReply>(
        'OnSearch',
        onSearch_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $4.SearchRequest.fromBuffer(value),
        ($4.SearchReply value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$4.LogoutRequest, $4.LogoutReply>(
        'OnLogout',
        onLogout_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $4.LogoutRequest.fromBuffer(value),
        ($4.LogoutReply value) => value.writeToBuffer()));
  }

  $async.Future<$4.LoadReply> onLoad_Pre(
      $grpc.ServiceCall call, $async.Future<$4.LoadRequest> request) async {
    return onLoad(call, await request);
  }

  $async.Future<$4.RefreshReply> onRefresh_Pre(
      $grpc.ServiceCall call, $async.Future<$4.RefreshRequest> request) async {
    return onRefresh(call, await request);
  }

  $async.Future<$4.SearchReply> onSearch_Pre(
      $grpc.ServiceCall call, $async.Future<$4.SearchRequest> request) async {
    return onSearch(call, await request);
  }

  $async.Future<$4.LogoutReply> onLogout_Pre(
      $grpc.ServiceCall call, $async.Future<$4.LogoutRequest> request) async {
    return onLogout(call, await request);
  }

  $async.Future<$4.LoadReply> onLoad(
      $grpc.ServiceCall call, $4.LoadRequest request);
  $async.Future<$4.RefreshReply> onRefresh(
      $grpc.ServiceCall call, $4.RefreshRequest request);
  $async.Future<$4.SearchReply> onSearch(
      $grpc.ServiceCall call, $4.SearchRequest request);
  $async.Future<$4.LogoutReply> onLogout(
      $grpc.ServiceCall call, $4.LogoutRequest request);
}

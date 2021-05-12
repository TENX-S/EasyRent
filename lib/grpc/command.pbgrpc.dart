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

class commandClient extends $grpc.Client {
  static final _$onRefresh =
      $grpc.ClientMethod<$1.RefreshRequest, $1.RefreshReply>(
          '/easyrent.command.command/OnRefresh',
          ($1.RefreshRequest value) => value.writeToBuffer(),
          ($core.List<$core.int> value) => $1.RefreshReply.fromBuffer(value));
  static final _$onFetch = $grpc.ClientMethod<$1.FetchRequest, $1.FetchReply>(
      '/easyrent.command.command/OnFetch',
      ($1.FetchRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $1.FetchReply.fromBuffer(value));
  static final _$onLogout =
      $grpc.ClientMethod<$1.LogoutRequest, $1.LogoutReply>(
          '/easyrent.command.command/OnLogout',
          ($1.LogoutRequest value) => value.writeToBuffer(),
          ($core.List<$core.int> value) => $1.LogoutReply.fromBuffer(value));

  commandClient($grpc.ClientChannel channel,
      {$grpc.CallOptions? options,
      $core.Iterable<$grpc.ClientInterceptor>? interceptors})
      : super(channel, options: options, interceptors: interceptors);

  $grpc.ResponseFuture<$1.RefreshReply> onRefresh($1.RefreshRequest request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$onRefresh, request, options: options);
  }

  $grpc.ResponseFuture<$1.FetchReply> onFetch($1.FetchRequest request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$onFetch, request, options: options);
  }

  $grpc.ResponseFuture<$1.LogoutReply> onLogout($1.LogoutRequest request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$onLogout, request, options: options);
  }
}

abstract class commandServiceBase extends $grpc.Service {
  $core.String get $name => 'easyrent.command.command';

  commandServiceBase() {
    $addMethod($grpc.ServiceMethod<$1.RefreshRequest, $1.RefreshReply>(
        'OnRefresh',
        onRefresh_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $1.RefreshRequest.fromBuffer(value),
        ($1.RefreshReply value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$1.FetchRequest, $1.FetchReply>(
        'OnFetch',
        onFetch_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $1.FetchRequest.fromBuffer(value),
        ($1.FetchReply value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$1.LogoutRequest, $1.LogoutReply>(
        'OnLogout',
        onLogout_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $1.LogoutRequest.fromBuffer(value),
        ($1.LogoutReply value) => value.writeToBuffer()));
  }

  $async.Future<$1.RefreshReply> onRefresh_Pre(
      $grpc.ServiceCall call, $async.Future<$1.RefreshRequest> request) async {
    return onRefresh(call, await request);
  }

  $async.Future<$1.FetchReply> onFetch_Pre(
      $grpc.ServiceCall call, $async.Future<$1.FetchRequest> request) async {
    return onFetch(call, await request);
  }

  $async.Future<$1.LogoutReply> onLogout_Pre(
      $grpc.ServiceCall call, $async.Future<$1.LogoutRequest> request) async {
    return onLogout(call, await request);
  }

  $async.Future<$1.RefreshReply> onRefresh(
      $grpc.ServiceCall call, $1.RefreshRequest request);
  $async.Future<$1.FetchReply> onFetch(
      $grpc.ServiceCall call, $1.FetchRequest request);
  $async.Future<$1.LogoutReply> onLogout(
      $grpc.ServiceCall call, $1.LogoutRequest request);
}

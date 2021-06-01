///
//  Generated code. Do not modify.
//  source: auth.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,unnecessary_const,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type,unnecessary_this,prefer_final_fields

import 'dart:async' as $async;

import 'dart:core' as $core;

import 'package:grpc/service_api.dart' as $grpc;
import 'auth.pb.dart' as $0;
export 'auth.pb.dart';

class AgentAuthClient extends $grpc.Client {
  static final _$onLogin = $grpc.ClientMethod<$0.LoginRequest, $0.LoginReply>(
      '/easyrent.agency.auth.AgentAuth/OnLogin',
      ($0.LoginRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $0.LoginReply.fromBuffer(value));
  static final _$onRegister =
      $grpc.ClientMethod<$0.RegisterRequest, $0.RegisterReply>(
          '/easyrent.agency.auth.AgentAuth/OnRegister',
          ($0.RegisterRequest value) => value.writeToBuffer(),
          ($core.List<$core.int> value) => $0.RegisterReply.fromBuffer(value));

  AgentAuthClient($grpc.ClientChannel channel,
      {$grpc.CallOptions? options,
      $core.Iterable<$grpc.ClientInterceptor>? interceptors})
      : super(channel, options: options, interceptors: interceptors);

  $grpc.ResponseFuture<$0.LoginReply> onLogin($0.LoginRequest request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$onLogin, request, options: options);
  }

  $grpc.ResponseFuture<$0.RegisterReply> onRegister($0.RegisterRequest request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$onRegister, request, options: options);
  }
}

abstract class AgentAuthServiceBase extends $grpc.Service {
  $core.String get $name => 'easyrent.agency.auth.AgentAuth';

  AgentAuthServiceBase() {
    $addMethod($grpc.ServiceMethod<$0.LoginRequest, $0.LoginReply>(
        'OnLogin',
        onLogin_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.LoginRequest.fromBuffer(value),
        ($0.LoginReply value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.RegisterRequest, $0.RegisterReply>(
        'OnRegister',
        onRegister_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.RegisterRequest.fromBuffer(value),
        ($0.RegisterReply value) => value.writeToBuffer()));
  }

  $async.Future<$0.LoginReply> onLogin_Pre(
      $grpc.ServiceCall call, $async.Future<$0.LoginRequest> request) async {
    return onLogin(call, await request);
  }

  $async.Future<$0.RegisterReply> onRegister_Pre(
      $grpc.ServiceCall call, $async.Future<$0.RegisterRequest> request) async {
    return onRegister(call, await request);
  }

  $async.Future<$0.LoginReply> onLogin(
      $grpc.ServiceCall call, $0.LoginRequest request);
  $async.Future<$0.RegisterReply> onRegister(
      $grpc.ServiceCall call, $0.RegisterRequest request);
}

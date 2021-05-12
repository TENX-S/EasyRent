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

class AuthenticateClient extends $grpc.Client {
  static final _$onLogin = $grpc.ClientMethod<$0.AuthRequest, $0.LoginReply>(
      '/easyrent.auth.Authenticate/OnLogin',
      ($0.AuthRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $0.LoginReply.fromBuffer(value));
  static final _$onRegister =
      $grpc.ClientMethod<$0.AuthRequest, $0.RegisterReply>(
          '/easyrent.auth.Authenticate/OnRegister',
          ($0.AuthRequest value) => value.writeToBuffer(),
          ($core.List<$core.int> value) => $0.RegisterReply.fromBuffer(value));

  AuthenticateClient($grpc.ClientChannel channel,
      {$grpc.CallOptions? options,
      $core.Iterable<$grpc.ClientInterceptor>? interceptors})
      : super(channel, options: options, interceptors: interceptors);

  $grpc.ResponseFuture<$0.LoginReply> onLogin($0.AuthRequest request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$onLogin, request, options: options);
  }

  $grpc.ResponseFuture<$0.RegisterReply> onRegister($0.AuthRequest request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$onRegister, request, options: options);
  }
}

abstract class AuthenticateServiceBase extends $grpc.Service {
  $core.String get $name => 'easyrent.auth.Authenticate';

  AuthenticateServiceBase() {
    $addMethod($grpc.ServiceMethod<$0.AuthRequest, $0.LoginReply>(
        'OnLogin',
        onLogin_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.AuthRequest.fromBuffer(value),
        ($0.LoginReply value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.AuthRequest, $0.RegisterReply>(
        'OnRegister',
        onRegister_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.AuthRequest.fromBuffer(value),
        ($0.RegisterReply value) => value.writeToBuffer()));
  }

  $async.Future<$0.LoginReply> onLogin_Pre(
      $grpc.ServiceCall call, $async.Future<$0.AuthRequest> request) async {
    return onLogin(call, await request);
  }

  $async.Future<$0.RegisterReply> onRegister_Pre(
      $grpc.ServiceCall call, $async.Future<$0.AuthRequest> request) async {
    return onRegister(call, await request);
  }

  $async.Future<$0.LoginReply> onLogin(
      $grpc.ServiceCall call, $0.AuthRequest request);
  $async.Future<$0.RegisterReply> onRegister(
      $grpc.ServiceCall call, $0.AuthRequest request);
}

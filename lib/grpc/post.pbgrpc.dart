///
//  Generated code. Do not modify.
//  source: post.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,unnecessary_const,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type,unnecessary_this,prefer_final_fields

import 'dart:async' as $async;

import 'dart:core' as $core;

import 'package:grpc/service_api.dart' as $grpc;
import 'post.pb.dart' as $2;
export 'post.pb.dart';

class PostClient extends $grpc.Client {
  static final _$onRent =
      $grpc.ClientMethod<$2.SubmitRentRequest, $2.SubmitReply>(
          '/easyrent.post.Post/OnRent',
          ($2.SubmitRentRequest value) => value.writeToBuffer(),
          ($core.List<$core.int> value) => $2.SubmitReply.fromBuffer(value));
  static final _$onHelp =
      $grpc.ClientMethod<$2.SubmitHelpRequest, $2.SubmitReply>(
          '/easyrent.post.Post/OnHelp',
          ($2.SubmitHelpRequest value) => value.writeToBuffer(),
          ($core.List<$core.int> value) => $2.SubmitReply.fromBuffer(value));

  PostClient($grpc.ClientChannel channel,
      {$grpc.CallOptions? options,
      $core.Iterable<$grpc.ClientInterceptor>? interceptors})
      : super(channel, options: options, interceptors: interceptors);

  $grpc.ResponseFuture<$2.SubmitReply> onRent($2.SubmitRentRequest request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$onRent, request, options: options);
  }

  $grpc.ResponseFuture<$2.SubmitReply> onHelp($2.SubmitHelpRequest request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$onHelp, request, options: options);
  }
}

abstract class PostServiceBase extends $grpc.Service {
  $core.String get $name => 'easyrent.post.Post';

  PostServiceBase() {
    $addMethod($grpc.ServiceMethod<$2.SubmitRentRequest, $2.SubmitReply>(
        'OnRent',
        onRent_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $2.SubmitRentRequest.fromBuffer(value),
        ($2.SubmitReply value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$2.SubmitHelpRequest, $2.SubmitReply>(
        'OnHelp',
        onHelp_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $2.SubmitHelpRequest.fromBuffer(value),
        ($2.SubmitReply value) => value.writeToBuffer()));
  }

  $async.Future<$2.SubmitReply> onRent_Pre($grpc.ServiceCall call,
      $async.Future<$2.SubmitRentRequest> request) async {
    return onRent(call, await request);
  }

  $async.Future<$2.SubmitReply> onHelp_Pre($grpc.ServiceCall call,
      $async.Future<$2.SubmitHelpRequest> request) async {
    return onHelp(call, await request);
  }

  $async.Future<$2.SubmitReply> onRent(
      $grpc.ServiceCall call, $2.SubmitRentRequest request);
  $async.Future<$2.SubmitReply> onHelp(
      $grpc.ServiceCall call, $2.SubmitHelpRequest request);
}

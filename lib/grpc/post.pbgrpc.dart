///
//  Generated code. Do not modify.
//  source: post.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,unnecessary_const,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type,unnecessary_this,prefer_final_fields

import 'dart:async' as $async;

import 'dart:core' as $core;

import 'package:grpc/service_api.dart' as $grpc;
import 'post.pb.dart' as $5;
export 'post.pb.dart';

class EmitClient extends $grpc.Client {
  static final _$onRent =
      $grpc.ClientMethod<$5.SubmitRentRequest, $5.SubmitReply>(
          '/easyrent.post.Emit/OnRent',
          ($5.SubmitRentRequest value) => value.writeToBuffer(),
          ($core.List<$core.int> value) => $5.SubmitReply.fromBuffer(value));
  static final _$onHelp =
      $grpc.ClientMethod<$5.SubmitHelpRequest, $5.SubmitReply>(
          '/easyrent.post.Emit/OnHelp',
          ($5.SubmitHelpRequest value) => value.writeToBuffer(),
          ($core.List<$core.int> value) => $5.SubmitReply.fromBuffer(value));

  EmitClient($grpc.ClientChannel channel,
      {$grpc.CallOptions? options,
      $core.Iterable<$grpc.ClientInterceptor>? interceptors})
      : super(channel, options: options, interceptors: interceptors);

  $grpc.ResponseFuture<$5.SubmitReply> onRent($5.SubmitRentRequest request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$onRent, request, options: options);
  }

  $grpc.ResponseFuture<$5.SubmitReply> onHelp($5.SubmitHelpRequest request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$onHelp, request, options: options);
  }
}

abstract class EmitServiceBase extends $grpc.Service {
  $core.String get $name => 'easyrent.post.Emit';

  EmitServiceBase() {
    $addMethod($grpc.ServiceMethod<$5.SubmitRentRequest, $5.SubmitReply>(
        'OnRent',
        onRent_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $5.SubmitRentRequest.fromBuffer(value),
        ($5.SubmitReply value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$5.SubmitHelpRequest, $5.SubmitReply>(
        'OnHelp',
        onHelp_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $5.SubmitHelpRequest.fromBuffer(value),
        ($5.SubmitReply value) => value.writeToBuffer()));
  }

  $async.Future<$5.SubmitReply> onRent_Pre($grpc.ServiceCall call,
      $async.Future<$5.SubmitRentRequest> request) async {
    return onRent(call, await request);
  }

  $async.Future<$5.SubmitReply> onHelp_Pre($grpc.ServiceCall call,
      $async.Future<$5.SubmitHelpRequest> request) async {
    return onHelp(call, await request);
  }

  $async.Future<$5.SubmitReply> onRent(
      $grpc.ServiceCall call, $5.SubmitRentRequest request);
  $async.Future<$5.SubmitReply> onHelp(
      $grpc.ServiceCall call, $5.SubmitHelpRequest request);
}

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

class postClient extends $grpc.Client {
  static final _$onSubmit =
      $grpc.ClientMethod<$2.SubmitRequest, $2.SubmitReply>(
          '/easyrent.post.post/OnSubmit',
          ($2.SubmitRequest value) => value.writeToBuffer(),
          ($core.List<$core.int> value) => $2.SubmitReply.fromBuffer(value));

  postClient($grpc.ClientChannel channel,
      {$grpc.CallOptions? options,
      $core.Iterable<$grpc.ClientInterceptor>? interceptors})
      : super(channel, options: options, interceptors: interceptors);

  $grpc.ResponseFuture<$2.SubmitReply> onSubmit($2.SubmitRequest request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$onSubmit, request, options: options);
  }
}

abstract class postServiceBase extends $grpc.Service {
  $core.String get $name => 'easyrent.post.post';

  postServiceBase() {
    $addMethod($grpc.ServiceMethod<$2.SubmitRequest, $2.SubmitReply>(
        'OnSubmit',
        onSubmit_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $2.SubmitRequest.fromBuffer(value),
        ($2.SubmitReply value) => value.writeToBuffer()));
  }

  $async.Future<$2.SubmitReply> onSubmit_Pre(
      $grpc.ServiceCall call, $async.Future<$2.SubmitRequest> request) async {
    return onSubmit(call, await request);
  }

  $async.Future<$2.SubmitReply> onSubmit(
      $grpc.ServiceCall call, $2.SubmitRequest request);
}

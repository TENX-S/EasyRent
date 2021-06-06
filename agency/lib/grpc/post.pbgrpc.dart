///
//  Generated code. Do not modify.
//  source: post.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,unnecessary_const,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type,unnecessary_this,prefer_final_fields

import 'dart:async' as $async;

import 'dart:core' as $core;

import 'package:grpc/service_api.dart' as $grpc;
import 'post.pb.dart' as $1;
export 'post.pb.dart';

class AgencyPostClient extends $grpc.Client {
  static final _$onRent = $grpc.ClientMethod<$1.RentRequest, $1.SubmitReply>(
      '/easyrent.agency.post.AgencyPost/OnRent',
      ($1.RentRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $1.SubmitReply.fromBuffer(value));
  static final _$onHelp = $grpc.ClientMethod<$1.HelpRequest, $1.SubmitReply>(
      '/easyrent.agency.post.AgencyPost/OnHelp',
      ($1.HelpRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $1.SubmitReply.fromBuffer(value));

  AgencyPostClient($grpc.ClientChannel channel,
      {$grpc.CallOptions? options,
      $core.Iterable<$grpc.ClientInterceptor>? interceptors})
      : super(channel, options: options, interceptors: interceptors);

  $grpc.ResponseFuture<$1.SubmitReply> onRent($1.RentRequest request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$onRent, request, options: options);
  }

  $grpc.ResponseFuture<$1.SubmitReply> onHelp($1.HelpRequest request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$onHelp, request, options: options);
  }
}

abstract class AgencyPostServiceBase extends $grpc.Service {
  $core.String get $name => 'easyrent.agency.post.AgencyPost';

  AgencyPostServiceBase() {
    $addMethod($grpc.ServiceMethod<$1.RentRequest, $1.SubmitReply>(
        'OnRent',
        onRent_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $1.RentRequest.fromBuffer(value),
        ($1.SubmitReply value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$1.HelpRequest, $1.SubmitReply>(
        'OnHelp',
        onHelp_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $1.HelpRequest.fromBuffer(value),
        ($1.SubmitReply value) => value.writeToBuffer()));
  }

  $async.Future<$1.SubmitReply> onRent_Pre(
      $grpc.ServiceCall call, $async.Future<$1.RentRequest> request) async {
    return onRent(call, await request);
  }

  $async.Future<$1.SubmitReply> onHelp_Pre(
      $grpc.ServiceCall call, $async.Future<$1.HelpRequest> request) async {
    return onHelp(call, await request);
  }

  $async.Future<$1.SubmitReply> onRent(
      $grpc.ServiceCall call, $1.RentRequest request);
  $async.Future<$1.SubmitReply> onHelp(
      $grpc.ServiceCall call, $1.HelpRequest request);
}

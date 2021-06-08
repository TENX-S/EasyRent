///
//  Generated code. Do not modify.
//  source: cmd.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,unnecessary_const,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type,unnecessary_this,prefer_final_fields

import 'dart:async' as $async;

import 'dart:core' as $core;

import 'package:grpc/service_api.dart' as $grpc;
import 'cmd.pb.dart' as $0;
export 'cmd.pb.dart';

class CommandClient extends $grpc.Client {
  static final _$loadUnverifiedAgents =
      $grpc.ClientMethod<$0.LoadAgentsRequest, $0.Agents>(
          '/easyrent.admin.command.Command/LoadUnverifiedAgents',
          ($0.LoadAgentsRequest value) => value.writeToBuffer(),
          ($core.List<$core.int> value) => $0.Agents.fromBuffer(value));
  static final _$loadUnverifiedRentPosts =
      $grpc.ClientMethod<$0.LoadRentPostsRequest, $0.RentPosts>(
          '/easyrent.admin.command.Command/LoadUnverifiedRentPosts',
          ($0.LoadRentPostsRequest value) => value.writeToBuffer(),
          ($core.List<$core.int> value) => $0.RentPosts.fromBuffer(value));
  static final _$loadUnverifiedHelpPosts =
      $grpc.ClientMethod<$0.LoadHelpPostsRequest, $0.HelpPosts>(
          '/easyrent.admin.command.Command/LoadUnverifiedHelpPosts',
          ($0.LoadHelpPostsRequest value) => value.writeToBuffer(),
          ($core.List<$core.int> value) => $0.HelpPosts.fromBuffer(value));
  static final _$passAgent =
      $grpc.ClientMethod<$0.passAgentRequest, $0.passReply>(
          '/easyrent.admin.command.Command/PassAgent',
          ($0.passAgentRequest value) => value.writeToBuffer(),
          ($core.List<$core.int> value) => $0.passReply.fromBuffer(value));
  static final _$passRentPost =
      $grpc.ClientMethod<$0.passPostRequest, $0.passReply>(
          '/easyrent.admin.command.Command/PassRentPost',
          ($0.passPostRequest value) => value.writeToBuffer(),
          ($core.List<$core.int> value) => $0.passReply.fromBuffer(value));
  static final _$passHelpPost =
      $grpc.ClientMethod<$0.passPostRequest, $0.passReply>(
          '/easyrent.admin.command.Command/PassHelpPost',
          ($0.passPostRequest value) => value.writeToBuffer(),
          ($core.List<$core.int> value) => $0.passReply.fromBuffer(value));

  CommandClient($grpc.ClientChannel channel,
      {$grpc.CallOptions? options,
      $core.Iterable<$grpc.ClientInterceptor>? interceptors})
      : super(channel, options: options, interceptors: interceptors);

  $grpc.ResponseFuture<$0.Agents> loadUnverifiedAgents(
      $0.LoadAgentsRequest request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$loadUnverifiedAgents, request, options: options);
  }

  $grpc.ResponseFuture<$0.RentPosts> loadUnverifiedRentPosts(
      $0.LoadRentPostsRequest request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$loadUnverifiedRentPosts, request,
        options: options);
  }

  $grpc.ResponseFuture<$0.HelpPosts> loadUnverifiedHelpPosts(
      $0.LoadHelpPostsRequest request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$loadUnverifiedHelpPosts, request,
        options: options);
  }

  $grpc.ResponseFuture<$0.passReply> passAgent($0.passAgentRequest request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$passAgent, request, options: options);
  }

  $grpc.ResponseFuture<$0.passReply> passRentPost($0.passPostRequest request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$passRentPost, request, options: options);
  }

  $grpc.ResponseFuture<$0.passReply> passHelpPost($0.passPostRequest request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$passHelpPost, request, options: options);
  }
}

abstract class CommandServiceBase extends $grpc.Service {
  $core.String get $name => 'easyrent.admin.command.Command';

  CommandServiceBase() {
    $addMethod($grpc.ServiceMethod<$0.LoadAgentsRequest, $0.Agents>(
        'LoadUnverifiedAgents',
        loadUnverifiedAgents_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.LoadAgentsRequest.fromBuffer(value),
        ($0.Agents value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.LoadRentPostsRequest, $0.RentPosts>(
        'LoadUnverifiedRentPosts',
        loadUnverifiedRentPosts_Pre,
        false,
        false,
        ($core.List<$core.int> value) =>
            $0.LoadRentPostsRequest.fromBuffer(value),
        ($0.RentPosts value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.LoadHelpPostsRequest, $0.HelpPosts>(
        'LoadUnverifiedHelpPosts',
        loadUnverifiedHelpPosts_Pre,
        false,
        false,
        ($core.List<$core.int> value) =>
            $0.LoadHelpPostsRequest.fromBuffer(value),
        ($0.HelpPosts value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.passAgentRequest, $0.passReply>(
        'PassAgent',
        passAgent_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.passAgentRequest.fromBuffer(value),
        ($0.passReply value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.passPostRequest, $0.passReply>(
        'PassRentPost',
        passRentPost_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.passPostRequest.fromBuffer(value),
        ($0.passReply value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.passPostRequest, $0.passReply>(
        'PassHelpPost',
        passHelpPost_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.passPostRequest.fromBuffer(value),
        ($0.passReply value) => value.writeToBuffer()));
  }

  $async.Future<$0.Agents> loadUnverifiedAgents_Pre($grpc.ServiceCall call,
      $async.Future<$0.LoadAgentsRequest> request) async {
    return loadUnverifiedAgents(call, await request);
  }

  $async.Future<$0.RentPosts> loadUnverifiedRentPosts_Pre(
      $grpc.ServiceCall call,
      $async.Future<$0.LoadRentPostsRequest> request) async {
    return loadUnverifiedRentPosts(call, await request);
  }

  $async.Future<$0.HelpPosts> loadUnverifiedHelpPosts_Pre(
      $grpc.ServiceCall call,
      $async.Future<$0.LoadHelpPostsRequest> request) async {
    return loadUnverifiedHelpPosts(call, await request);
  }

  $async.Future<$0.passReply> passAgent_Pre($grpc.ServiceCall call,
      $async.Future<$0.passAgentRequest> request) async {
    return passAgent(call, await request);
  }

  $async.Future<$0.passReply> passRentPost_Pre(
      $grpc.ServiceCall call, $async.Future<$0.passPostRequest> request) async {
    return passRentPost(call, await request);
  }

  $async.Future<$0.passReply> passHelpPost_Pre(
      $grpc.ServiceCall call, $async.Future<$0.passPostRequest> request) async {
    return passHelpPost(call, await request);
  }

  $async.Future<$0.Agents> loadUnverifiedAgents(
      $grpc.ServiceCall call, $0.LoadAgentsRequest request);
  $async.Future<$0.RentPosts> loadUnverifiedRentPosts(
      $grpc.ServiceCall call, $0.LoadRentPostsRequest request);
  $async.Future<$0.HelpPosts> loadUnverifiedHelpPosts(
      $grpc.ServiceCall call, $0.LoadHelpPostsRequest request);
  $async.Future<$0.passReply> passAgent(
      $grpc.ServiceCall call, $0.passAgentRequest request);
  $async.Future<$0.passReply> passRentPost(
      $grpc.ServiceCall call, $0.passPostRequest request);
  $async.Future<$0.passReply> passHelpPost(
      $grpc.ServiceCall call, $0.passPostRequest request);
}

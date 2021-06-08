import 'package:grpc/grpc_web.dart';
import 'package:admin/grpc/cmd.pb.dart';
import 'package:admin/grpc/cmd.pbgrpc.dart';

class CmdClient {
  String? serverAddr;
  int? serverPort;
  late CommandClient stub;
  late GrpcWebClientChannel channel;

  CmdClient({
    this.serverAddr,
    this.serverPort,
  }) {
    GrpcWebClientChannel channel = GrpcWebClientChannel.xhr(Uri.parse('http://$serverAddr:$serverPort'));
    stub = CommandClient(channel);
  }

  Future<Agents> onLoadUnverifiedAgents() async => await stub.loadUnverifiedAgents(LoadAgentsRequest());

  Future<RentPosts> onLoadUnverifiedRentPosts() async => await stub.loadUnverifiedRentPosts(LoadRentPostsRequest());

  Future<HelpPosts> onLoadUnverifiedHelpPosts() async => await stub.loadUnverifiedHelpPosts(LoadHelpPostsRequest());

  Future<passReply> onPassAgent(String name) async => await stub.passAgent(passAgentRequest(name: name));

  Future<passReply> onPassRentPost(String uuid) async => await stub.passRentPost(passPostRequest(uuid: uuid));

  Future<passReply> onPassHelpPost(String uuid) async => await stub.passHelpPost(passPostRequest(uuid: uuid));
}


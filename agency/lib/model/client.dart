import 'package:grpc/grpc_web.dart';
import 'package:agency/model/agent.dart';
import 'package:agency/model/post.dart';
import 'package:agency/grpc/auth.pb.dart';
import 'package:agency/grpc/auth.pbgrpc.dart';
import 'package:agency/grpc/post.pb.dart';
import 'package:agency/grpc/post.pbgrpc.dart';

abstract class Client {
  String? serverAddr;
  int? serverPort;

  Client({
    this.serverAddr,
    this.serverPort,
  });
}

class AuthClient extends Client {
  late AgentAuthClient stub;
  late GrpcWebClientChannel channel;

  AuthClient({
    String? serverAddr,
    int? serverPort,
  }) : super(
    serverAddr: serverAddr,
    serverPort: serverPort,
  ) {
    GrpcWebClientChannel channel = GrpcWebClientChannel.xhr(Uri.parse('http://$serverAddr:$serverPort'));
    stub = AgentAuthClient(channel);
  }

  Future<LoginReply> onLogin(Agent agent) async => await stub.onLogin(LoginRequest(
    name: agent.name,
    password: agent.password,
  ));

  Future<RegisterReply> onRegister(Agent agent) async => await stub.onRegister(RegisterRequest(
    corp: agent.corp,
    corpId: agent.corpId,
    comRegdAddr: agent.comRegdAddr,
    contact: agent.contact,
    name: agent.name,
    password: agent.password,
  ));
}

class PosterClient extends Client {
  late AgencyPostClient stub;
  late GrpcWebClientChannel channel;

  PosterClient({
    String? serverAddr,
    int? serverPort,
  }) : super(
    serverAddr: serverAddr,
    serverPort: serverPort,
  ) {
    GrpcWebClientChannel channel = GrpcWebClientChannel.xhr(Uri.parse('http://$serverAddr:$serverPort'));
    stub = AgencyPostClient(channel);
  }

  Future<SubmitReply> onRent(RentPost post) async => await stub.onRent(RentRequest(
      name: post.name,
      roomAddr: post.roomAddr,
      roomArea: post.roomArea,
      roomType: post.roomType,
      roomOrientation: post.roomOrientation,
      roomFloor: post.roomFloor,
      description: post.description,
      price: post.price,
      restriction: post.restriction,
      createBy: currentAgent!.name,
      uuid: post.uuid,
      releaseTime: post.releaseTime,
      pictures: post.pictures
  ));

  Future<SubmitReply> onHelp(HelpPost post) async => await stub.onHelp(HelpRequest(
    name: post.name,
    phone: post.phone,
    expectedAddr: post.expectedAddr,
    expectedPrice: post.expectedPrice,
    demands: post.demands,
    createBy: currentAgent!.name,
    uuid: post.uuid,
    releaseTime: post.releaseTime,
  ));

}

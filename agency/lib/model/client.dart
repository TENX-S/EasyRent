import 'package:grpc/grpc.dart';
import 'package:agency/model/agent.dart';
import 'package:agency/model/post.dart';
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

class PosterClient extends Client {
  late AgencyClient stub;
  late ClientChannel channel;

  PosterClient({
    String? serverAddr,
    int? serverPort,
  }) : super(
    serverAddr: serverAddr,
    serverPort: serverPort,
  ) {
    ClientChannel channel = ClientChannel(
      serverAddr!,
      port: serverPort!,
      options: ChannelOptions(
        credentials: ChannelCredentials.insecure(),
        codecRegistry: CodecRegistry(
          codecs: const [
            GzipCodec(),
            IdentityCodec(),
          ],
        ),
      ),
    );
    stub = AgencyClient(channel);
  }

  Future<SubmitReply> onRent(RentPost post) async => await stub.onRent(RentRequest(
      name: post.name,
      phone: post.phone,
      roomAddr: post.roomAddr,
      roomArea: post.roomArea,
      roomType: post.roomType,
      roomOrientation: post.roomOrientation,
      roomFloor: post.roomFloor,
      description: post.description,
      price: post.price,
      restriction: post.restriction,
      createBy: currentAgent.name,
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
    createBy: currentAgent.name,
    uuid: post.uuid,
    releaseTime: post.releaseTime,
  ));

}
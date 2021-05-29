import 'package:grpc/grpc.dart';
import 'package:easy_rent/model/post.dart';
import 'package:easy_rent/model/user.dart';
import 'package:easy_rent/grpc/auth.pb.dart';
import 'package:easy_rent/grpc/auth.pbgrpc.dart';
import 'package:easy_rent/grpc/post.pb.dart';
import 'package:easy_rent/grpc/post.pbgrpc.dart';
import 'package:easy_rent/grpc/command.pb.dart';
import 'package:easy_rent/grpc/command.pbgrpc.dart';


abstract class Client {
  String? serverAddr = '1.116.216.141';
  int? serverPort = 8081;

  Client({
    this.serverAddr,
    this.serverPort,
  });
}

class AuthClient extends Client {
  late AuthenticateClient stub;
  late ClientChannel channel;

  AuthClient({
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
    stub = AuthenticateClient(channel);
  }

  Future<LoginReply> onLogin(User user) async => await stub.onLogin(AuthRequest(
        name: user.name,
        password: user.password,
      ));

  Future<RegisterReply> onRegister(User user) async =>
      await stub.onRegister(AuthRequest(
        name: user.name,
        password: user.password,
      ));
}

class PosterClient extends Client {
  late EmitClient stub;
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
    stub = EmitClient(channel);
  }

  Future<SubmitReply> onRent(RentPost post) async => await stub.onRent(SubmitRentRequest(
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
    createBy: currentUser.name,
    uuid: post.uuid,
    releaseTime: DateTime.now().toString().substring(0, 19),
    pictures: post.pictures
  ));

  Future<SubmitReply> onHelp(HelpPost post) async => await stub.onHelp(SubmitHelpRequest(
    name: post.name,
    phone: post.phone,
    expectedAddr: post.expectedAddr,
    expectedPrice: post.expectedPrice,
    demands: post.demands,
    createBy: currentUser.name,
    uuid: post.uuid,
    releaseTime: DateTime.now().toString().substring(0, 19),
  ));

}

class CmdClient extends Client {
  late CommandClient stub;
  late ClientChannel channel;

  CmdClient({
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
    stub = CommandClient(channel);
  }

  Future<LoadReply> onLoad(List<String> existsPosts) async => await stub.onLoad(LoadRequest(existPosts: existsPosts));
  Future<RefreshReply> onRefresh(bool first) async => await stub.onRefresh(RefreshRequest(first: first));
  Future<LogoutReply> onLogOut() async => await stub.onLogout(LogoutRequest(name: currentUser.name));
}

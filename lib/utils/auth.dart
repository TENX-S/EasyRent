import 'package:easy_rent/model/user.dart';
import 'package:grpc/grpc.dart';
import 'package:easy_rent/grpc/easyrent.pb.dart';
import 'package:easy_rent/grpc/easyrent.pbgrpc.dart';

ClientChannel clientChannel = ClientChannel(
  '1.116.216.141',
  port: 8081,
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

class AuthClient {
  // final channel = clientChannel;
  final stub = AuthenticateClient(clientChannel);

  // Future<void> shutdown() async {
  //   await channel.shutdown();
  // }

  Future<LoginReply> onLogin(User user) async => await stub.onLogin(AuthRequest(
        name: user.email,
        password: user.password,
      ));

  Future<RegisterReply> onRegister(User user) async =>
      await stub.onRegister(AuthRequest(
        name: user.email,
        password: user.password,
      ));
}

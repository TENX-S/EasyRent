import 'package:grpc/grpc.dart';
import 'package:easy_rent/model/user.dart';
import 'package:easy_rent/grpc/auth.pb.dart';
import 'package:easy_rent/grpc/auth.pbgrpc.dart';

class AuthClient {
  late String serverAddr;
  late int serverPort;
  late ClientChannel channel;
  late AuthenticateClient stub;

  AuthClient({
    required this.serverAddr,
    required this.serverPort,
  }) {
    channel = ClientChannel(
      serverAddr,
      port: serverPort,
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

  Future<LoginReply> onLogin(User user) async =>
      await stub.onLogin(AuthRequest(
        name: user.name,
        password: user.password,
      ));

  Future<RegisterReply> onRegister(User user) async =>
      await stub.onRegister(AuthRequest(
        name: user.name,
        password: user.password,
      ));
}

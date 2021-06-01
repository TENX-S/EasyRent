import 'package:grpc/grpc.dart';
import 'package:agency/model/agent.dart';

abstract class Client {
  String? serverAddr;
  int? serverPort;

  Client({
    this.serverAddr,
    this.serverPort,
  });
}

import 'package:grpc/grpc.dart';
import 'package:agency/model/agent.dart';
import 'package:agency/model/house_info.dart';

abstract class Client {
  String? serverAddr;
  int? serverPort;

  Client({
    this.serverAddr,
    this.serverPort,
  });
}

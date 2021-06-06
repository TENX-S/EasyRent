import 'package:agency/model/client.dart';

late Agent currentAgent;

class Agent {
  String? corp;
  String? corpId;
  String? comRegdAddr;
  String? contact;
  String? name;
  String? password;

  Agent({
    this.corp,
    this.corpId,
    this.comRegdAddr,
    this.contact,
    this.name,
    this.password,
  });

}

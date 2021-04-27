import 'dart:io';

mixin RemoteHost {
  final client = Socket.connect('47.96.238.181', 8081);
  var loginResp = <String>[];
  var registerResp = <String>[];

  void disposeRemoteHost() {
    client.then((s) => s.destroy());
  }

  void sendMessage(String message) {
    client.then((s) => s.write(message));
  }

  Future<String> getLoginResponse() async {
    var loginRespGuard = loginResp.length;
    while (loginRespGuard == loginResp.length) {
      await Future.delayed(Duration(milliseconds: 200));
    }
    return Future.value(loginResp.last);
  }

  Future<String> getRegisterResponse() async {
    var registerRespGuard = registerResp.length;
    while (registerRespGuard == registerResp.length) {
      await Future.delayed(Duration(milliseconds: 50));
    }
    return Future.value(registerResp.last);
  }

  void listenServer() {
    client.then((s) => {
          s.listen(
            (event) {
              var resp = String.fromCharCodes(event);
              var head = resp.substring(0, 2);
              if (head == 'ls' || head == 'lf') {
                loginResp.add(resp);
              } else if (head == 'rs' || head == 'rf') {
                registerResp.add(resp);
              }
            },
            onError: (error) {
              print(error);
              s.destroy();
            },
          )
        });
  }
}

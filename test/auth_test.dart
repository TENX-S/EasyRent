import 'dart:math';
import 'package:test/test.dart';
import 'package:easy_rent/model/user.dart';
import 'package:easy_rent/utils/auth.dart';
import 'package:easy_rent/grpc/auth.pbgrpc.dart';

const _chars = 'AaBbCcDdEeFfGgHhIiJjKkLlMmNnOoPpQqRrSsTtUuVvWwXxYyZz1234567890';
Random _rnd = Random();

String getRandomString(int length) => String.fromCharCodes(
      Iterable.generate(
        length,
        (_) => _chars.codeUnitAt(_rnd.nextInt(_chars.length)),
      ),
    );

User getRandomUser() => User(
      name: 'test-${getRandomString(12)}',
      password: 'test-${getRandomString(8)}',
    );

AuthClient _authClient = AuthClient(serverAddr: '1.116.216.141', serverPort: 8081);

void main() {
  loginTest(user: User(name: "test-Oc2T1kWcreoz", password: "test-uheus3cZ"));
  // registerTest();
}

void loginTest({User? user}) {
  test('Test user login', () async {
    final testUser = user ?? getRandomUser();
    final result = await _authClient.onLogin(testUser);
    expect(result.error, AuthError.NONEXISTENT_USER);
  });
}

void registerTest() {
  test('Test user register', () async {
    final testUser = getRandomUser();
    final result = await _authClient.onRegister(testUser);
    expect(result.success, true);
  });
}

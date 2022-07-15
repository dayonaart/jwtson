import 'package:flutter_test/flutter_test.dart';
import 'package:jwtson/jwtson.dart';
import 'package:jwtson/jwtson_platform_interface.dart';
import 'package:jwtson/jwtson_method_channel.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

class MockJwtsonPlatform with MockPlatformInterfaceMixin implements JwtsonPlatform {
  @override
  Future<String?> generateToken(key, data) => Future.value(null);

  @override
  Future<JwtResult?> decodeJwtToken(key, data) => Future.value(null);
}

void main() {
  final JwtsonPlatform initialPlatform = JwtsonPlatform.instance;
  Jwtson jwtsonPlugin = Jwtson();
  MockJwtsonPlatform fakePlatform = MockJwtsonPlatform();
  JwtsonPlatform.instance = fakePlatform;
  test('$MethodChannelJwtson is the default instance', () {
    expect(initialPlatform, isInstanceOf<MethodChannelJwtson>());
  });

  test('$MethodChannelJwtson is the default instance', () {
    expect(initialPlatform, isInstanceOf<MethodChannelJwtson>());
  });

  test('generateToken', () async {
    expect(await jwtsonPlugin.generateToken(key: null, body: null, header: null), '42');
  });
  test('decodeJwtToken', () async {
    expect(await jwtsonPlugin.decodeJwtToken(key: null, tokenJwt: null), '42');
  });
}

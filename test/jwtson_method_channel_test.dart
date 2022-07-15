import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:jwtson/jwtson_method_channel.dart';

void main() {
  MethodChannelJwtson platform = MethodChannelJwtson();
  const MethodChannel channel = MethodChannel('jwtson');

  TestWidgetsFlutterBinding.ensureInitialized();

  setUp(() {
    channel.setMockMethodCallHandler((MethodCall methodCall) async {
      return '42';
    });
  });

  tearDown(() {
    channel.setMockMethodCallHandler(null);
  });

  test('generateToken', () async {
    expect(await platform.generateToken(null, null), '42');
  });
  test('decodeJwtToken', () async {
    expect(await platform.decodeJwtToken(null, null), '42');
  });
}

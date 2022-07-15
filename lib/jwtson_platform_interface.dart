import 'package:plugin_platform_interface/plugin_platform_interface.dart';

import 'jwtson_method_channel.dart';

abstract class JwtsonPlatform extends PlatformInterface {
  /// Constructs a JwtsonPlatform.
  JwtsonPlatform() : super(token: _token);

  static final Object _token = Object();

  static JwtsonPlatform _instance = MethodChannelJwtson();

  /// The default instance of [JwtsonPlatform] to use.
  ///
  /// Defaults to [MethodChannelJwtson].
  static JwtsonPlatform get instance => _instance;

  /// Platform-specific implementations should set this with their own
  /// platform-specific class that extends [JwtsonPlatform] when
  /// they register themselves.
  static set instance(JwtsonPlatform instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  Future<String?> generateToken(String? key, String? data) async {
    throw UnimplementedError('generateToken() has not been implemented.');
  }

  Future<JwtResult?> decodeJwtToken(String? key, String? data) async {
    throw UnimplementedError('decodeJwtToken() has not been implemented.');
  }
}

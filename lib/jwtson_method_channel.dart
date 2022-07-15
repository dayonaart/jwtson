import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

import 'jwtson_platform_interface.dart';

/// An implementation of [JwtsonPlatform] that uses method channels.
class MethodChannelJwtson extends JwtsonPlatform {
  /// The method channel used to interact with the native platform.
  @visibleForTesting
  final methodChannel = const MethodChannel('jwtson');
}

class JwtResult {
  dynamic body;
  bool? expired;
  dynamic header;
  String? message;
  JwtResult({
    this.body,
    this.expired,
    this.header,
    this.message,
  });

  factory JwtResult.fromJson(Map<String, dynamic> json) {
    return JwtResult(
        body: json['body'],
        expired: json['exp'] == null
            ? null
            : DateTime.now().add(Duration(milliseconds: json['exp'])).isBefore(DateTime.now()),
        header: json['header'],
        message: json['message'] ?? "Success JWT");
  }

  Map<String, dynamic> toJson() => {
        'body': body,
        'expired': expired,
        'header': header,
        'message': message,
      };
}

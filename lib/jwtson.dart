import 'package:dart_jsonwebtoken/dart_jsonwebtoken.dart';
import 'package:flutter/material.dart';
import 'package:jwtson/jwtson_method_channel.dart';

class Jwtson {
  /// Generate And Sign JWT TOKEN
  /// - sign key and data must not be null
  Future<String?> generateToken({
    @required String? key,
    @required dynamic body,
    @required Map<String, dynamic>? header,
  }) async {
    assert(key != null && body != null);
    // Create a json web token
    final jwt = JWT({"header": header, "body": body});
    // Sign it (default with HS256 algorithm)
    return jwt.sign(SecretKey(key!));
    // return JwtsonPlatform.instance.generateToken(key, jsonEncode(data));
  }

  /// Decode And with sign key JWT TOKEN
  /// - sign key and data ( JWT token ) must not be null
  Future<JwtResult?> decodeJwtToken({@required String? key, @required String? tokenJwt}) async {
    assert(key != null && tokenJwt != null);
    try {
      // Verify a token
      final jwt = JWT.verify(tokenJwt!, SecretKey(key!), checkExpiresIn: false);
      final payload = JwtResult.fromJson(Map<String, dynamic>.from(jwt.payload));
      if (payload.expired ?? false) {
        return JwtResult(message: "token expired");
      } else {
        return payload;
      }
      // return JwtsonPlatform.instance.decodeJwtToken(key, data);
    } on JWTExpiredError {
      return JwtResult(message: "token expired");
    } on JWTError catch (ex) {
      return JwtResult(message: ex.message);
    }
  }
}

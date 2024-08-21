import 'dart:io';

class Environment {
  static final signSecretKey = Platform.environment['SecretKey'] ?? "SecretKey";
  static final tokenExpiredTime =
      int.parse(Platform.environment['TokenExpiredTime'] ?? "30");
}

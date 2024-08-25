import 'package:bolg_backend/const/environment.dart';
import 'package:bolg_backend/db/hive_box.dart';
import 'package:bolg_backend/model/user.dart';
import 'package:dart_jsonwebtoken/dart_jsonwebtoken.dart';

class Utils {
  /// Create a json web token
  static String jwtSign(String username, String password) {
    return JWT({
      "username": username,
      "password": password,
    }).sign(SecretKey(Environment.signSecretKey),
        expiresIn: Duration(days: Environment.tokenExpiredTime));
  }

  /// Verify a token, return username
  static bool jwtVerify(String token) {
    try {
      JWT.verify(token, SecretKey(Environment.signSecretKey));
      return true;
    } on JWTExpiredException {
      print('jwt expired');
      return false;
    } on JWTException catch (ex) {
      print(ex.message); // ex: invalid signature
      return false;
    }
  }

  /// Get user form token
  static User? getUserFromToken(String token) {
    return HiveBox.userBox.get(JWT.decode(token).payload["username"]);
  }
}

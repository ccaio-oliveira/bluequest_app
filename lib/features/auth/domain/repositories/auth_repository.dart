import 'package:bluequest_app/features/auth/domain/entities/user.dart';

abstract class AuthRepository {
  Future<(User, String)> login(String email, String password);
  Future<(User, (String accessToken, String refreshToken))> register(
    String email,
    String password,
    String displayName,
    String timezone,
  );
}

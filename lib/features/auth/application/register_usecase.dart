import 'package:bluequest_app/features/auth/domain/entities/user.dart';
import 'package:bluequest_app/features/auth/domain/repositories/auth_repository.dart';

class RegisterUsecase {
  final AuthRepository repo;
  RegisterUsecase(this.repo);

  Future<(User, (String accessToken, String refreshToken))> call({
    required String email,
    required String password,
    required String displayName,
    required String timezone,
  }) => repo.register(email, password, displayName, timezone);
}

import 'package:bluequest_app/features/auth/domain/entities/user.dart';
import 'package:bluequest_app/features/auth/domain/repositories/auth_repository.dart';

class LoginUseCase {
  final AuthRepository repo;

  LoginUseCase(this.repo);

  Future<(User, String)> call(String email, String password) =>
      repo.login(email, password);
}

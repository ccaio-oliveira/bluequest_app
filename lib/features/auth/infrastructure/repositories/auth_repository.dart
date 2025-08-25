import 'package:bluequest_app/features/auth/domain/entities/user.dart';
import 'package:bluequest_app/features/auth/domain/repositories/auth_repository.dart';
import 'package:bluequest_app/features/auth/infrastructure/datasource/auth_remote_data_source.dart';

class AuthRepositoryImpl implements AuthRepository {
  final AuthRemoteDataSource _remote;
  AuthRepositoryImpl(this._remote);

  @override
  Future<(User, String)> login(String email, String password) =>
      _remote.login(email, password);

  @override
  Future<(User, (String accessToken, String refreshToken))> register(
    String email,
    String password,
    String displayName,
    String timezone,
  ) => _remote.register(email, password, displayName, timezone);
}

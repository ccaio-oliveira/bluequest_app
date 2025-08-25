import 'package:bluequest_app/core/http/api_client.dart';
import 'package:bluequest_app/features/auth/domain/entities/user.dart'
    as domain;

class AuthRemoteDataSource {
  final ApiClient api;
  AuthRemoteDataSource(this.api);

  Future<(domain.User, String)> login(String email, String password) async {
    final res = await api.post(
      '/auth/login',
      data: {'email': email, 'password': password},
    );
    final u = res.data['user'];
    final user = domain.User(
      id: u['id'],
      email: u['email'],
      displayName: u['displayName'],
      timezone: u['timezone'],
    );
    final token = res.data['accessToken'] as String;
    return (user, token);
  }

  Future<(domain.User, (String, String))> register(
    String email,
    String password,
    String displayName,
    String tz,
  ) async {
    final res = await api.post(
      '/auth/register',
      data: {
        'email': email,
        'password': password,
        'displayName': displayName,
        'timezone': tz,
      },
    );
    final u = res.data['user'];
    final user = domain.User(
      id: u['id'],
      email: u['email'],
      displayName: u['displayName'],
      timezone: u['timezone'],
    );
    final access = res.data['accessToken'] as String;
    final refresh = res.data['refreshToken'] as String;
    return (user, (access, refresh));
  }
}

import 'package:bluequest_app/core/http/api_client.dart';
import 'package:bluequest_app/features/auth/application/login_usecase.dart';
import 'package:bluequest_app/features/auth/infrastructure/datasource/auth_remote_data_source.dart';
import 'package:bluequest_app/features/auth/infrastructure/repositories/auth_repository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final apiClientProvider = Provider((ref) => ApiClient('http://localhost:3000'));
final authRemoteProvider = Provider(
  (ref) => AuthRemoteDataSource(ref.read(apiClientProvider)),
);
final authRepoProvider = Provider(
  (ref) => AuthRepositoryImpl(ref.read(authRemoteProvider)),
);
final loginUseCaseProvider = Provider(
  (ref) => LoginUseCase(ref.read(authRepoProvider)),
);

final accessTokenProvider = StateProvider<String?>((_) => null);

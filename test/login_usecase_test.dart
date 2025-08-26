import 'package:bluequest_app/features/auth/application/login_usecase.dart';
import 'package:bluequest_app/features/auth/domain/entities/user.dart';
import 'package:bluequest_app/features/auth/domain/repositories/auth_repository.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockAuthRepo extends Mock implements AuthRepository {}

void main() {
  test('login usecase calls repository (mocktail)', () async {
    final repo = MockAuthRepo();
    when(() => repo.login(any(), any())).thenAnswer(
      (_) async => (
        const User(
          id: 'u1',
          email: 'a@a.com',
          displayName: 'Test',
          timezone: 'UTC',
        ),
        'tok',
      ),
    );

    final usecase = LoginUseCase(repo);
    final res = await usecase('a@a.com', 'x');

    verify(() => repo.login('a@a.com', 'x')).called(1);
    expect(res.$2, 'tok');
  });
}

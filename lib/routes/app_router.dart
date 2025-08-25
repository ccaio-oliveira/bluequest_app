import 'package:bluequest_app/features/auth/presentation/login_page.dart';
import 'package:go_router/go_router.dart';

final appRouter = GoRouter(
  routes: [
    GoRoute(path: '/', builder: (c, s) => const LoginPage()),
    // GoRoute(path: '/challenges', builder: (c, s) => const ChallengesPage()),
  ],
);

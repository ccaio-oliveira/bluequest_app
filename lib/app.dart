import 'package:bluequest_app/core/theme/app_theme.dart';
import 'package:bluequest_app/routes/app_router.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class BlueQuestApp extends StatelessWidget {
  const BlueQuestApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ProviderScope(
      child: MaterialApp.router(
        title: 'BlueQuest',
        theme: AppTheme.light(),
        routerConfig: appRouter,
      ),
    );
  }
}

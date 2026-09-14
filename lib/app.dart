import 'package:bluequest/design_system/bq_theme.dart';
import 'package:bluequest/design_system/tokens/bq_colors.dart';
import 'package:bluequest/design_system/tokens/bq_spacing.dart';
import 'package:bluequest/design_system/tokens/bq_typography.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class BlueQuestApp extends StatelessWidget {
  const BlueQuestApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'BlueQuest',
      debugShowCheckedModeBanner: false,
      theme: BQTheme.dark(),
      builder: (context, child) => AnnotatedRegion<SystemUiOverlayStyle>(
        value: BQTheme.systemOverlay,
        child: child!,
      ),
      home: const _TokensPreview(),
    );
  }
}

class _TokensPreview extends StatelessWidget {
  const _TokensPreview();

  static const _swatches = [
    BQColors.bg1,
    BQColors.stroke1,
    BQColors.blue,
    BQColors.blueBright,
    BQColors.amber,
    BQColors.green,
    BQColors.red,
    BQColors.teal,
    BQColors.violet,
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: BQSpacing.screenPadding,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: BQSpacing.sp6),
              const Text('HOJE · SEGUNDA, 14 SET', style: BQText.overline),
              const SizedBox(height: BQSpacing.sp1),
              Text('230 pts', style: BQText.display(BQTypeScale.hero)),
              const SizedBox(height: BQSpacing.sp2),
              const Text('3 tarefas hoje'),
              const SizedBox(height: BQSpacing.sp6),
              Wrap(
                spacing: BQSpacing.sp2,
                runSpacing: BQSpacing.sp2,
                children: [
                  for (final color in _swatches)
                    Container(
                      width: BQSpacing.hitTarget,
                      height: BQSpacing.hitTarget,
                      decoration: BoxDecoration(
                        color: color,
                        borderRadius: BorderRadius.circular(BQRadius.small),
                      ),
                    ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

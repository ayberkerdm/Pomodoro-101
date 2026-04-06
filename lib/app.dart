import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'core/router/app_router.dart';
import 'core/theme/app_theme.dart';
import 'core/theme/theme_provider.dart';
import 'features/settings/providers/settings_provider.dart';

class PomodoroApp extends ConsumerWidget {
  const PomodoroApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final themeMode = ref.watch(themeModeProvider);
    final settings = ref.watch(settingsProvider);
    
    Color? customBg;
    if (settings.customBackgroundColor != null) {
      customBg = Color(settings.customBackgroundColor!);
    }

    return MaterialApp.router(
      title: 'FocusFlow',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.getLightTheme(customBackground: customBg),
      darkTheme: AppTheme.getDarkTheme(customBackground: customBg),
      themeMode: themeMode,
      routerConfig: appRouter,
    );
  }
}

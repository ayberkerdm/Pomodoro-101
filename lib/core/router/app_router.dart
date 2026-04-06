import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../features/splash/splash_screen.dart';
import '../../features/onboarding/onboarding_screen.dart';
import '../../features/home/screens/home_screen.dart';
import '../../features/timer/screens/timer_screen.dart';
import '../../features/tasks/screens/task_list_screen.dart';
import '../../features/tasks/screens/task_detail_screen.dart';
import '../../features/statistics/screens/statistics_screen.dart';
import '../../features/history/screens/history_screen.dart';
import '../../features/settings/screens/settings_screen.dart';
import '../constants/app_strings.dart';

/// Route names — use these constants instead of raw strings
class AppRoutes {
  AppRoutes._();

  static const String splash = '/';
  static const String onboarding = '/onboarding';
  static const String home = '/home';
  static const String timer = '/timer';
  static const String tasks = '/tasks';
  static const String taskDetail = '/tasks/:id';
  static const String statistics = '/statistics';
  static const String history = '/history';
  static const String settings = '/settings';
}

final appRouter = GoRouter(
  initialLocation: AppRoutes.splash,
  debugLogDiagnostics: false,
  routes: [
    // Splash
    GoRoute(
      path: AppRoutes.splash,
      name: 'splash',
      builder: (context, state) => const SplashScreen(),
    ),

    // Onboarding
    GoRoute(
      path: AppRoutes.onboarding,
      name: 'onboarding',
      builder: (context, state) => const OnboardingScreen(),
    ),

    // Main Shell with Bottom Navigation
    StatefulShellRoute.indexedStack(
      builder: (context, state, navigationShell) {
        return MainShell(navigationShell: navigationShell);
      },
      branches: [
        // Home
        StatefulShellBranch(
          routes: [
            GoRoute(
              path: AppRoutes.home,
              name: 'home',
              builder: (context, state) => const HomeScreen(),
            ),
          ],
        ),
        // Timer
        StatefulShellBranch(
          routes: [
            GoRoute(
              path: AppRoutes.timer,
              name: 'timer',
              builder: (context, state) => const TimerScreen(),
            ),
          ],
        ),
        // Tasks
        StatefulShellBranch(
          routes: [
            GoRoute(
              path: AppRoutes.tasks,
              name: 'tasks',
              builder: (context, state) => const TaskListScreen(),
            ),
          ],
        ),
        // Statistics
        StatefulShellBranch(
          routes: [
            GoRoute(
              path: AppRoutes.statistics,
              name: 'statistics',
              builder: (context, state) => const StatisticsScreen(),
            ),
          ],
        ),
      ],
    ),

    // Task Detail (outside shell — full screen)
    GoRoute(
      path: AppRoutes.taskDetail,
      name: 'taskDetail',
      builder: (context, state) {
        final taskId = state.pathParameters['id'];
        return TaskDetailScreen(taskId: taskId);
      },
    ),

    // History (outside shell — can be accessed from Home)
    GoRoute(
      path: AppRoutes.history,
      name: 'history',
      builder: (context, state) => const HistoryScreen(),
    ),

    // Settings (outside shell)
    GoRoute(
      path: AppRoutes.settings,
      name: 'settings',
      builder: (context, state) => const SettingsScreen(),
    ),
  ],
);

/// Main shell widget with bottom navigation
class MainShell extends StatelessWidget {
  final StatefulNavigationShell navigationShell;

  const MainShell({super.key, required this.navigationShell});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: navigationShell,
      bottomNavigationBar: _BottomNav(
        currentIndex: navigationShell.currentIndex,
        onTap: (index) => navigationShell.goBranch(
          index,
          initialLocation: index == navigationShell.currentIndex,
        ),
      ),
    );
  }
}

class _BottomNav extends StatelessWidget {
  final int currentIndex;
  final ValueChanged<int> onTap;

  const _BottomNav({required this.currentIndex, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return NavigationBar(
      selectedIndex: currentIndex,
      onDestinationSelected: onTap,
      destinations: const [
        NavigationDestination(
          icon: Icon(Icons.home_outlined),
          selectedIcon: Icon(Icons.home_rounded),
          label: AppStrings.navHome,
        ),
        NavigationDestination(
          icon: Icon(Icons.timer_outlined),
          selectedIcon: Icon(Icons.timer_rounded),
          label: AppStrings.navTimer,
        ),
        NavigationDestination(
          icon: Icon(Icons.check_circle_outline_rounded),
          selectedIcon: Icon(Icons.check_circle_rounded),
          label: AppStrings.navTasks,
        ),
        NavigationDestination(
          icon: Icon(Icons.bar_chart_outlined),
          selectedIcon: Icon(Icons.bar_chart_rounded),
          label: AppStrings.navStats,
        ),
      ],
    );
  }
}

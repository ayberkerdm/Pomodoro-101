import 'dart:math' as math;
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:go_router/go_router.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../core/constants/app_colors.dart';
import '../../core/constants/app_strings.dart';
import '../../core/router/app_router.dart';
import '../settings/providers/settings_provider.dart';
import '../../core/theme/theme_palettes.dart';
import '../../core/providers/repository_providers.dart';

class SplashScreen extends ConsumerStatefulWidget {
  const SplashScreen({super.key});

  @override
  ConsumerState<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends ConsumerState<SplashScreen> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _progressAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 3500),
    );

    _progressAnimation = Tween<double>(begin: 0, end: 1).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeInOutCubic),
    );

    _controller.addListener(() {
      if (_controller.isCompleted) {
        _onAnimationComplete();
      }
    });

    _controller.forward();
  }

  void _onAnimationComplete() async {
    await Future.delayed(const Duration(milliseconds: 600));
    if (mounted) {
      final prefs = ref.read(sharedPreferencesProvider);
      final bool onboardingCompleted = prefs.getBool('onboarding_completed') ?? false;

      if (onboardingCompleted) {
        context.go(AppRoutes.home);
      } else {
        context.go(AppRoutes.onboarding);
      }
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final settings = ref.watch(settingsProvider);
    final palette = TimerPalette.fromId(settings.customBackgroundColor);
    
    final Color bgColor = palette?.backgroundColor ?? const Color(0xFF0F0F1A);
    final List<Color> accentGradient = [
      const Color(0xFF6C63FF),
      const Color(0xFFFF6B6B),
      const Color(0xFFFF9F43),
    ];

    return Scaffold(
      backgroundColor: bgColor,
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
          gradient: RadialGradient(
            center: Alignment.center,
            radius: 1.2,
            colors: [
              Color.lerp(bgColor, Colors.purple, 0.1)!,
              bgColor,
            ],
          ),
        ),
        child: AnimatedBuilder(
          animation: _progressAnimation,
          builder: (context, child) {
            final progress = _progressAnimation.value;
            final isDone = progress >= 1.0;

            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Stack(
                  alignment: Alignment.center,
                  children: [
                    if (isDone)
                      TweenAnimationBuilder<double>(
                        duration: const Duration(milliseconds: 800),
                        tween: Tween(begin: 0, end: 1),
                        builder: (context, value, child) {
                          return Container(
                            width: 200 + (value * 40),
                            height: 200 + (value * 40),
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              boxShadow: [
                                BoxShadow(
                                  color: accentGradient[0].withOpacity(0.3 * (1 - value)),
                                  blurRadius: 40,
                                  spreadRadius: 10,
                                ),
                              ],
                            ),
                          );
                        },
                      ),

                    CustomPaint(
                      size: const Size(220, 220),
                      painter: TimerDialPainter(
                        progress: progress,
                        gradientColors: accentGradient,
                      ),
                    ),

                    Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        if (!isDone)
                          Text(
                            '${(progress * 100).toInt()}%',
                            style: const TextStyle(
                              fontSize: 48,
                              fontWeight: FontWeight.w900,
                              color: Colors.white,
                              letterSpacing: -1,
                            ),
                          )
                        else
                          TweenAnimationBuilder<double>(
                            duration: const Duration(milliseconds: 500),
                            tween: Tween(begin: 0, end: 1),
                            builder: (context, value, child) {
                              return Transform.scale(
                                scale: value,
                                child: const Icon(
                                  Icons.check_circle_rounded,
                                  color: Colors.white,
                                  size: 80,
                                ),
                              );
                            },
                          ),
                      ],
                    ),
                  ],
                ),

                const SizedBox(height: 60),

                Text(
                  AppStrings.appName,
                  style: const TextStyle(
                    fontSize: 32,
                    fontWeight: FontWeight.w900,
                    color: Colors.white,
                    letterSpacing: -0.5,
                  ),
                ).animate().fadeIn(delay: 400.ms).slideY(begin: 0.2, end: 0),

                const SizedBox(height: 8),

                Text(
                  isDone ? "Odaklanmaya hazır!" : "Odaklanma oturumunuz hazırlanıyor...",
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.white.withOpacity(0.6),
                    fontWeight: FontWeight.w400,
                    letterSpacing: 0.5,
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}

class TimerDialPainter extends CustomPainter {
  final double progress;
  final List<Color> gradientColors;

  TimerDialPainter({required this.progress, required this.gradientColors});

  @override
  void paint(Canvas canvas, Size size) {
    final center = Offset(size.width / 2, size.height / 2);
    final radius = size.width / 2;
    const strokeWidth = 14.0;

    final trackPaint = Paint()
      ..color = Colors.white.withOpacity(0.05)
      ..style = PaintingStyle.stroke
      ..strokeWidth = strokeWidth;

    canvas.drawCircle(center, radius, trackPaint);

    final rect = Rect.fromCircle(center: center, radius: radius);
    final gradient = SweepGradient(
      startAngle: -math.pi / 2,
      endAngle: 2 * math.pi,
      colors: gradientColors,
      stops: const [0.0, 0.5, 1.0],
      transform: const GradientRotation(-math.pi / 2),
    );

    final progressPaint = Paint()
      ..shader = gradient.createShader(rect)
      ..style = PaintingStyle.stroke
      ..strokeWidth = strokeWidth
      ..strokeCap = StrokeCap.round;

    canvas.drawArc(
      rect,
      -math.pi / 2,
      2 * math.pi * progress,
      false,
      progressPaint,
    );

    final tickPaint = Paint()
      ..color = Colors.white.withOpacity(0.1)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 2;

    for (int i = 0; i < 60; i++) {
      final angle = (i * 6) * (math.pi / 180);
      final start = Offset(
        center.dx + (radius - 25) * math.cos(angle),
        center.dy + (radius - 25) * math.sin(angle),
      );
      final end = Offset(
        center.dx + (radius - 18) * math.cos(angle),
        center.dy + (radius - 18) * math.sin(angle),
      );
      canvas.drawLine(start, end, tickPaint);
    }
  }

  @override
  bool shouldRepaint(covariant TimerDialPainter oldDelegate) =>
      oldDelegate.progress != progress;
}

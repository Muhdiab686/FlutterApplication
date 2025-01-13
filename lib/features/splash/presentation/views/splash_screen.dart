import 'dart:async';
import 'package:final_project/core/utils/app_router.dart';

import 'package:final_project/features/splash/presentation/views/widgets/splash_screen_body.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();

    initAnimation();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      body: SplashScreenBody(animation: _animation),
    );
  }

  void initAnimation() {
    _initializeAnimationController();
    _startAnimation();
    _scheduleNavigation();
  }

  void _initializeAnimationController() {
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    );

    _animation = Tween<double>(begin: 0.5, end: 1.0).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Curves.easeInOut,
      ),
    );
  }

  void _startAnimation() {
    _controller.forward();
  }

  void _scheduleNavigation() {
    Timer(const Duration(seconds: 3), () {
      navigateToLoginPage(context);
    });
  }

  void navigateToLoginPage(context) {
    Future.delayed(
      const Duration(seconds: 3),
      () {
        GoRouter.of(context).push(AppRouter.kLoginPage);
      },
    );
  }
}

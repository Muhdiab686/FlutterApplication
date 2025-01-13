import 'package:final_project/core/utils/assets.dart';
import 'package:flutter/material.dart';

class SplashScreenBody extends StatelessWidget {
  const SplashScreenBody({
    super.key,
    required Animation<double> animation,
  }) : _animation = animation;

  final Animation<double> _animation;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ScaleTransition(
        scale: _animation,
        child: Image.asset(
          AssetsData.logo,
          height: 120,
          width: 120,
        ),
      ),
    );
  }
}

import 'package:final_project/core/utils/assets.dart';
import 'package:flutter/material.dart';

class CenterLogo extends StatelessWidget {
  const CenterLogo({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Image.asset(
        AssetsData.logo,
        width: 100,
        height: 100,
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:islamic_app/core/resources/color.dart';
import 'package:islamic_app/features/splash/view/widget/body_splash.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(
        child: BodySplash(),
      ),
    );
  }
}

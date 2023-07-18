import 'dart:async';
import 'package:cardtrading/ui/choose_language/choose_language.dart';
import 'package:cardtrading/ui/splashscreen/mobile/helper/splash_body.dart';
import 'package:cardtrading/ui/utils/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SplashScreenMobile extends ConsumerStatefulWidget {
  const SplashScreenMobile({super.key});

  @override
  ConsumerState<SplashScreenMobile> createState() => _SplashScreenMobileState();

}

class _SplashScreenMobileState extends ConsumerState<SplashScreenMobile> {
  @override
  void initState() {
    super.initState();
    ///Code to redirect to the onboarding screen
    Future.delayed(
      const Duration(seconds: 2),
      () => Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => const ChooseLanguage(),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
        backgroundColor: AppColors.background,
        body: SplashBody(),
    );
  }

}

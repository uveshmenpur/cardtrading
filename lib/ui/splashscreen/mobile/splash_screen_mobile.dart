import 'dart:async';

import 'package:cardtrading/ui/choose_language/choose_language.dart';
import 'package:cardtrading/ui/utils/theme/colors.dart';
import 'package:cardtrading/ui/utils/theme/my_strings.dart';
import 'package:cardtrading/ui/utils/theme/text_style.dart';
import 'package:flutter/material.dart';

class SplashScreenMobile extends StatefulWidget {
  const SplashScreenMobile({super.key});

  @override
  State<SplashScreenMobile> createState() => _SplashScreenMobileState();
}

class _SplashScreenMobileState extends State<SplashScreenMobile> {
  @override
  void initState() {
    super.initState();

    //Code to redirect to the onboarding screen in 2 second
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
    return Scaffold(
        backgroundColor: AppColors.background,
        body: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                AppStrings.keyCard,
                style: TextStyles.bold.copyWith(
                  color: AppColors.primary,
                  fontSize: 50,
                ),
              ),
              Text(
                AppStrings.keyBuyAndSell,
                style: TextStyles.regular.copyWith(
                  color: AppColors.white,
                  fontSize: 16
                ),
              ),
            ],
          ),
        ),
    );
  }
}

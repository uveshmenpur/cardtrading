import 'dart:async';
import 'package:cardtrading/ui/choose_language/choose_language.dart';
import 'package:cardtrading/ui/utils/theme/colors.dart';
import 'package:cardtrading/ui/utils/theme/my_strings.dart';
import 'package:cardtrading/ui/utils/theme/text_style.dart';
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
    return Scaffold(
        backgroundColor: AppColors.background,
        body: _bodyWidget(),
    );
  }

  ///Body Widget
  Widget _bodyWidget(){
    return Center(
      child: Column(
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
            style: TextStyles.medium.copyWith(
                color: AppColors.white,
                fontSize: 16
            ),
          ),
        ],
      ),
    );
  }
}

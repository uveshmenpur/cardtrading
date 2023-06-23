import 'dart:async';

import 'package:cardtrading/ui/choose_language/choose_language.dart';
import 'package:cardtrading/ui/utils/colors.dart';
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
    Timer(
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
        backgroundColor: Color.fromRGBO(26, 26, 26, 1),
        body: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Card",
                style: TextStyle(
                  color: MyColors.primary,
                  fontSize: 50,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Montserrat',
                ),
              ),
              Text(
                "Buy & Sell",
                style: TextStyle(
                  color: MyColors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.normal,
                  fontFamily: 'Montserrat',
                ),
              ),
            ],
          ),
        ),
    );
  }
}

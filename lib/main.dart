import 'package:cardtrading/ui/splashscreen/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() {
  runApp(
    ScreenUtilInit(
      builder: (BuildContext context, Widget? child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          themeMode: ThemeMode.dark,
          theme: ThemeData.dark().copyWith(
              brightness: Brightness.dark
          ),
          home: const SplashScreen(),
        );
      },
    ),
  );
}

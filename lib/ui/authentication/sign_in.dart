import 'package:cardtrading/ui/authentication/mobile/sign_in_mobile.dart';
import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';

class SignIn extends StatelessWidget {
  const  SignIn({super.key});

  @override
  Widget build(BuildContext context) {
    return ResponsiveBuilder(builder: (context,sizingInformation){
      if(sizingInformation.isMobile){
        return const SignInMobile();
      }
      return const SignInMobile();
    });
  }
}

import 'package:cardtrading/ui/authentication/mobile/helper/get_otp_button.dart';
import 'package:cardtrading/ui/authentication/mobile/helper/sign_in_text_field.dart';
import 'package:cardtrading/ui/home_screen/home_screen.dart';
import 'package:cardtrading/ui/utils/colors.dart';
import 'package:cardtrading/ui/utils/my_strings.dart';
import 'package:cardtrading/ui/utils/widget/common_text.dart';
import 'package:cardtrading/ui/utils/widget/common_title.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SignInMobile extends StatelessWidget {
  const SignInMobile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColors.background,

      ///AppBar
      appBar: AppBar(
        backgroundColor: MyColors.background,
        automaticallyImplyLeading: true,
        title: const Text(
          "Sign In",
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
      ),

      ///Content of the body is wrapper in SingleChildScrollView to avoid overflow when the keyboard comes up and takes half of the screen height.
      body: SingleChildScrollView(
        child: Padding(
          padding: REdgeInsets.all(8.0.r),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: REdgeInsets.all(8.0.r),
                child: SizedBox(
                  width: 0.6.sw,

                  ///CommonTitle is a title defined as a common widget in util folder
                  child: CommonTitle(
                    text: MyStrings.signInTitle,
                    fontSize: 18.sp,
                    weight: FontWeight.w500,
                  ),
                ),
              ),
              Padding(
                padding: REdgeInsets.all(8.0.r),
                child: SizedBox(
                  width: 0.9.sw,

                  ///Common Text is a text defined as a common widget in util folder
                  child: CommonText(
                      text: MyStrings.signInContent, fontSize: 12.sp),
                ),
              ),
              SizedBox(
                width: 0.9.sw,
                height: 20.h,
              ),

              ///SignIn Text Field for Phone number Defined in helper package
              const SignInTextField(),
            ],
          ),
        ),
      ),
      floatingActionButton: GetOtpButton(
        text: 'Get Otp',
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) {
                return const HomeScreen();
              },
            ),
          );
        },
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}

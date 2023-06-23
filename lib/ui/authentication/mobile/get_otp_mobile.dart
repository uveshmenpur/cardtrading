import 'package:cardtrading/ui/authentication/mobile/helper/get_otp_button.dart';
import 'package:cardtrading/ui/home_screen/home_screen.dart';
import 'package:cardtrading/ui/utils/colors.dart';
import 'package:cardtrading/ui/utils/text_style.dart';
import 'package:cardtrading/ui/utils/widget/common_text.dart';
import 'package:cardtrading/ui/utils/widget/common_title.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class GetOtpMobile extends StatefulWidget {
  const GetOtpMobile({super.key});

  @override
  State<GetOtpMobile> createState() => _GetOtpMobileState();
}

class _GetOtpMobileState extends State<GetOtpMobile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColors.background,
      appBar: AppBar(
        title: const Text('Verification'),
        automaticallyImplyLeading: true,
        centerTitle: true,
        elevation: 0,
        backgroundColor: MyColors.background,
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.0.w, vertical: 16.0.h),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: const EdgeInsets.all(4.0),
                width: 0.5.sw,
                child: const CommonTitle(
                  text: 'Enter Your 6 Digit OTP Here!',
                  fontSize: 22,
                ),
              ),
              Container(
                padding: const EdgeInsets.all(4.0),
                width: 0.8.sw,
                child: const CommonText(
                  text:
                      'We\'ve Sent You A Verification Code On Your Registered Phone Number',
                  fontSize: 12,
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(8.0, 20.0, 8.0, 8.0),
                child: PinCodeTextField(
                  length: 6,
                  obscureText: false,
                  keyboardType: TextInputType.number,
                  animationType: AnimationType.scale,
                  hintCharacter: ' ',
                  hintStyle: TextStyles.regular
                      .copyWith(color: MyColors.greyText, fontSize: 26.sp),
                  pinTheme: PinTheme(
                    activeColor: MyColors.buttonBg,
                    inactiveFillColor: MyColors.buttonBg,
                    activeFillColor: MyColors.buttonBg,
                    selectedColor: MyColors.buttonBg,
                    selectedFillColor: MyColors.buttonBg,
                    inactiveColor: MyColors.buttonBg,
                    fieldHeight: 42.w,
                    fieldWidth: 42.w,
                  ),
                  enableActiveFill: true,
                  onCompleted: (v) {},
                  onChanged: (value) {
                    setState(
                      () {},
                    );
                  },
                  beforeTextPaste: (text) {
                    return true;
                  },
                  appContext: context,
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    RichText(
                      text: TextSpan(
                        text: 'Did Not Receive A Code?',
                        style: TextStyles.regular,
                        children: const [
                          TextSpan(
                            text: ' RESEND',
                            style: TextStyle(
                                fontSize: 14, color: MyColors.primary),
                          ),
                        ],
                      ),
                    ),
                    const Text(
                      '00:58',
                      textAlign: TextAlign.end,
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
      floatingActionButton: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 6.0, vertical: 4.0),
        child: GetOtpButton(
          text: 'Verify Otp',
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
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}

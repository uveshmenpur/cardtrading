import 'package:cardtrading/ui/authentication/get_otp.dart';
import 'package:cardtrading/ui/authentication/mobile/helper/sign_in_text_field.dart';
import 'package:cardtrading/ui/utils/theme/assets.dart';
import 'package:cardtrading/ui/utils/theme/colors.dart';
import 'package:cardtrading/ui/utils/theme/my_strings.dart';
import 'package:cardtrading/ui/utils/theme/text_style.dart';
import 'package:cardtrading/ui/utils/widget/common_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SignInMobile extends ConsumerStatefulWidget {
  const SignInMobile({super.key});

  @override
  ConsumerState<SignInMobile> createState() => _SignInMobileState();
}

class _SignInMobileState extends ConsumerState<SignInMobile>{
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        backgroundColor: AppColors.background,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon:
              SvgPicture.asset('${AppAssets.svgLocation}arrow_right_line.svg'),
        ),
        title: Text(
          AppStrings.keySignIn,
          style: TextStyles.medium.copyWith(
            fontSize: 16.sp,
            color: AppColors.white,
          ),
        ),
        centerTitle: true,
      ),
      body: _bodyWidget(context),
    );
  }

  ///Body Widget
  Widget _bodyWidget(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    width: 0.6.sw,
                    child: Text(
                      AppStrings.keySignInTitle,
                      style: TextStyles.medium.copyWith(
                        fontSize: 18.sp,
                        color: AppColors.golden,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  SizedBox(
                    width: 0.9.sw,
                    child: Text(
                      AppStrings.keySignInContent,
                      style: TextStyles.regular.copyWith(
                        fontSize: 12.sp,
                        color: AppColors.checkoutTextColor,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 30.h,
                  ),

                  ///Enter Phone Number Text Fields
                  const SignInTextField(),
                ],
              ),
            ),
          ),
          Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 20.0, vertical: 25.0),
            child: _commonButton(context),
          ),
        ],
      ),
    );
  }

  ///Common Button
  Widget _commonButton(BuildContext context) {
    return CommonButton(
      buttonPadding: const EdgeInsets.symmetric(horizontal: 8.0),
      buttonHeight: 54.h,
      prefixWidget: Text(
        AppStrings.keyGetOtp,
        style: TextStyles.semiBold.copyWith(
          color: AppColors.selectedButtonText,
          fontSize: 16.sp,
        ),
      ),
      buttonText: '',
      suffixWidget: const Icon(
        Icons.arrow_forward_outlined,
        color: Colors.black,
      ),
      onPressed: () {
        if (_formKey.currentState!.validate()) {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) {
                return const GetOtp();
              },
            ),
          );
        }
      },
    );
  }
}

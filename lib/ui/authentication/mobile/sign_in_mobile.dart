import 'package:cardtrading/ui/authentication/mobile/helper/sign_in_body.dart';
import 'package:cardtrading/ui/utils/theme/assets.dart';
import 'package:cardtrading/ui/utils/theme/colors.dart';
import 'package:cardtrading/ui/utils/theme/my_strings.dart';
import 'package:cardtrading/ui/utils/theme/text_style.dart';
import 'package:cardtrading/ui/utils/widget/common_appbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SignInMobile extends ConsumerStatefulWidget {
  const SignInMobile({super.key});

  @override
  ConsumerState<SignInMobile> createState() => _SignInMobileState();
}

class _SignInMobileState extends ConsumerState<SignInMobile> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: CommonAppBar(
        backgroundColor: AppColors.background,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon:
              SvgPicture.asset('${AppAssets.svgLocation}arrow_right_line.svg'),
        ),
        titleWidget: Text(
          AppStrings.keySignIn,
          style: TextStyles.medium.copyWith(
            fontSize: 16.sp,
            color: AppColors.white,
          ),
        ),
        isTitleCentered: true,
      ),
      body: SignInBodyWidget(formKey: _formKey),
    );
  }

}


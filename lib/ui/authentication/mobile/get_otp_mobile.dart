import 'package:cardtrading/framework/controllers/authentication/get_otp_controller.dart';
import 'package:cardtrading/ui/authentication/mobile/helper/get_otp_body_widget.dart';
import 'package:cardtrading/ui/onboarding/onboarding.dart';
import 'package:cardtrading/ui/utils/theme/assets.dart';
import 'package:cardtrading/ui/utils/theme/colors.dart';
import 'package:cardtrading/ui/utils/theme/my_strings.dart';
import 'package:cardtrading/ui/utils/theme/text_style.dart';
import 'package:cardtrading/ui/utils/widget/common_appbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class GetOtpMobile extends ConsumerStatefulWidget {
  const GetOtpMobile({super.key});

  @override
  ConsumerState<GetOtpMobile> createState() => _GetOtpMobileState();
}

class _GetOtpMobileState extends ConsumerState<GetOtpMobile> {

  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    SchedulerBinding.instance.addPostFrameCallback((_) {
      final getOtpWatch = ref.watch(getOtpController);
      getOtpWatch.startTimer();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: CommonAppBar(
        titleWidget: Text(
          AppStrings.keyVerification,
          style: TextStyles.medium.copyWith(
            fontSize: 16.sp,
            color: AppColors.white,
          ),
        ),
        leading: IconButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) {
                  return const OnBoardingOne();
                },
              ),
            );
          },
          icon: SvgPicture.asset(
            '${AppAssets.svgLocation}arrow_right_line.svg',
            width: 24.w,
            height: 24.h,
          ),
        ),
        isTitleCentered: true,
        backgroundColor: AppColors.background,
      ),
      body: GetOtpBodyWidget(formKey: _formKey),
    );
  }
}

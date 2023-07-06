import 'package:cardtrading/ui/home_screen/home_screen.dart';
import 'package:cardtrading/ui/utils/theme/assets.dart';
import 'package:cardtrading/ui/utils/theme/colors.dart';
import 'package:cardtrading/ui/utils/theme/my_strings.dart';
import 'package:cardtrading/ui/utils/theme/text_style.dart';
import 'package:cardtrading/ui/utils/widget/common_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class AddAddressMobile extends StatefulWidget {
  const AddAddressMobile({super.key});

  static const states = [
    'Ahmedabad',
    'Gandhinagar',
    'Surat',
    'Vadodara'
  ];

  @override
  State<AddAddressMobile> createState() => _AddAddressMobileState();
}

class _AddAddressMobileState extends State<AddAddressMobile> {
  String? state = '';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        backgroundColor: AppColors.background,
        elevation: 0,
        centerTitle: true,
        title: Text(
          AppStrings.keyCompleteYourProfile,
          style: TextStyles.medium.copyWith(
            fontSize: 16.sp,
          ),
        ),
        leading: Padding(
          padding: const EdgeInsets.all(12.0),
          child: InkWell(
            onTap: () {
              Navigator.pop(context);
            },
            child: SvgPicture.asset(
              '${AppAssets.svgLocation}arrow_right_line.svg',
              width: 16.w,
              height: 16.h,
            ),
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Column(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        flex: 3,
                        child: SizedBox(
                          width: 180,
                          child: Text(
                            AppStrings.keyEnterYourAddress,
                            softWrap: true,
                            maxLines: 3,
                            style: TextStyles.medium.copyWith(
                              fontSize: 18.sp,
                              color: AppColors.golden,
                              height: 1.5,
                            ),
                          ),
                        ),
                      ),
                      const Spacer(
                        flex: 1,
                      ),
                      ...List.generate(
                        2,
                        (index) {
                          return Padding(
                            padding: const EdgeInsets.all(4.0),
                            child: Container(
                              width: 8.w,
                              height: 8.h,
                              decoration:
                                  const BoxDecoration(color: AppColors.primary),
                            ),
                          );
                        },
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 15.h,
                  ),
                  Text(
                    AppStrings.keyEnterYourAddressContent,
                    style: TextStyles.regular.copyWith(
                      fontSize: 12.sp,
                      color: AppColors.checkoutTextColor,
                      height: 1.5,
                    ),
                  ),
                  SizedBox(
                    height: 25.h,
                  ),
                  PopupMenuButton<String>(
                    onSelected: (string){
                      setState(() {
                        state = string;
                      });
                    },
                    initialValue: state,
                    itemBuilder: (BuildContext context) {
                      return AddAddressMobile.states.map<PopupMenuItem<String>>((String value) {
                        return PopupMenuItem(value: value, child: Text(value));
                      }).toList();
                    },
                    child: Text(state ?? AddAddressMobile.states[0]),
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 24.h),
              child: CommonButton(
                buttonPadding: const EdgeInsets.all(8.0),
                prefixWidget: Text(
                  AppStrings.keySignUp,
                  style: TextStyles.semiBold.copyWith(
                    color: AppColors.selectedButtonText,
                    fontSize: 16.sp,
                  ),
                ),
                buttonText: ' ',
                suffixWidget: const Icon(
                  Icons.arrow_forward_outlined,
                  color: AppColors.selectedButtonText,
                ),
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
          ],
        ),
      ),
    );
  }
}

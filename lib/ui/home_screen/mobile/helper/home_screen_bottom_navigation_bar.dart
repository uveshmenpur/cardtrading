import 'package:cardtrading/framework/controllers/home_screen/home_screen_controller.dart';
import 'package:cardtrading/ui/authentication/get_otp.dart';
import 'package:cardtrading/ui/card_shop/card_shop.dart';
import 'package:cardtrading/ui/home_screen/home_screen.dart';
import 'package:cardtrading/ui/utils/theme/colors.dart';
import 'package:cardtrading/ui/utils/theme/text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class HomeScreenBottomNavigationBar extends StatelessWidget {
  const HomeScreenBottomNavigationBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (BuildContext context, WidgetRef ref, Widget? child) {
        final homeScreenWatch = ref.watch(homeScreenController);
        return Padding(
          padding: EdgeInsets.only(bottom: 16.0.h),
          child: BottomNavigationBar(
            items: [
              ...List.generate(
                4,
                    (index) {
                  return BottomNavigationBarItem(
                      icon: Container(
                        padding: const EdgeInsets.only(top: 8.0),
                        decoration: BoxDecoration(
                          border: BorderDirectional(
                            top: BorderSide(
                              color: homeScreenWatch.id == index
                                  ? AppColors.primary
                                  : Colors.transparent,
                              width: 2.0,
                            ),
                          ),
                        ),
                        child: SvgPicture.asset(
                            homeScreenWatch.bottomNavigationBarSvgPath[index]),
                      ),
                      label: homeScreenWatch.bottomNavigationBarLabels[index],
                      tooltip: homeScreenWatch.bottomNavigationBarLabels[index],
                      backgroundColor: AppColors.background);
                },
              ),
            ],
            selectedFontSize: 10.sp,
            unselectedFontSize: 10.sp,
            backgroundColor: AppColors.background,
            currentIndex: homeScreenWatch.id,
            type: BottomNavigationBarType.shifting,
            showUnselectedLabels: true,
            selectedLabelStyle: TextStyles.regular
                .copyWith(color: AppColors.primary, fontSize: 12.sp),
            selectedItemColor: AppColors.primary,
            unselectedLabelStyle: TextStyles.regular
                .copyWith(color: AppColors.white, fontSize: 12.sp),
            onTap: (index) {
              homeScreenWatch.setId(newId: index);
              index == 1 || index == 3
                  ? Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) {
                    return const GetOtp();
                  },
                ),
              )
                  : index == 2
                  ? Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) {
                    return const CardShop();
                  },
                ),
              )
                  : Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) {
                    return const HomeScreen();
                  },
                ),
              );
            },
          ),
        );
      },
    );
  }
}

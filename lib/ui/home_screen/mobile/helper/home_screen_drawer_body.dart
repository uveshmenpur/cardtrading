import 'package:cardtrading/framework/controllers/home_screen/drawer_controller.dart';
import 'package:cardtrading/ui/about_us/about_us.dart';
import 'package:cardtrading/ui/about_us/terms_and_condition.dart';
import 'package:cardtrading/ui/authentication/sign_in.dart';
import 'package:cardtrading/ui/choose_language/choose_language.dart';
import 'package:cardtrading/ui/home_screen/mobile/home_screen_mobile.dart';
import 'package:cardtrading/ui/subscription_plan/subscription.dart';
import 'package:cardtrading/ui/utils/theme/assets.dart';
import 'package:cardtrading/ui/utils/theme/colors.dart';
import 'package:cardtrading/ui/utils/theme/text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class HomeScreenDrawerBody extends ConsumerStatefulWidget {
  const HomeScreenDrawerBody({super.key});

  @override
  ConsumerState<HomeScreenDrawerBody> createState() => _HomeScreenDrawerBodyState();
}

class _HomeScreenDrawerBodyState extends ConsumerState<HomeScreenDrawerBody> {

  @override
  Widget build(BuildContext context) {

    ///Drawer for Home Screen
    return Padding(
      padding: EdgeInsets.all(8.0.r),
      child: ListView.separated(
          shrinkWrap: true,
          physics: const BouncingScrollPhysics(),
          scrollDirection: Axis.vertical,
          itemBuilder: (context, index) {
            return Consumer(
              builder: (BuildContext context, WidgetRef ref, Widget? child) {
                final homeScreenDrawerWatch = ref.watch(homeScreenDrawerController);
                return ListTile(
                  title: Text(
                    homeScreenDrawerWatch.list[index],
                    style: TextStyles.medium.copyWith(
                        color:
                            index == homeScreenDrawerWatch.id ? AppColors.primary : AppColors.greyText),
                  ),
                  onTap: () {
                    if (index == 0) {
                      homeScreenDrawerWatch.setOrIncrementId(newId: index);
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) {
                            return const HomeScreenMobile();
                          },
                        ),
                      );
                    } else if (index == 3) {
                      homeScreenDrawerWatch.setOrIncrementId(newId: index);
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) {
                            return const Subscription();
                          },
                        ),
                      );
                    } else if (index == 5) {
                      homeScreenDrawerWatch.setOrIncrementId(newId: index);
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) {
                            return const TermsAndCondition();
                          },
                        ),
                      );
                    } else if (index == 6) {
                      homeScreenDrawerWatch.setOrIncrementId(newId: index);
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) {
                            return const ChooseLanguage();
                          },
                        ),
                      );
                    } else if (index == 9) {
                      homeScreenDrawerWatch.setOrIncrementId(newId: index);
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) {
                            return const AboutUs();
                          },
                        ),
                      );
                    } else {
                      homeScreenDrawerWatch.setOrIncrementId(newId: 0);
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) {
                            return const SignIn();
                          },
                        ),
                      );
                    }
                  },
                  trailing: index == homeScreenDrawerWatch.id
                      ? null
                      : SvgPicture.asset('${AppAssets.svgLocation}arrow_right.svg'),
                );
              },
            );
          },
          separatorBuilder: (context, index) {
            return Divider(
              height: 1.h,
            );
          },
          itemCount: 11),
    );
  }
}

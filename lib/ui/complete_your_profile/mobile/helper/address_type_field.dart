import 'package:cardtrading/framework/controllers/complete_your_profile/complete_profile_controller.dart';
import 'package:cardtrading/ui/utils/theme/colors.dart';
import 'package:cardtrading/ui/utils/theme/text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AddressTypeField extends StatelessWidget {
  const AddressTypeField({super.key,});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        ...List.generate(
          3,
              (index) {
            return Row(
              children: [
                Consumer(
                    builder: (context,ref,widget) {
                      final completeProfileWatch = ref.watch(completeProfileController);
                      return InkWell(
                        child: Container(
                          decoration: BoxDecoration(
                            color:
                            completeProfileWatch.id == index
                                ? AppColors.primary
                                : AppColors.buttonBg,
                          ),
                          padding: EdgeInsets.symmetric(
                              horizontal: 16.0.w,
                              vertical: 8.0.h),
                          child: Text(
                            completeProfileWatch
                                .addressTypes[index],
                            style: TextStyles.regular.copyWith(
                              color: completeProfileWatch.id ==
                                  index
                                  ? AppColors.selectedButtonText
                                  : AppColors.greyText,
                              fontSize: 12.sp,
                            ),
                          ),
                        ),
                        onTap: () {
                          completeProfileWatch.setId(index);
                        },
                      );
                    }
                ),
                SizedBox(
                  width: 10.0.w,
                ),
              ],
            );
          },
        ),
      ],
    );
  }
}



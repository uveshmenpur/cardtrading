import 'package:cardtrading/ui/utils/theme/colors.dart';
import 'package:cardtrading/ui/utils/theme/my_strings.dart';
import 'package:cardtrading/ui/utils/theme/text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AddAddressHeader extends StatelessWidget {
  const AddAddressHeader({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
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
        const Spacer(),
        ...List.generate(
          2,
              (index) {
            return Padding(
              padding: const EdgeInsets.all(4.0),
              child: Container(
                width: 8.w,
                height: 8.h,
                decoration: const BoxDecoration(
                    color: AppColors.primary),
              ),
            );
          },
        ),
      ],
    );
  }
}

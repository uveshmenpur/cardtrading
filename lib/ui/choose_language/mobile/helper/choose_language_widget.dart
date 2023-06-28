import 'package:cardtrading/ui/utils/theme/colors.dart';
import 'package:cardtrading/ui/utils/theme/text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ChooseLanguageWidget extends StatelessWidget {
  const ChooseLanguageWidget(
      {super.key,
      required this.text,
      this.onPressed,
      required this.isSelected});

  //define whether
  final bool isSelected;
  final String text;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Container(
        width: double.infinity,
        height: 55.h,
        decoration: BoxDecoration(
          color: isSelected ? AppColors.primary : AppColors.buttonBg,
        ),
        child: MaterialButton(
          onPressed: onPressed,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                text,
                style: TextStyles.light.copyWith(
                  color: isSelected
                      ? AppColors.selectedButtonText
                      : AppColors.buttonText,
                  fontSize: 16.sp,
                ),
              ),
              Container(
                child: isSelected
                    ? const Icon(
                        Icons.check,
                        color: Colors.black,
                      )
                    : null,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

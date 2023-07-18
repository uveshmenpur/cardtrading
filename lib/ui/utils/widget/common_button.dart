import 'package:cardtrading/ui/utils/theme/colors.dart';
import 'package:cardtrading/ui/utils/theme/text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CommonButton extends StatelessWidget {
  final VoidCallback? onPressed;
  final Widget? prefixWidget;
  final Widget? suffixWidget;
  final String buttonText;
  final TextStyle? buttonTextStyle;
  final Color? buttonTextColor;
  final double? buttonFontSize;
  final Color? buttonBackgroundColor;
  final Color? buttonBorderColor;
  final BorderRadius? buttonBorderRadius;
  final EdgeInsetsGeometry? buttonPadding;
  final TextAlign? align;
  final double? buttonHeight;
  final MainAxisSize? mainAxisSize;

  const CommonButton({
    super.key,
    this.onPressed,
    this.prefixWidget,
    this.suffixWidget,
    required this.buttonText,
    this.buttonTextStyle,
    this.buttonTextColor,
    this.buttonFontSize,
    this.buttonBackgroundColor,
    this.buttonBorderColor,
    this.buttonBorderRadius,
    this.buttonPadding,
    this.buttonHeight,
    this.align, this.mainAxisSize,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Container(
        height: buttonHeight ?? 50.h,
        padding: buttonPadding,
        decoration: BoxDecoration(
          borderRadius: buttonBorderRadius,
          border: Border.all(
            color: buttonBorderColor ?? Colors.transparent,
          ),
          color: buttonBackgroundColor ?? AppColors.primary,
        ),
        child: Row(
          mainAxisSize: mainAxisSize ?? MainAxisSize.max,
          children: [
            prefixWidget ?? const SizedBox(),
            Expanded(
              child: Text(
                buttonText,
                textAlign: align ?? TextAlign.center,
                style: buttonTextStyle ??
                    TextStyles.semiBold.copyWith(
                      fontSize: buttonFontSize ?? 16.sp,
                      color: AppColors.selectedButtonText,
                      overflow: TextOverflow.ellipsis
                    ),
              ),
            ),
            suffixWidget ?? const SizedBox()
          ],
        ),
      ),
    );
  }
}

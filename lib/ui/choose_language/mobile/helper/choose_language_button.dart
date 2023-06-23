import 'package:cardtrading/ui/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ChooseLanguageButton extends StatefulWidget {
  const ChooseLanguageButton(
      {super.key,
        required this.text,
        this.onPressed,
        required this.isSelected});

  //define whether
  final bool isSelected;
  final String text;
  final VoidCallback? onPressed;

  @override
  State<ChooseLanguageButton> createState() => _ChooseLanguageButtonState();
}

class _ChooseLanguageButtonState extends State<ChooseLanguageButton> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 55.h,
      padding: REdgeInsets.only(
        left: 10.r,
        right: 10.r,
        top: 6.0.h,
        bottom: 6.0.h,
      ),
      child: TextButton(
        onPressed: widget.onPressed,
        style: TextButton.styleFrom(
          backgroundColor:
          widget.isSelected ? MyColors.primary : MyColors.buttonBg,
          padding: REdgeInsets.symmetric(
            vertical: 10,
            horizontal: 20,
          ),
          shape: RoundedRectangleBorder(
            side: BorderSide(
              color: widget.isSelected ? MyColors.primary : MyColors.buttonBg,
              width: 2,
            ),
            borderRadius: BorderRadius.circular(4),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              widget.text,
              style: TextStyle(
                color: widget.isSelected
                    ? MyColors.selectedButtonText
                    : MyColors.buttonText,
                fontSize: 17,
              ),
            ),
            Container(
              child: widget.isSelected
                  ? const Icon(
                Icons.check,
                color: Colors.black,
              )
                  : null,
            ),
          ],
        ),
      ),
    );
  }
}

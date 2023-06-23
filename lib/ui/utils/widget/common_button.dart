import 'package:cardtrading/ui/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CommonButton extends StatefulWidget {
  const CommonButton({
    super.key,
    required this.text,
    this.onPressed,
  });

  //define whether
  final String text;
  final VoidCallback? onPressed;

  @override
  State<CommonButton> createState() => _CommonButtonState();
}

class _CommonButtonState extends State<CommonButton> {
  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: widget.onPressed,
      style: TextButton.styleFrom(
        backgroundColor: MyColors.primary,
        padding: REdgeInsets.symmetric(
          vertical: 10,
          horizontal: 15,
        ),
        shape: RoundedRectangleBorder(
          side: const BorderSide(
            color: MyColors.primary,
            width: 2,
          ),
          borderRadius: BorderRadius.circular(4),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            widget.text,
            style: const TextStyle(
              color: MyColors.selectedButtonText,
              fontSize: 17,
            ),
          )
        ],
      ),
    );
  }
}

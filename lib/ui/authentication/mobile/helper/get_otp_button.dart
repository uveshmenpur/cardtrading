import 'package:cardtrading/ui/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class GetOtpButton extends StatefulWidget {
  const GetOtpButton({
    super.key,
    required this.text,
    this.onPressed,
  });

  //define whether
  final String text;
  final VoidCallback? onPressed;

  @override
  State<GetOtpButton> createState() => _GetOtpButtonState();
}

class _GetOtpButtonState extends State<GetOtpButton> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.0.r, vertical: 10.0.r),
      child: TextButton(
        onPressed: widget.onPressed,
        style: TextButton.styleFrom(
          backgroundColor: MyColors.primary,
          padding: REdgeInsets.symmetric(
            vertical: 10,
            horizontal: 20,
          ),
          shape: RoundedRectangleBorder(
            side: const BorderSide(
              color: MyColors.primary,
              width: 2,
            ),
            borderRadius: BorderRadius.circular(3),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              widget.text,
              style: const TextStyle(
                color: MyColors.selectedButtonText,
                fontSize: 18,
                fontWeight: FontWeight.w600,
              ),
            ),
            const Icon(
              Icons.arrow_forward_outlined,
              color: Colors.black,
            ),
          ],
        ),
      ),
    );
  }
}

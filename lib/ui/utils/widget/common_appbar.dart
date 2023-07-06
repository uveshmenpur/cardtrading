import 'package:cardtrading/ui/utils/theme/colors.dart';
import 'package:flutter/material.dart';

class CommonAppBar extends StatelessWidget implements PreferredSizeWidget{
  const CommonAppBar({super.key, this.leading, required this.title, this.backgroundColor, this.elevation, this.centerTitle, this.onLeadingPressed,});
  final Widget? leading;
  final Widget title;
  final Color? backgroundColor;
  final double? elevation;
  final Function()? onLeadingPressed;
  final bool? centerTitle;


  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: backgroundColor ?? AppColors.background,
      elevation: elevation ?? 0,
      centerTitle: centerTitle ?? true,
      leading: InkWell(onTap: onLeadingPressed,child: leading,),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(AppBar().preferredSize.height);
}

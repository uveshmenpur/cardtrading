import 'package:flutter/material.dart';

///Common Appbar for Card Trading Application
class CommonAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CommonAppBar({
    super.key,
    this.isLeadingEnable,
    this.isDrawerEnable,
    this.onLeadingPress,
    this.title,
    this.titleWidget,
    this.actions,
    this.backgroundColor,
    this.titleStyle,
    this.leading,
    this.isTitleCentered,
  });

  final bool? isLeadingEnable;
  final bool? isDrawerEnable;
  final bool? isTitleCentered;
  final Function()? onLeadingPress;
  final String? title;
  final Widget? titleWidget;
  final Widget? leading;
  final List<Widget>? actions;
  final Color? backgroundColor;
  final TextStyle? titleStyle;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: backgroundColor,
      elevation: 0,
      automaticallyImplyLeading: isLeadingEnable ?? false,
      centerTitle: isTitleCentered,
      leading: InkWell(
        onTap: onLeadingPress,
        child: leading,
      ),
      title: titleWidget ??
          Text(
            title ?? '',
            style: titleStyle,
          ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(AppBar().preferredSize.height);
}

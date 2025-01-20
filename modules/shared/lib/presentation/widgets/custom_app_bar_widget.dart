import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final Widget? title;
  final Widget? leading;
  final Color? backgroundColor;
  final Function()? onTapLeading;
  final bool? centerTitle;
  final List<Widget>? actions;
  final double toolbarHeight;
  final Widget? bottom;
  final bool automaticallyImplyLeading;

  const CustomAppBar({
    super.key,
    this.title,
    this.leading,
    this.backgroundColor,
    this.onTapLeading,
    this.centerTitle,
    this.actions = const [],
    this.bottom,
    this.toolbarHeight = kToolbarHeight,
    this.automaticallyImplyLeading = false,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      centerTitle: centerTitle,
      title: title,
      titleSpacing: 16,
      backgroundColor: backgroundColor,
      leading: automaticallyImplyLeading || Navigator.canPop(context)
          ? IconButton(
              onPressed: onTapLeading ?? () => Navigator.of(context).pop(),
              splashRadius: 24,
              icon: leading ?? const Icon(CupertinoIcons.back),
            )
          : null,
      actions: actions,
      bottom: bottom != null
          ? PreferredSize(preferredSize: Size.zero, child: bottom!)
          : null,
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(toolbarHeight);
}

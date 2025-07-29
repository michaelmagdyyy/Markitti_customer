import 'dart:math';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../utils/extensions.dart';
import 'custom_circle_icon.dart';

class GlobalAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String? title;
  final Widget? titleWidget;
  final dynamic data;
  final List<Widget>? actions;
  final PreferredSizeWidget? bottom;
  final bool withoutLeading;
  const GlobalAppBar({
    super.key,
    this.title,
    this.data,
    this.actions,
    this.bottom,
    this.withoutLeading = false,
    this.titleWidget,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      actions: actions,
      automaticallyImplyLeading: false,
      leading: withoutLeading
          ? null
          : PopScope(
              canPop: false,
              child: CustomRadiusIcon(
                onTap: () => Navigator.of(context).pop(data),
                size: 56.w,
                borderRadius: BorderRadius.circular(14.r),
                child: Transform.rotate(
                  angle: context.locale.languageCode == "en" ? pi : 0,
                  child: Icon(CupertinoIcons.back, size: 24.h),
                ),
              ).toEnd,
            ),
      bottom: bottom,
      titleSpacing: !withoutLeading && Navigator.canPop(context) ? 8.w : 24.w,
      leadingWidth: !withoutLeading && Navigator.canPop(context) ? 80.w : 0,
      centerTitle: false,
      title: title == null ? titleWidget : Text(title!),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight + 16.h + (bottom?.preferredSize.height ?? 0));
}

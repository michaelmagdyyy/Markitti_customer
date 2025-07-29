import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../gen/assets.gen.dart';
import '../utils/extensions.dart';
import 'custom_image.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final bool withBack;
  final Widget? suffixIcon;

  const CustomAppBar({super.key, this.title = '', this.withBack = true, this.suffixIcon});

  @override
  Widget build(BuildContext context) {
    return AppBar(
            centerTitle: true,
            toolbarHeight: 70.h,
            backgroundColor: context.scaffoldBackgroundColor,
            leading: GestureDetector(
                onTap: () {
                  Navigator.pop(context);
                },
                child: CustomImage(Assets.svg.back, width: 50.r, height: 50.r)),
            title: Text(title, style: context.semiboldText.copyWith(fontSize: 18.sp)))
        .withPadding(horizontal: 16.w);
  }

  @override
  Size get preferredSize => Size.fromHeight(70.h);
}

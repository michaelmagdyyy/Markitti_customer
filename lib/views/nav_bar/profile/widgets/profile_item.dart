import 'package:e_commerce/core/utils/extensions.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/widgets/custom_circle_icon.dart';
import '../../../../core/widgets/custom_image.dart';

class ProfileItem extends StatelessWidget {
  const ProfileItem({super.key, required this.image, required this.title, this.isLogout = false, this.onTap});

  final String image, title;
  final bool isLogout;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        width: 172.w,
        padding: EdgeInsets.all(8.r),
        decoration: BoxDecoration(
            color: isLogout ? Colors.transparent : context.hintColor.withOpacity(.3),
            borderRadius: BorderRadius.circular(8.r)),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            CustomRadiusIcon(
                    size: 40.r,
                    backgroundColor:
                        isLogout ? context.splashColor.withOpacity(.1) : context.primaryColorLight,
                    child: CustomImage(image,
                        width: 20.r,
                        height: 20.r,
                        color: isLogout ? context.splashColor : context.primaryColor))
                .withPadding(end: 8.w),
            Expanded(
              child: Text(
                title.tr(),
                style: context.mediumText.copyWith(
                    fontSize: 14.sp, color: isLogout ? context.splashColor : context.primaryColorDark),
              ),
            )
          ],
        ),
      ),
    );
  }
}

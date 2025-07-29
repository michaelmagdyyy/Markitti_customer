import 'package:e_commerce/core/utils/extensions.dart';
import 'package:e_commerce/core/widgets/custom_circle_icon.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/widgets/custom_image.dart';
import '../../../../gen/assets.gen.dart';

class NotificationItem extends StatelessWidget {
  const NotificationItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(vertical: 11.h, horizontal: 10.w),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8.r),
          border: Border.all(color: context.borderColor),
          color: context.primaryColorLight),
      child: Row(children: [
        CustomRadiusIcon(
          size: 48.r,
          child: CustomImage(
            Assets.svg.notify,
            width: 24.r,
            height: 24.r,
          ),
        ).withPadding(end: 8.w),
        Expanded(
            child: Text('Ahmed Mohammed Registered and activated via your iCode ',
                    style: context.regularText.copyWith(fontSize: 14.sp))
                .withPadding(end: 8.w)),
        Text('12:36 pm',
            style: context.mediumText
                .copyWith(fontSize: 12, color: context.primaryColorDark.withOpacity(.5)))
      ]),
    ).withPadding(bottom: 16.h);
  }
}

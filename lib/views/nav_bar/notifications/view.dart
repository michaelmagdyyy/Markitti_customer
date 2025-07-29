import 'package:e_commerce/core/utils/extensions.dart';
import 'package:e_commerce/gen/locale_keys.g.dart';
import 'package:e_commerce/views/nav_bar/notifications/widgets/notification_item.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class NotificationsView extends StatelessWidget {
  const NotificationsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Text(LocaleKeys.notifications.tr(),
                    style: context.semiboldText.copyWith(fontSize: 20.sp))
                .withPadding(vertical: 24.h),
            Expanded(
                child: ListView.builder(
                    padding: EdgeInsets.symmetric(horizontal: 16.w),
                    itemCount: 15,
                    itemBuilder: (context, index) => const NotificationItem()))
          ],
        ),
      ),
    );
  }
}

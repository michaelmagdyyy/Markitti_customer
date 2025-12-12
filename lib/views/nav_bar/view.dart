import 'package:e_commerce/core/utils/extensions.dart';
import 'package:e_commerce/views/nav_bar/home/view.dart';
import 'package:e_commerce/views/nav_bar/notifications/view.dart';
import 'package:e_commerce/views/nav_bar/profile/view.dart';
import 'package:easy_localization/easy_localization.dart' as t;
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../core/widgets/custom_image.dart';
import '../../gen/assets.gen.dart';
import '../../gen/locale_keys.g.dart';
import 'new_service/view.dart';

class NavBar extends StatefulWidget {
  const NavBar({super.key});

  @override
  State<NavBar> createState() => _NavBarState();
}

class _NavBarState extends State<NavBar> {
  int currentIndex = 0;

  List icons = [Assets.svg.home, Assets.svg.service, Assets.svg.notifications, Assets.svg.profile];
  List filledIcons = [
    Assets.svg.homeFilled,
    Assets.svg.serviceFilled,
    Assets.svg.notificationsFilled,
    Assets.svg.profileFilled
  ];
  List titles = [
    LocaleKeys.home,
    LocaleKeys.new_services,
    LocaleKeys.notifications,
    LocaleKeys.my_profile
  ];
  List<Widget> pages = [
    const HomeView(),
    const NewServiceView(),
    const NotificationsView(),
    const ProfileView(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: pages[currentIndex].withPadding(bottom: 0.h),
      bottomNavigationBar: SafeArea(
        child: Container(
          height: 70.h,
          padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 16.h),
          decoration: BoxDecoration(
            color: context.focusColor,
            borderRadius:
                BorderRadius.only(topLeft: Radius.circular(24.r), topRight: Radius.circular(24.r)),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: List.generate(
              4,
              (index) => InkWell(
                onTap: () {
                  currentIndex = index;
                  setState(() {});
                },
                child: NavBarItem(
                  title: titles[index],
                  icon: currentIndex == index ? filledIcons[index] : icons[index],
                  isActive: currentIndex == index,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class NavBarItem extends StatelessWidget {
  const NavBarItem({super.key, required this.title, required this.icon, required this.isActive});

  final String title, icon;
  final bool isActive;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(32.r),
          color: isActive ? context.primaryColorLight : Colors.transparent),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Directionality(
              textDirection:
                  context.locale.languageCode == "ar" ? TextDirection.ltr : TextDirection.rtl,
              child: CustomImage(icon,
                  color: isActive ? context.focusColor : context.primaryColorLight,
                  height: 20.r,
                  width: 20.r)),
          if (isActive)
            Text(title.tr(),
                    style: context.semiboldText.copyWith(
                        fontSize: 12.sp,
                        color: isActive ? context.focusColor : context.primaryColorDark))
                .withPadding(start: 2.w),
        ],
      ),
    );
  }
}

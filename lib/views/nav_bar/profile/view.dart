import 'package:e_commerce/core/routes/app_routes_fun.dart';
import 'package:e_commerce/core/services/cache_helper.dart';
import 'package:e_commerce/core/utils/extensions.dart';
import 'package:e_commerce/views/nav_bar/profile/widgets/profile_item.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/routes/routes.dart';
import '../../../core/widgets/custom_image.dart';
import '../../../gen/assets.gen.dart';
import '../../../gen/locale_keys.g.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            children: [
              CustomImage(Assets.svg.logo, width: 88.w, height: 28.h, color: context.primaryColorDark).center.withPadding(top: 24.h),
              Container(
                  padding: EdgeInsets.symmetric(vertical: 4.h, horizontal: 8.w),
                  decoration:
                      BoxDecoration(border: Border.all(color: context.borderColor, width: 2.r), borderRadius: BorderRadius.circular(8.r)),
                  child: Row(
                    children: [
                      CustomImage(Assets.svg.info, width: 20.r, height: 20.r).withPadding(end: 4.w),
                      FittedBox(
                        child: Text("Your Membership Will Expire on :",
                                style: context.mediumText.copyWith(fontSize: 12.sp, color: context.splashColor))
                            .withPadding(end: 2.w),
                      ),
                      Text("31-5-2024", style: context.boldText.copyWith(fontSize: 14.sp, color: context.splashColor))
                    ],
                  )).withPadding(vertical: 24.h, horizontal: 16.w),
              Stack(
                alignment: AlignmentDirectional.bottomEnd,
                children: [
                  CustomImage(Assets.images.test.path,
                      fit: BoxFit.cover, width: 120.r, height: 120.r, borderRadius: BorderRadius.circular(500.r)),
                  Container(
                      width: 32.r,
                      height: 32.r,
                      alignment: Alignment.center,
                      padding: EdgeInsets.all(8.r),
                      decoration: BoxDecoration(
                          gradient: LinearGradient(begin: Alignment.topCenter, end: Alignment.bottomCenter, colors: [
                            context.secondaryColor,
                            context.primaryColor,
                          ]),
                          shape: BoxShape.circle),
                      child: CustomImage(Assets.svg.edit, width: 16.r, height: 16.r))
                ],
              ).withPadding(horizontal: 16.w),
              Text(CacheHelper.getValue(AppCached.name) ?? "", style: context.semiboldText.copyWith(fontSize: 16.sp))
                  .withPadding(top: 8.h, bottom: 4.h, horizontal: 16.w),
              Text(CacheHelper.getValue(AppCached.email) ?? "", style: context.regularText.copyWith(fontSize: 14.sp))
                  .withPadding(bottom: 8.h, horizontal: 16.w),
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(LocaleKeys.card_number.tr(), style: context.semiboldText.copyWith(fontSize: 14.sp)).withPadding(end: 2.w),
                  Text(CacheHelper.getValue(AppCached.cardNum) ?? "",
                      style: context.semiboldText.copyWith(fontSize: 14.sp, color: context.primaryColor)),
                ],
              ).withPadding(horizontal: 16.w),
              Divider(height: 48.h, color: context.hintColor.withOpacity(.3), thickness: 12.h),
              CustomImage(Assets.images.balnce.path, width: double.infinity, height: 200.h),
              Text("All savings you got with ", style: context.mediumText.copyWith(fontSize: 16.sp)).withPadding(vertical: 16.h),
              CustomImage(Assets.images.digram.path, width: double.infinity, height: 116.h).withPadding(horizontal: 16.w),
              Text("Total Income you got ", style: context.mediumText.copyWith(fontSize: 16.sp)).withPadding(vertical: 16.h),
              CustomImage(Assets.images.dig.path, width: double.infinity, height: 116.h).withPadding(horizontal: 16.w),
              Divider(height: 48.h, color: context.hintColor.withOpacity(.3), thickness: 12.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                      onTap: () {
                        push(NamedRoutes.editProfile);
                      },
                      child: ProfileItem(image: Assets.svg.user, title: "Personal information")),
                  ProfileItem(image: Assets.svg.profileAdd, title: "Invite Friends"),
                ],
              ).withPadding(horizontal: 16.w, bottom: 16.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                      onTap: () {
                        push(NamedRoutes.staticPages, arg: {"title": "Partner Program"});
                      },
                      child: ProfileItem(image: Assets.svg.partner, title: "Partner Program")),
                  GestureDetector(
                      onTap: () {
                        push(NamedRoutes.staticPages, arg: {"title": "Terms and conditions"});
                      },
                      child: ProfileItem(image: Assets.svg.terms, title: "Terms and conditions")),
                ],
              ).withPadding(horizontal: 16.w, bottom: 16.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ProfileItem(image: Assets.svg.profileAdd, title: "Follow up invitations"),
                  GestureDetector(
                      onTap: () {
                        push(NamedRoutes.editPassword);
                      },
                      child: ProfileItem(image: Assets.svg.lock, title: "Reset Password")),
                ],
              ).withPadding(horizontal: 16.w, bottom: 16.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ProfileItem(image: Assets.svg.mode, title: "Drak Mood"),
                  ProfileItem(image: Assets.svg.lang, title: "Language"),
                ],
              ).withPadding(horizontal: 16.w, bottom: 16.h),
              ProfileItem(
                image: Assets.svg.logout,
                title: "Sign out",
                isLogout: true,
                onTap: () {
                  CacheHelper.clear();
                  pushAndRemoveUntil(NamedRoutes.login);
                },
              ).toTopStart.withPadding(horizontal: 16.w),
            ],
          ).withPadding(bottom: 24.h, top: 8.h),
        ),
      ),
    );
  }
}

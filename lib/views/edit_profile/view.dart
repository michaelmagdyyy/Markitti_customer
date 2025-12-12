import 'package:e_commerce/core/utils/extensions.dart';
import 'package:e_commerce/core/widgets/app_bar.dart';
import 'package:e_commerce/core/widgets/app_btn.dart';
import 'package:e_commerce/core/widgets/app_field.dart';
import 'package:e_commerce/gen/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../core/widgets/custom_image.dart';
import '../../gen/assets.gen.dart';

class EditProfileView extends StatelessWidget {
  const EditProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(title: "Personal information"),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 16.h),
        child: Column(
          children: [
            Stack(
              alignment: AlignmentDirectional.bottomEnd,
              children: [
                CustomImage(Assets.images.test.path,
                    fit: BoxFit.cover,
                    width: 120.r,
                    height: 120.r,
                    borderRadius: BorderRadius.circular(500.r)),
                Container(
                    width: 32.r,
                    height: 32.r,
                    alignment: Alignment.center,
                    padding: EdgeInsets.all(8.r),
                    decoration: BoxDecoration(
                        gradient: LinearGradient(
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                            colors: [
                              context.secondaryColor,
                              context.primaryColor,
                            ]),
                        shape: BoxShape.circle),
                    child: CustomImage(Assets.svg.edit, width: 16.r, height: 16.r))
              ],
            ).withPadding(horizontal: 16.w).center.withPadding(vertical: 24.h),
            AppField(title: LocaleKeys.mobile.tr()),
            AppField(title: LocaleKeys.province.tr(), onTap: () {}),
            AppField(title: LocaleKeys.area.tr(), onTap: () {}),
            AppField(title: "Age Range".tr(), onTap: () {}),
          ],
        ),
      ),
      bottomNavigationBar:  AppBtn(title: "Update".tr()).withPadding(all: 16.w),
    );
  }
}

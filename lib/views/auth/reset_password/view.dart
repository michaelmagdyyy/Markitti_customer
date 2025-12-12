import 'package:e_commerce/core/utils/extensions.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/routes/app_routes_fun.dart';
import '../../../core/routes/routes.dart';
import '../../../core/widgets/app_bar.dart';
import '../../../core/widgets/app_btn.dart';
import '../../../core/widgets/app_field.dart';
import '../../../core/widgets/custom_image.dart';
import '../../../gen/assets.gen.dart';
import '../../../gen/locale_keys.g.dart';
import '../../../gen/my_images.dart';

class ResetPasswordView extends StatelessWidget {
  const ResetPasswordView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: LocaleKeys.new_password),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomImage(MyImages.logo, width: 100.w, height: 50.h)
                  .center,
              Text(LocaleKeys.password_hint.tr(),
                      style: context.regularText.copyWith(
                          fontSize: 16.sp, color: context.primaryColorDark.withOpacity(.8)))
                  .withPadding(vertical: 24.h),
              AppField(
                  title: LocaleKeys.new_password.tr(),
                  hintText: "***********",
                  keyboardType: TextInputType.visiblePassword),
              AppField(
                  title: LocaleKeys.confirm_password.tr(),
                  hintText: "***********",
                  keyboardType: TextInputType.visiblePassword),
              AppBtn(
                  title: LocaleKeys.confirm_password.tr(),
                  onPressed: () {
                    pushAndRemoveUntil(NamedRoutes.login);
                  }).withPadding(top: 24.h),
            ],
          ),
        ),
      ),
    );
  }
}

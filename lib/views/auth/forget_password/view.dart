import 'package:e_commerce/core/utils/extensions.dart';
import 'package:e_commerce/core/widgets/app_field.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/routes/app_routes_fun.dart';
import '../../../core/routes/routes.dart';
import '../../../core/widgets/app_bar.dart';
import '../../../core/widgets/app_btn.dart';
import '../../../core/widgets/custom_image.dart';
import '../../../gen/assets.gen.dart';
import '../../../gen/locale_keys.g.dart';

class ForgetPasswordView extends StatelessWidget {
  const ForgetPasswordView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: LocaleKeys.recover_password.tr()),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomImage(Assets.svg.logo,
                      width: 88.w, height: 28.h, color: context.primaryColorDark)
                  .center,
              Text(LocaleKeys.recover_password_message.tr(),
                      style: context.regularText.copyWith(
                          fontSize: 16.sp, color: context.primaryColorDark.withOpacity(.8)))
                  .withPadding(vertical: 24.h),
              AppField(title: LocaleKeys.mobile.tr()),
              AppBtn(
                  title: LocaleKeys.continue_button.tr(),
                  onPressed: () {
                    push(NamedRoutes.verify,arg: {"fromLogin":true});
                  }).withPadding(top: 24.h),
            ],
          ),
        ),
      ),
    );
  }
}

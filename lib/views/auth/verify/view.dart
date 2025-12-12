import 'dart:async';

import 'package:e_commerce/core/routes/app_routes_fun.dart';
import 'package:e_commerce/core/routes/routes.dart';
import 'package:e_commerce/core/utils/extensions.dart';
import 'package:e_commerce/core/widgets/app_bar.dart';
import 'package:e_commerce/core/widgets/app_btn.dart';
import 'package:e_commerce/core/widgets/pin_code.dart';
import 'package:e_commerce/gen/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/widgets/custom_image.dart';
import '../../../gen/assets.gen.dart';
import '../../../gen/my_images.dart';

class VerifyView extends StatefulWidget {
  const VerifyView({super.key, required this.fromLogin});

  final bool fromLogin;

  @override
  State<VerifyView> createState() => _VerifyViewState();
}

class _VerifyViewState extends State<VerifyView> {
  int seconds = 30;
  Timer? timer;

  void startTimer() {
    timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (seconds > 0) {
        seconds--;
      }
      if (mounted) {
        setState(() {});
      }
    });
  }

  @override
  void initState() {
    super.initState();
    startTimer();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: LocaleKeys.recover_password),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomImage(MyImages.logo, width: 100.w, height: 50.h)
                  .center,
              Text(LocaleKeys.enter_otp_message.tr(),
                      style: context.regularText.copyWith(
                          fontSize: 16.sp, color: context.primaryColorDark.withOpacity(.8)))
                  .withPadding(vertical: 24.h),
              Text(LocaleKeys.edit_email.tr(),
                  style: context.mediumText.copyWith(fontSize: 14.sp, color: context.primaryColor)),
              const CustomPinCode(),
              Row(
                children: [
                  Text(LocaleKeys.did_you_receive_the_code.tr(),
                          style: context.mediumText.copyWith(fontSize: 14.sp))
                      .withPadding(end: 3.w),
                  GestureDetector(
                      onTap: () {
                        if (seconds == 0) {
                          seconds = 30;
                          setState(() {});
                          // bloc.add(ResendCodeEvent(phone: widget.phone, phoneCode: widget.phoneCode));
                        }
                      },
                      child: Text(LocaleKeys.resend.tr(),
                          style: context.semiboldText.copyWith(
                              fontSize: 14.sp,
                              color: seconds == 0
                                  ? context.primaryColor
                                  : context.primaryColor.withOpacity(.5)))),
                  const Spacer(),
                  Text(seconds == 0 ? "" : "0:$seconds",
                      style:
                          context.mediumText.copyWith(fontSize: 12.sp, color: context.hintColor)),
                ],
              ),
              AppBtn(
                  title: LocaleKeys.send.tr(),
                  onPressed: () {
                    if (widget.fromLogin) {
                      push(NamedRoutes.resetPassword);
                    } else {
                      pushAndRemoveUntil(NamedRoutes.navBar);
                    }
                  }).withPadding(top: 24.h),
            ],
          ),
        ),
      ),
    );
  }
}

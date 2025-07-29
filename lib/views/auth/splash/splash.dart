import 'dart:async';

import 'package:e_commerce/core/services/cache_helper.dart';
import 'package:e_commerce/core/utils/extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/routes/app_routes_fun.dart';
import '../../../core/routes/routes.dart';
import '../../../core/widgets/custom_image.dart';
import '../../../gen/assets.gen.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  @override
  void initState() {
    Timer(3.seconds, () {
      if (CacheHelper.getValue(AppCached.token) != null) {
        pushAndRemoveUntil(NamedRoutes.navBar);
      } else {
        pushAndRemoveUntil(NamedRoutes.login);
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          width: double.infinity,
          height: double.infinity,
          decoration: BoxDecoration(
              gradient: LinearGradient(begin: Alignment.topCenter, end: Alignment.bottomCenter, colors: [
            context.secondaryColor,
            context.primaryColor,
          ])),
          child: CustomImage(Assets.svg.logo, width: 120.w, height: 38.h)),
    );
  }
}

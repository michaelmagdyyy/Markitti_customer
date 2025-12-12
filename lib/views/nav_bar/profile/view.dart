import 'package:e_commerce/core/routes/app_routes_fun.dart';
import 'package:e_commerce/core/services/cache_helper.dart';
import 'package:e_commerce/core/utils/extensions.dart';
import 'package:e_commerce/views/nav_bar/profile/widgets/profile_item.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/routes/routes.dart';
import '../../../core/services/service_locator.dart';
import '../../../core/utils/app_theme.dart';
import '../../../core/widgets/custom_image.dart';
import '../../../gen/assets.gen.dart';
import '../../../gen/locale_keys.g.dart';
import '../../../gen/my_images.dart';
import '../home/HomeBloc/home_bloc.dart';

class ProfileView extends StatefulWidget {
  const ProfileView({super.key});

  @override
  State<ProfileView> createState() => _ProfileViewState();
}

class _ProfileViewState extends State<ProfileView> {
  late final homeBloc = sl<HomeBloc>();
  @override
  void initState() {
    super.initState();
    homeBloc.add(GetSavingsCurrentMonthEvent());
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            children: [
              CustomImage(MyImages.logo, width: 100.w, height: 50.h).center.withPadding(top: 24.h),
              Container(
                  padding: EdgeInsets.symmetric(vertical: 4.h, horizontal: 8.w),
                  decoration:
                      BoxDecoration(border: Border.all(color: context.borderColor, width: 2.r), borderRadius: BorderRadius.circular(8.r)),
                  child: Row(
                    children: [
                      CustomImage(Assets.svg.info, width: 20.r, height: 20.r).withPadding(end: 4.w),
                      FittedBox(
                        child: Text("Your Membership Will Expire on :".tr(),
                                style: context.mediumText.copyWith(fontSize: 12.sp, color: context.splashColor))
                            .withPadding(end: 2.w),
                      ),
                      Text("${CacheHelper.getValue(AppCached.subscription_ends_at) ?? ""}", style: context.boldText.copyWith(fontSize: 14.sp, color: context.splashColor))
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
              // CustomImage(Assets.images.balnce.path, width: double.infinity, height: 200.h),
              // Text("All savings you got with ", style: context.mediumText.copyWith(fontSize: 16.sp)).withPadding(vertical: 16.h),
              // CustomImage(Assets.images.digram.path, width: double.infinity, height: 116.h).withPadding(horizontal: 16.w),
              // Text("Total Income you got ", style: context.mediumText.copyWith(fontSize: 16.sp)).withPadding(vertical: 16.h),
              // CustomImage(Assets.images.dig.path, width: double.infinity, height: 116.h).withPadding(horizontal: 16.w),

              // Card widget
              Container(
                width: MediaQuery.of(context).size.width,
                margin: const EdgeInsets.all(16),
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  gradient: const LinearGradient(
                    colors: [AppThemes.mainColor, AppThemes.secondaryColor],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                     Text("Hello ${CacheHelper.getValue(AppCached.name) ?? ""}",
                        style: TextStyle(color: Colors.white, fontSize: 18)),
                    const SizedBox(height: 8),
                    const Text("You Saved",
                        style: TextStyle(color: Colors.white, fontSize: 16)),
                    BlocConsumer<HomeBloc, HomeState>(
                      bloc: homeBloc,
                      listener: (context, state) {},
                      builder: (context, state) {
                        return Text("${homeBloc.savingsCurrentMonthModel?.tatalSavings??0} L.E",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 28,
                                fontWeight: FontWeight.bold));
                      },
                    ),
                    const Text("This month",
                        style: TextStyle(color: Colors.white, fontSize: 14)),
                    const SizedBox(height: 12),
                    Row( mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.white,
                            foregroundColor: Colors.black,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                          ),
                          onPressed: () {},
                          child: const Text("Recharge Now"),
                        ),
                      ],
                    ),
                  ],
                ),
              ),

              // Savings line chart
              const Text("All savings you got with",
                  style: TextStyle(fontSize: 18)),
              SizedBox(
                height: 200,
                child: LineChart(
                  LineChartData(
                    titlesData: FlTitlesData(show: true),
                    lineBarsData: [
                      LineChartBarData(
                        spots: [
                          FlSpot(0, 30),
                          FlSpot(1, 60),
                          FlSpot(2, 45),
                          FlSpot(3, 70),
                          FlSpot(4, 50),
                          FlSpot(5, 90),
                          FlSpot(6, 60),
                        ],
                        isCurved: true,
                        color: Colors.blue,
                        barWidth: 3,
                        belowBarData: BarAreaData(show: true,
                            color: Colors.blue.withOpacity(0.2)
                        ),
                      )
                    ],
                  ),
                ),
              ),

              // Income bar chart
              const SizedBox(height: 20),
              const Text("Total Income you got",
                  style: TextStyle(fontSize: 18)),
              SizedBox(
                height: 200,
                child: BarChart(
                  BarChartData(
                    titlesData: FlTitlesData(show: true),
                    barGroups: List.generate(12, (index) {
                      return BarChartGroupData(
                        x: index,
                        barRods: [
                          BarChartRodData(
                            toY: (index % 6 + 1) * 10,
                            color: Colors.blue,
                            width: 14,
                          ),
                        ],
                      );
                    }),
                  ),
                ),
              ),

              const SizedBox(height: 20),

              // Buttons row

              Divider(height: 48.h, color: context.hintColor.withOpacity(.3), thickness: 12.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                      onTap: () {
                        push(NamedRoutes.editProfile);
                      },
                      child: ProfileItem(image: Assets.svg.user, title: "Personal information")),
                  ProfileItem(onTap:(){
                    push(NamedRoutes.inviteFriends,);
                  },image: Assets.svg.profileAdd, title: "Invite Friends"),
                ],
              ).withPadding(horizontal: 16.w, bottom: 16.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                      onTap: () {
                        push(NamedRoutes.staticPages, arg: {"title": "Partner Program","isTerms":false});
                      },
                      child: ProfileItem(image: Assets.svg.partner, title: "Partner Program")),
                  GestureDetector(
                      onTap: () {
                        push(NamedRoutes.staticPages, arg: {"title": "Terms and conditions","isTerms":true});
                      },
                      child: ProfileItem(image: Assets.svg.terms, title: "Terms and conditions")),
                ],
              ).withPadding(horizontal: 16.w, bottom: 16.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ProfileItem(onTap:(){
                    push(NamedRoutes.followUpInvitations,);
                  },image: Assets.svg.profileAdd, title: "Follow up invitations"),
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
                  ProfileItem(onTap: (){
                    push(NamedRoutes.changeTheme,);
                  },image: Assets.svg.mode, title: "Change Theme"),
                  ProfileItem(onTap: (){
                    push(NamedRoutes.changeLang,);
                  },image: Assets.svg.lang, title: "Language"),
                ],
              ).withPadding(horizontal: 16.w, bottom: 16.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                      onTap: () {
                        push(NamedRoutes.favoritePage);
                      },
                      child: ProfileItem(image: Assets.svg.user, title: "Favorite List")),
                  GestureDetector(
                      onTap: () {
                        push(NamedRoutes.usageHistoryPage);
                      },
                      child: ProfileItem(image: Assets.svg.user, title: "Usage History")),
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

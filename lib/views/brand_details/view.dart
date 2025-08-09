import 'package:e_commerce/core/routes/app_routes_fun.dart';
import 'package:e_commerce/core/utils/extensions.dart';
import 'package:e_commerce/core/widgets/app_bar.dart';
import 'package:e_commerce/core/widgets/app_btn.dart';
import 'package:e_commerce/core/widgets/custom_image.dart';
import 'package:e_commerce/gen/assets.gen.dart';
import 'package:e_commerce/gen/locale_keys.g.dart';
import 'package:e_commerce/models/sub_category_brand.dart';
import 'package:e_commerce/views/brand_details/controller/bloc.dart';
import 'package:e_commerce/views/brand_details/controller/event.dart';
import 'package:e_commerce/views/brand_details/controller/state.dart';
import 'package:easy_localization/easy_localization.dart' as t;
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../core/routes/routes.dart';
import '../../core/services/service_locator.dart';
import '../../core/widgets/error_widget.dart';
import '../../core/widgets/loading.dart';

class BrandDetailsView extends StatefulWidget {
  const BrandDetailsView({super.key, required this.id, required this.model});

  final SubBrandModel model;
  final String id;

  @override
  State<BrandDetailsView> createState() => _BrandDetailsViewState();
}

class _BrandDetailsViewState extends State<BrandDetailsView> {
  late final bloc = sl<BrandDetailsBloc>()..add(StartBrandDetailsEvent(id: widget.id));
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder(
        bloc: bloc,
        builder: (context, state) => Scaffold(
              appBar: CustomAppBar(title: LocaleKeys.brand_details.tr()),
              body: state is LoadingBrandDetailsState || state is InitialBrandDetailsState
                  ? const LoadingApp()
                  : state is FailedBrandDetailsState
                      ? CustomErrorWidget(title: state.msg)
                      : SingleChildScrollView(
                          padding: EdgeInsets.symmetric(vertical: 16.h),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              StatefulBuilder(
                                  builder: (context, setState) => CustomImage(
                                        bloc.model?.photos?[currentIndex].brandPhoto ?? "",
                                        width: double.infinity,
                                        height: 260.h,
                                        child: Row(
                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                          children: [
                                            GestureDetector(
                                                onTap: () {

                                                  if (currentIndex > 0) {
                                                    --currentIndex;
                                                    setState(() {});
                                                  }
                                                },
                                                child: CustomImage(Assets.svg.arrow, width: 32.r, height: 32.r)),
                                            GestureDetector(
                                              onTap: () {
                                                if (currentIndex < (bloc.model?.photos?.length ?? 0)) {
                                                  ++currentIndex;
                                                  setState(() {});
                                                }
                                              },
                                              child: Directionality(
                                                  textDirection: TextDirection.rtl,
                                                  child: CustomImage(Assets.svg.arrow, width: 32.r, height: 32.r)),
                                            ),
                                          ],
                                        ).center.withPadding(horizontal: 16.w),
                                      )),
                              Row(
                                children: [
                                  CustomImage(
                                    widget.model.brandLogo,
                                    width: 56.r,
                                    height: 56.r,
                                    border: Border.all(color: context.borderColor),
                                    borderRadius: BorderRadius.circular(4.r),
                                  ),
                                  Expanded(
                                    child: Column(
                                      mainAxisSize: MainAxisSize.min,
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text(widget.model.brandName ?? "", style: context.boldText.copyWith(fontSize: 20.sp)),
                                        Row(
                                          children: List.generate(
                                            5,
                                            (index) => Icon(Icons.star_rate_rounded,
                                                size: 18.r,
                                                opticalSize: 18.r,
                                                color: index == 4 ? context.borderColor : context.hoverColor),
                                          ),
                                        )
                                      ],
                                    ).withPadding(start: 8.w),
                                  ),
                                  FittedBox(
                                    child: Text(
                                      "${widget.model.customerBrandDiscountPercentage}%",
                                      style: context.boldText.copyWith(fontSize: 24.sp, color: context.secondaryColor),
                                    ),
                                  )
                                ],
                              ).withPadding(horizontal: 16.w, vertical: 8.h),
                              Container(
                                padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 8.h),
                                decoration: BoxDecoration(
                                    border: Border.all(color: context.primaryColor), borderRadius: BorderRadius.circular(12.r)),
                                child: Row(
                                  children: [
                                    Expanded(
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Text("  ${LocaleKeys.monthlyPurchaseLimit.tr()} ${bloc.model?.availableMonthlyPurchaseLimit.toString() ?? "0"}",
                                              style: context.boldText.copyWith(fontSize: 14.sp, color: context.primaryColor)),
                                          Text("  ${LocaleKeys.dailyPurchaseLimit.tr()} ${bloc.model?.availableDailyPurchaseLimit.toString() ?? "0"}",
                                              style: context.boldText.copyWith(fontSize: 14.sp, color: context.primaryColor)),
                                        ],
                                      ),
                                    ),
                                    if (bloc.model!.availableDailyPurchaseLimit! > 0 && bloc.model!.availableMonthlyPurchaseLimit! > 0)
                                      AppBtn(
                                          title: LocaleKeys.generate_otp.tr(),
                                          onPressed: () {
                                            push(NamedRoutes.generateOTP, arg: {"brandModel": widget.model});
                                          },
                                          width: 144.w,
                                          height: 32.h)
                                  ],
                                ),
                              ).withPadding(horizontal: 16.w, vertical: 16.h),
                              SingleChildScrollView(
                                padding: EdgeInsets.symmetric(vertical: 16.h, horizontal: 16.w),
                                scrollDirection: Axis.horizontal,
                                child: Row(
                                  spacing: 16.w,
                                  children: List.generate(
                                      bloc.list.length,
                                      (index) => InkWell(
                                            splashColor: Colors.transparent,
                                            hoverColor: Colors.transparent,
                                            highlightColor: Colors.transparent,
                                            onTap: () {
                                              bloc.currentIndex = index;
                                              setState(() {});
                                            },
                                            child: Container(
                                              padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
                                              decoration: BoxDecoration(
                                                  color: context.primaryColor.withOpacity(.3), borderRadius: BorderRadius.circular(16.r)),
                                              child: Row(
                                                children: [
                                                  CustomImage(bloc.list[index].image, width: 20.r, height: 20.r, color: context.focusColor)
                                                      .withPadding(end: 8.w),
                                                  Text(bloc.list[index].name, style: context.mediumText.copyWith(fontSize: 16.sp))
                                                ],
                                              ).withPadding(horizontal: 16.w),
                                            ),
                                          )),
                                ),
                              ),
                              if (bloc.currentIndex == 0)
                                HtmlWidget(bloc.model?.brand?.description ?? "").withPadding(horizontal: 16.w)
                              else if (bloc.currentIndex == 1)
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    SizedBox(height: 24.h),
                                    ...List.generate(
                                      bloc.model?.branches?.length ?? 0,
                                      (index) => InkWell(
                                        onTap: () async {
                                          final Uri url = Uri.parse(bloc.model?.branches?[index].branchLocation ?? "");

                                          if (await canLaunchUrl(url)) {
                                            await launchUrl(url, mode: LaunchMode.externalApplication); // opens in YouTube app if available
                                          } else {
                                            throw 'Could not launch ';
                                          }
                                        },
                                        child: Container(
                                          width: double.infinity,
                                          margin: EdgeInsets.all(16.r),
                                          decoration: BoxDecoration(
                                              border: Border.all(color: context.primaryColor), borderRadius: BorderRadius.circular(12.r)),
                                          child: Column(
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            mainAxisSize: MainAxisSize.min,
                                            children: [
                                              Text(bloc.model?.branches?[index].branchName ?? "",
                                                  style: context.boldText.copyWith(fontSize: 20.h)),
                                              SizedBox(height: 8.h),
                                              Text(LocaleKeys.mobile.tr(), style: context.mediumText.copyWith(fontSize: 16.h)),
                                              SizedBox(height: 4.h),
                                              Text(bloc.model?.branches?[index].branchMobile_1 ?? "",
                                                  style: context.boldText.copyWith(fontSize: 14.h, color: context.primaryColor)),
                                              SizedBox(height: 4.h),
                                              Text(bloc.model?.branches?[index].branchMobile_2 ?? "",
                                                  style: context.boldText.copyWith(fontSize: 14.h, color: context.primaryColor)),
                                            ],
                                          ).withPadding(bottom: 16.h, horizontal: 24.w),
                                        ),
                                      ),
                                    )
                                  ],
                                )
                              else if (bloc.currentIndex == 2)
                                Column(mainAxisSize: MainAxisSize.min, crossAxisAlignment: CrossAxisAlignment.start, children: [
                                  SizedBox(height: 24.h),
                                  ...List.generate(
                                    bloc.model?.videos?.length ?? 0,
                                    (index) => InkWell(
                                      onTap: () async {
                                        final Uri url = Uri.parse(bloc.model?.videos?[index].brandVideoLink ?? "");

                                        if (await canLaunchUrl(url)) {
                                          await launchUrl(url, mode: LaunchMode.externalApplication); // opens in YouTube app if available
                                        } else {
                                          throw 'Could not launch ';
                                        }
                                      },
                                      child: Text(bloc.model?.videos?[index].brandVideoLink ?? "",
                                              style: context.boldText.copyWith(fontSize: 16.sp))
                                          .withPadding(horizontal: 24.w)
                                          .withPadding(bottom: 20.h),
                                    ),
                                  )
                                ])
                              else
                                const SizedBox(),
                              Divider(height: 48.h, color: context.hintColor.withOpacity(.3), thickness: 12.h),
                            ],
                          ),
                        ),
            ));
  }
}
/*
  InkWell(
                                      splashColor: Colors.transparent,
                                      hoverColor: Colors.transparent,
                                      highlightColor: Colors.transparent,
                                      onTap: () {
                                        showModalBottomSheet(
                                          context: context,
                                          builder: (context) => CustomAppSheet(
                                            title: LocaleKeys.branches.tr(),

                                          ),
                                        );
                                      },
                                      child: Container(
                                        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
                                        decoration: BoxDecoration(
                                            color: context.primaryColor.withOpacity(.3), borderRadius: BorderRadius.circular(16.r)),
                                        child: Row(
                                          children: [
                                            CustomImage(Assets.svg.branch, width: 20.r, height: 20.r, color: context.focusColor)
                                                .withPadding(end: 8.w),
                                            Text(LocaleKeys.branches.tr(), style: context.mediumText.copyWith(fontSize: 16.sp))
                                          ],
                                        ).withPadding(horizontal: 16.w),
                                      ),
                                    ),
                                    InkWell(
                                      splashColor: Colors.transparent,
                                      hoverColor: Colors.transparent,
                                      highlightColor: Colors.transparent,
                                      onTap: () {
                                        showModalBottomSheet(
                                          context: context,
                                          builder: (context) => CustomAppSheet(
                                            title: LocaleKeys.roles.tr(),
                                            children: [
                                              HtmlWidget(bloc.model?.brand?.roles ?? "").withPadding(vertical: 16.h),
                                            ],
                                          ),
                                        );
                                      },
                                      child: Container(
                                        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
                                        decoration: BoxDecoration(
                                            color: context.primaryColor.withOpacity(.3), borderRadius: BorderRadius.circular(16.r)),
                                        child: Row(
                                          children: [
                                            CustomImage(Assets.svg.partner, width: 20.r, height: 20.r, color: context.focusColor)
                                                .withPadding(end: 8.w),
                                            Text(LocaleKeys.roles.tr(), style: context.mediumText.copyWith(fontSize: 16.sp))
                                          ],
                                        ).withPadding(horizontal: 16.w),
                                      ),
                                    ),
                                    InkWell(
                                      splashColor: Colors.transparent,
                                      hoverColor: Colors.transparent,
                                      highlightColor: Colors.transparent,
                                      onTap: () {
                                        showModalBottomSheet(
                                          context: context,
                                          builder: (context) => CustomAppSheet(
                                            title: LocaleKeys.video.tr(),
                                            children: [
                                              SizedBox(height: 24.h),
                                              ...List.generate(
                                                bloc.model?.videos?.length ?? 0,
                                                (index) => Text(bloc.model?.videos?[index].brandVideoLink ?? "",
                                                        style: context.boldText.copyWith(fontSize: 16.sp))
                                                    .withPadding(bottom: 20.h),
                                              )
                                            ],
                                          ),
                                        );
                                      },
                                      child: Container(
                                        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
                                        decoration: BoxDecoration(
                                            color: context.primaryColor.withOpacity(.3), borderRadius: BorderRadius.circular(16.r)),
                                        child: Row(
                                          mainAxisSize: MainAxisSize.min,
                                          children: [
                                            CustomImage(Assets.svg.youtube, width: 20.r, height: 20.r, color: context.focusColor)
                                                .withPadding(end: 8.w),
                                            Text(LocaleKeys.video.tr(), style: context.mediumText.copyWith(fontSize: 16.sp))
                                          ],
                                        ),
                                      ),
                                    )
 */

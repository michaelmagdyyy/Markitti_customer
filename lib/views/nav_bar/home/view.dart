import 'package:carousel_slider/carousel_slider.dart';
import 'package:e_commerce/core/routes/app_routes_fun.dart';
import 'package:e_commerce/core/utils/extensions.dart';
import 'package:e_commerce/core/widgets/app_field.dart';
import 'package:e_commerce/core/widgets/custom_image.dart';
import 'package:e_commerce/core/widgets/error_widget.dart';
import 'package:e_commerce/core/widgets/loading.dart';
import 'package:e_commerce/gen/assets.gen.dart';
import 'package:e_commerce/gen/locale_keys.g.dart';
import 'package:e_commerce/views/categories/controller/bloc.dart';
import 'package:e_commerce/views/categories/controller/event.dart';
import 'package:e_commerce/views/categories/controller/state.dart';
import 'package:e_commerce/views/nav_bar/home/HomeBloc/home_bloc.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/routes/routes.dart';
import '../../../core/services/cache_helper.dart';
import '../../../core/services/service_locator.dart';
import '../../../gen/my_images.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  final bloc = sl<CategoriesBloc>()..add(StartCategoriesEvent());
  late final homeBloc = sl<HomeBloc>();

  @override
  void initState() {
    super.initState();
    homeBloc.add(GetSavingsCurrentMonthEvent());
    homeBloc.add(GetSliderEvent());
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder(
      bloc: bloc,
      builder: (context, state) {
        return Scaffold(
          body: SafeArea(
            child: ListView(
              children: [
                /// Logo
                CustomImage(MyImages.logo, width: 100.w, height: 50.h)
                    .center
                    .withPadding(top: 24.h),

                /// User Info
                Row(
                  children: [
                    CustomImage(
                      Assets.images.test.path,
                      width: 56.r,
                      height: 56.r,
                      borderRadius: BorderRadius.circular(500.r),
                      fit: BoxFit.cover,
                    ).withPadding(end: 8.w),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          CacheHelper.getValue(AppCached.name) ?? "",
                          style: context.boldText.copyWith(
                            fontSize: 16.sp,
                            color: context.primaryColor,
                          ),
                        ).withPadding(bottom: 6.h),
                        Row(
                          children: [
                            Text(
                              LocaleKeys.card_number.tr(),
                              style: context.semiboldText
                                  .copyWith(fontSize: 14.sp),
                            ).withPadding(end: 2.w),
                            Text(
                              CacheHelper.getValue(AppCached.cardNum) ?? "",
                              style: context.semiboldText.copyWith(
                                fontSize: 14.sp,
                                color: context.primaryColor,
                              ),
                            ),
                          ],
                        ),
                        // Row(
                        //   children: [
                        //     Text(
                        //       "Savings Current Month",
                        //       style: context.mediumText
                        //           .copyWith(fontSize: 14.sp),
                        //     ).withPadding(end: 3.w),
                        //     BlocConsumer<HomeBloc, HomeState>(
                        //       bloc: homeBloc,
                        //       listener: (context, state) {},
                        //       builder: (context, state) {
                        //         final savings = homeBloc
                        //             .savingsCurrentMonthModel?.tatalSavings;
                        //         return Text(
                        //           "${savings ?? 0} EG",
                        //           style: context.boldText.copyWith(
                        //             fontSize: 14.sp,
                        //             color: context.primaryColor,
                        //           ),
                        //         );
                        //       },
                        //     ),
                        //   ],
                        // ).withPadding(top: 4.h)
                      ],
                    )
                  ],
                ).withPadding(vertical: 16.h),

                /// Savings Box
                BlocConsumer<HomeBloc, HomeState>(
                  bloc: homeBloc,
                  listener: (context, state) {},
                  builder: (context, state) {
                    final savings =
                        homeBloc.savingsCurrentMonthModel?.tatalSavings ?? 0;
                    return Container(
                      width: double.infinity,
                      height: 140.h,
                      margin: EdgeInsets.only(bottom: 24.h),
                      padding: EdgeInsets.all(24.r),
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [
                            context.secondaryColor,
                            context.secondaryColor.withOpacity(.8),
                            context.primaryColor,
                          ],
                        ),
                        borderRadius: BorderRadius.circular(12.r),
                      ),
                      child: Column(
                        children: [
                          Text(
                            "Savings Current Month",
                            style: context.boldText.copyWith(
                              fontSize: 20.sp,
                              color: context.primaryColorLight,
                            ),
                          ).withPadding(bottom: 8.h),
                          Text(
                            "$savings EG",
                            style: context.boldText.copyWith(
                              fontSize: 28.sp,
                              color: context.primaryColorLight,
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                ),

                /// Slider
                BlocConsumer<HomeBloc, HomeState>(
                  bloc: homeBloc,
                  listener: (context, state) {},
                  builder: (context, state) {
                    final sliderList = homeBloc.sliderModel?.data ?? [];
                    if (sliderList.isEmpty) {
                      return SizedBox(
                        height: 180.h,
                        child: Center(child: Text("No sliders available")),
                      );
                    }
                    return SizedBox(
                      width: double.infinity,
                      height: 180.h,
                      child: Center(
                        child: CarouselSlider(
                          options: CarouselOptions(
                            height: 220.0,
                            autoPlay: true,
                            enlargeCenterPage: true,
                            viewportFraction: 0.9,
                            aspectRatio: 16 / 9,
                            autoPlayInterval: const Duration(seconds: 3),
                          ),
                          items: sliderList
                              .where((item) =>
                          item != null && item.sliderPhoto != null)
                              .map(
                                (item) => ClipRRect(
                              borderRadius: BorderRadius.circular(10),
                              child: Image.network(
                                item!.sliderPhoto!,
                                fit: BoxFit.fill,
                                width: 1000,
                                errorBuilder: (_, __, ___) =>
                                const Icon(Icons.broken_image),
                              ),
                            ),
                          )
                              .toList(),
                        ),
                      ),
                    );
                  },
                ),

                SizedBox(height: 15.h),

                /// Search field
                AppField(
                  hintText: LocaleKeys.search_requests.tr(),
                  prefixIcon: CustomImage(
                    Assets.svg.search,
                    width: 24.r,
                    height: 24.r,
                  ),
                  contentPadding: EdgeInsets.symmetric(
                    horizontal: 24.w,
                    vertical: 8.h,
                  ),
                ),

                /// Categories Header
                Row(
                  children: [
                    Text(
                      LocaleKeys.categories.tr(),
                      style:
                      context.semiboldText.copyWith(fontSize: 16.sp),
                    ),
                    const Spacer(),
                    if (bloc.list.isNotEmpty)
                      GestureDetector(
                        onTap: () {
                          push(
                            NamedRoutes.categories,
                            arg: {"list": bloc.list},
                          );
                        },
                        child: Text(
                          LocaleKeys.see_all.tr(),
                          style: context.regularText.copyWith(
                            fontSize: 16.sp,
                            color: context.primaryColor,
                          ),
                        ),
                      ),
                    if (bloc.list.isNotEmpty)
                      Icon(
                        Icons.arrow_forward_ios,
                        size: 20.r,
                        color: context.primaryColor,
                      )
                  ],
                ),

                /// Categories Grid
                if (state is LoadingCategoriesState)
                  const LoadingApp()
                else if (state is FailedCategoriesState)
                  CustomErrorWidget(title: state.msg)
                else if (bloc.list.isEmpty)
                    const SizedBox(
                        height: 100, child: Center(child: Text("No Categories")))
                  else
                    SizedBox(
                      width: double.infinity,
                      height: 620.h,
                      child: GridView.builder(
                        itemCount: bloc.list.length,
                        padding: EdgeInsets.symmetric(vertical: 24.h),
                        physics: NeverScrollableScrollPhysics(),
                        gridDelegate:
                        SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 3,
                          mainAxisSpacing: 16.w,
                          crossAxisSpacing: 8.w,
                          childAspectRatio: .65,
                        ),
                        itemBuilder: (context, index) {
                          final category = bloc.list[index];
                          if (category == null) {
                            return const SizedBox();
                          }
                          return GestureDetector(
                            onTap: () {
                              push(
                                NamedRoutes.subCategories,
                                arg: {"categoryModel": category},
                              );
                            },
                            child: Container(
                              padding: EdgeInsets.symmetric(
                                horizontal: 16.w,
                                vertical: 8.h,
                              ),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(12.r),
                                border:
                                Border.all(color: context.primaryColor),
                              ),
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                mainAxisAlignment:
                                MainAxisAlignment.spaceBetween,
                                children: [
                                  CustomImage(
                                    category.categoryPhoto ?? "",
                                    borderRadius:
                                    BorderRadius.circular(500.r),
                                    width: 88.r,
                                    height: 88.r,
                                    fit: BoxFit.cover,
                                  ),
                                  Text(
                                    category.categoryName ?? "",
                                    textAlign: TextAlign.center,
                                    maxLines: 3,
                                    overflow: TextOverflow.ellipsis,
                                    style: context.semiboldText
                                        .copyWith(fontSize: 14.sp),
                                  ).withPadding(top: 4.h, bottom: 4.h),
                                ],
                              ),
                            ),
                          );
                        },
                      ),
                    ),
              ],
            ).withPadding(horizontal: 16.w),
          ),
        );
      },
    );
  }
}


/*


      SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  padding: EdgeInsets.symmetric(vertical: 16.h),
                  child: Wrap(
                    spacing: 8.w,
                    children: List.generate(
                      10,
                      (index) => Container(
                        padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 12.h),
                        decoration:
                            BoxDecoration(color: context.hintColor.withOpacity(.3), borderRadius: BorderRadius.circular(4.r)),
                        child: Text("Fashion", style: context.mediumText.copyWith(fontSize: 14.sp)),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: SingleChildScrollView(
                    child: Column(
                      children: List.generate(
                        3,
                        (index) => Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Container(
                                width: double.infinity,
                                alignment: Alignment.center,
                                padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 12.h),
                                decoration: BoxDecoration(
                                    color: context.hintColor.withOpacity(.3), borderRadius: BorderRadius.circular(20.r)),
                                child: Text("Text goes here",
                                    style: context.semiboldText.copyWith(fontSize: 16.sp, color: context.primaryColor))),
                            SingleChildScrollView(
                              padding: EdgeInsets.symmetric(vertical: 16.h),
                              scrollDirection: Axis.horizontal,
                              child: Wrap(
                                spacing: 16.w,
                                children: List.generate(
                                  10,
                                  (index) => Stack(
                                    alignment: AlignmentDirectional.bottomCenter,
                                    children: [
                                      Container(
                                        margin: EdgeInsets.only(bottom: 20.h),
                                        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
                                        decoration: BoxDecoration(
                                            border: Border.all(color: context.borderColor),
                                            borderRadius: BorderRadius.circular(8.r)),
                                        child: Column(
                                          children: [
                                            CustomImage(Assets.images.test.path,
                                                width: 88.r,
                                                height: 88.r,
                                                borderRadius: BorderRadius.circular(500.r),
                                                fit: BoxFit.cover),
                                            Text("Service", style: context.semiboldText.copyWith(fontSize: 16.sp))
                                                .withPadding(top: 4.h, bottom: 4.h),
                                            Row(
                                              children: List.generate(
                                                5,
                                                (index) => Icon(
                                                  Icons.star_rate_rounded,
                                                  size: 18.r,
                                                  opticalSize: 18.r,
                                                  color: index == 4 ? context.borderColor : context.hoverColor,
                                                ),
                                              ),
                                            ).withPadding(bottom: 12.h)
                                          ],
                                        ),
                                      ),
                                      Container(
                                        padding: EdgeInsets.all(8.r),
                                        decoration: BoxDecoration(
                                            gradient:
                                                LinearGradient(begin: Alignment.topCenter, end: Alignment.bottomCenter, colors: [
                                              context.secondaryColor,
                                              context.primaryColor,
                                            ]),
                                            shape: BoxShape.circle),
                                        child: Text(
                                          "123",
                                          style: context.semiboldText.copyWith(fontSize: 14.sp, color: context.primaryColorLight),
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                )
 */

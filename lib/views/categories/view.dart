import 'package:e_commerce/core/routes/app_routes_fun.dart';
import 'package:e_commerce/core/utils/extensions.dart';
import 'package:e_commerce/core/widgets/app_bar.dart';
import 'package:e_commerce/gen/locale_keys.g.dart';
import 'package:e_commerce/models/category.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../core/routes/routes.dart';
import '../../core/widgets/custom_image.dart';

class CategoriesView extends StatelessWidget {
  const CategoriesView({super.key, required this.list});

  final List<CategoryModel> list;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: LocaleKeys.categories.tr()),
      body: GridView.builder(
          padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
          itemCount: list.length,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3, mainAxisSpacing: 16.r, crossAxisSpacing: 16.r, childAspectRatio: .8),
          itemBuilder: (context, index) => GestureDetector(
                onTap: () {
                  push(NamedRoutes.subCategories, arg: {"categoryModel": list[index]});
                },
                child:  Container(
                  padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 16.h),
                  alignment: Alignment.center,
                  decoration:
                  BoxDecoration(color: context.hintColor.withOpacity(.3), borderRadius: BorderRadius.circular(4.r)),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    spacing: 8.h,
                    children: [
                      CustomImage(
                        list[index].categoryPhoto,
                        width: 32.r,
                        height: 32.r,
                        borderRadius: BorderRadius.circular(500.r),
                      ).withPadding(end: 8.w),
                      Text( list[index].categoryName ?? "",
                          textAlign: TextAlign.center,

                          style: context.mediumText.copyWith(fontSize: 14.sp)),
                    ],
                  ),
                ),
              )),
    );
  }
}

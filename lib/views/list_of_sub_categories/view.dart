import 'package:e_commerce/core/routes/app_routes_fun.dart';
import 'package:e_commerce/core/routes/routes.dart';
import 'package:e_commerce/core/utils/extensions.dart';
import 'package:e_commerce/core/widgets/app_bar.dart';
import 'package:e_commerce/gen/locale_keys.g.dart';
import 'package:e_commerce/models/sub_category.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../core/widgets/custom_image.dart';

class ListOfSubCategoriesView extends StatelessWidget {
  const ListOfSubCategoriesView({super.key, required this.list});

  final List<SubCategoryModel> list;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:  CustomAppBar(title:LocaleKeys.subCategory.tr()),
      body: GridView.builder(
          padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
          itemCount: list.length,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3, mainAxisSpacing: 16.r, crossAxisSpacing: 16.r, childAspectRatio: .7),
          itemBuilder: (context, index) => GestureDetector(
                onTap: () {
                  push(NamedRoutes.subSub,arg: {
                    "id":list[index].subCategoryId  ,
                    "title": list[index].subCategoryName
                  });
                },
                child:  Container(
                  padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
                  alignment: Alignment.center,
                  decoration:
                  BoxDecoration(color: context.hintColor.withOpacity(.3), borderRadius: BorderRadius.circular(4.r)),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    spacing: 8.h,
                    children: [
                      CustomImage(
                        list[index].subCategoryPhoto,
                        width: 32.r,
                        height: 32.r,
                        borderRadius: BorderRadius.circular(500.r),
                      ).withPadding(end: 8.w),
                      Text( list[index].subCategoryName ?? "",
                          textAlign: TextAlign.center,maxLines: 4,
                          style: context.mediumText.copyWith(fontSize: 14.sp)),
                    ],
                  ),
                ),
              )),
    );
  }
}

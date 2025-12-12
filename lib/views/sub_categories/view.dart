import 'package:e_commerce/core/utils/extensions.dart';
import 'package:e_commerce/core/widgets/app_bar.dart';
import 'package:e_commerce/core/widgets/custom_image.dart';
import 'package:e_commerce/models/category.dart';
import 'package:e_commerce/views/nav_bar/new_service/widgets/service_item.dart';
import 'package:e_commerce/views/sub_categories/controller/event.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../core/routes/app_routes_fun.dart';
import '../../core/routes/routes.dart';
import '../../core/services/service_locator.dart';
import '../../core/widgets/error_widget.dart';
import '../../core/widgets/loading.dart';
import '../../gen/locale_keys.g.dart';
import 'controller/bloc.dart';
import 'controller/state.dart';

class SubCategoriesView extends StatefulWidget {
  const SubCategoriesView({super.key, required this.categoryModel});

  final CategoryModel categoryModel;

  @override
  State<SubCategoriesView> createState() => _SubCategoriesViewState();
}

class _SubCategoriesViewState extends State<SubCategoriesView> {
  final bloc = sl<SubCategoriesBloc>();

  @override
  void initState() {
    super.initState();
    bloc.add(StartSubCategoriesEvent(id: widget.categoryModel.brandsCategoryId ?? ""));
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder(
      bloc: bloc,
      builder: (context, state) {
        return Scaffold(
            appBar: CustomAppBar(title: widget.categoryModel.categoryName ?? "Category"),
            body: state is LoadingSubCategoriesState
                ? const LoadingApp()
                : state is FailedSubCategoriesState
                    ? CustomErrorWidget(title: state.msg)
                    : Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Expanded(
                                child: Text("${"Sub Categories of".tr()} ${widget.categoryModel.categoryName}",
                                    style: context.boldText.copyWith(fontSize: 18.sp)),
                              ),
                              if (bloc.subCategoryList.isNotEmpty)
                                GestureDetector(
                                  onTap: () {
                                    push(NamedRoutes.listOfSubCategoriesView, arg: {"list": bloc.subCategoryList});
                                  },
                                  child: Text(LocaleKeys.see_all.tr(),
                                      style: context.regularText.copyWith(fontSize: 16.sp, color: context.primaryColor)),
                                ),
                              if (bloc.subCategoryList.isNotEmpty)
                                Icon(
                                  Icons.arrow_forward_ios,
                                  size: 20.r,
                                  color: context.primaryColor,
                                )
                            ],
                          ).withPadding(horizontal: 16.w, bottom: 8.h, top: 12.h),
                          SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            padding: EdgeInsets.symmetric(vertical: 16.h, horizontal: 16.w),
                            child: Wrap(
                              alignment: WrapAlignment.start,
                              spacing: 8.w,
                              children: List.generate(
                                bloc.subCategoryList.length,
                                (index) => GestureDetector(
                                  onTap: () {
                                    if (bloc.subCategoryList[index].subCategoryId != null) {
                                      bloc.add(StartSubCategoriesBrandEvent(id: bloc.subCategoryList[index].subCategoryId!));
                                    }
                                  },
                                  child: Container(
                                    padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 16.h),
                                    decoration:
                                        BoxDecoration(color: context.hintColor.withOpacity(.3), borderRadius: BorderRadius.circular(4.r)),
                                    child: Column(
                                      mainAxisSize: MainAxisSize.min,
                                      spacing: 8.h,
                                      children: [
                                        CustomImage(
                                          bloc.subCategoryList[index].subCategoryPhoto,
                                          width: 32.r,
                                          height: 32.r,
                                          borderRadius: BorderRadius.circular(500.r),
                                        ).withPadding(end: 8.w),
                                        Text(bloc.subCategoryList[index].subCategoryName ?? "",
                                            style: context.mediumText.copyWith(fontSize: 14.sp)),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          if (bloc.subBrandList.isNotEmpty)
                            Text(LocaleKeys.subCategoryBrand.tr(), style: context.boldText.copyWith(fontSize: 18.sp))
                                .withPadding(horizontal: 16.w, bottom: 8.h, top: 12.h),
                          state is LoadingSubCategoriesBrandState
                              ? const Expanded(child: LoadingApp())
                              : state is FailedSubCategoriesBrandState
                                  ? Expanded(child: CustomErrorWidget(title: state.msg))
                                  : Expanded(
                                      child: ListView.builder(
                                        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
                                        itemCount: bloc.subBrandList.length,
                                        itemBuilder: (context, index) => GestureDetector(
                                          onTap: () {
                                            push(NamedRoutes.brandDetails,
                                                arg: {"id": bloc.subBrandList[index].brandId, "brandModel": bloc.subBrandList[index]});
                                          },
                                          child: ServiceItem(model: bloc.subBrandList[index],withHeart:bloc.subBrandList[index].is_favorite=="1" ,),
                                        ),
                                      ),
                                    ),
                        ],
                      ));
      },
    );
  }
}

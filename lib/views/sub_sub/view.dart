import 'package:e_commerce/core/routes/app_routes_fun.dart';
import 'package:e_commerce/core/utils/extensions.dart';
import 'package:e_commerce/core/widgets/app_bar.dart';
import 'package:e_commerce/core/widgets/custom_image.dart';
import 'package:e_commerce/views/sub_sub/controller/bloc.dart';
import 'package:e_commerce/views/sub_sub/controller/event.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../core/routes/routes.dart';
import '../../core/services/service_locator.dart';
import '../../core/widgets/error_widget.dart';
import '../../core/widgets/loading.dart';
import '../nav_bar/new_service/widgets/service_item.dart';
import 'controller/state.dart';

class SubSubView extends StatefulWidget {
  const SubSubView({super.key, required this.id, required this.title});

  final String id, title;

  @override
  State<SubSubView> createState() => _SubSubViewState();
}

class _SubSubViewState extends State<SubSubView> {
  late final bloc = sl<SubSubCategoriesBloc>()..add(StartSubSubCategoriesEvent(id: widget.id));

  @override
  Widget build(BuildContext context) {
    return BlocBuilder(
      bloc: bloc,
      builder: (context, state) {
        return Scaffold(
            appBar: CustomAppBar(title: widget.title),
            body: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                state is LoadingSubSubCategoriesState
                    ? const Expanded(child: LoadingApp())
                    : state is FailedSubSubCategoriesState
                        ? Expanded(child: CustomErrorWidget(title: state.msg))
                        : SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            padding: EdgeInsets.symmetric(vertical: 16.h, horizontal: 16.w),
                            child: Wrap(
                              alignment: WrapAlignment.start,
                              spacing: 8.w,
                              children: List.generate(
                                bloc.subSubCategoryList.length,
                                (index) => GestureDetector(
                                  onTap: () {
                                    bloc.add(
                                        StartSubSubCategoriesBrandEvent(id: bloc.subSubCategoryList[index].subCategoryId ?? ""));
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
                                          bloc.subSubCategoryList[index].categoryPhoto,
                                          width: 32.r,
                                          height: 32.r,
                                          borderRadius: BorderRadius.circular(500.r),
                                        ).withPadding(end: 8.w),
                                        Text(bloc.subSubCategoryList[index].subSubCategoryName ?? "",
                                            style: context.mediumText.copyWith(fontSize: 14.sp)),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                state is LoadingSubSubCategoriesBrandState
                    ? const Expanded(child: LoadingApp())
                    : state is FailedSubSubCategoriesBrandState
                        ? Expanded(child: CustomErrorWidget(title: state.msg))
                        : Expanded(
                            child: ListView.builder(
                              padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
                              itemCount: bloc.subSubBrandList.length,
                                itemBuilder: (context, index) => GestureDetector(
                                onTap: () {
                                  push(NamedRoutes.brandDetails,
                                      arg: {"id": bloc.subSubBrandList[index].brandId, "brandModel": bloc.subSubBrandList[index]});
                                },
                                child:ServiceItem(model: bloc.subSubBrandList[index]),
                              ),
                            ),
                          ),
              ],
            ));
      },
    );
  }
}

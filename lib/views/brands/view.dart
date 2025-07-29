import 'package:e_commerce/core/routes/routes.dart';
import 'package:e_commerce/core/utils/extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../core/routes/app_routes_fun.dart';
import '../../core/widgets/app_bar.dart';
import '../../core/widgets/custom_image.dart';
import '../../gen/assets.gen.dart';

class BrandsView extends StatelessWidget {
  const BrandsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: const CustomAppBar(title: "Brands"),
        body: GridView.builder(
          padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
          itemCount: 25,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
              mainAxisSpacing: 0.r,
              crossAxisSpacing: 16.r,
              childAspectRatio: .85),
          itemBuilder: (context, index) => GestureDetector(
            onTap: () {
              push(NamedRoutes.subSub);
            },
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                CustomImage(
                  Assets.images.test.path,
                  width: 88.r,
                  height: 88.r,
                  fit: BoxFit.cover,
                  border: Border.all(color: context.borderColor),
                  borderRadius: BorderRadius.circular(500.r),
                ),
                Text("Boss", style: context.mediumText.copyWith(fontSize: 14.sp))
                    .withPadding(top: 6.h)
              ],
            ),
          ),
        ));
  }
}

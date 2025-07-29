import 'package:e_commerce/core/utils/extensions.dart';
import 'package:e_commerce/core/widgets/app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class StaticPagesView extends StatelessWidget {
  const StaticPagesView({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: title,
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 24.h),
        child: Text(
          "It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using ‘Content here, content here’, making it look like readable English. Many ",
          style: context.regularText.copyWith(fontSize: 14.sp, color: context.primaryColorDark.withOpacity(.5)),
        ),
      ),
    );
  }
}

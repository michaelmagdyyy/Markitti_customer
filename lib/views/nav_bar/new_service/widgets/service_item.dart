import 'package:e_commerce/core/utils/extensions.dart';
import 'package:e_commerce/core/widgets/custom_image.dart';
import 'package:e_commerce/gen/locale_keys.g.dart';
import 'package:e_commerce/models/sub_category_brand.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../blocs/favoritebloc/favorite_bloc.dart';
import '../../../../core/services/service_locator.dart';


class ServiceItem extends StatefulWidget {
  final bool? withHeart;
  const ServiceItem({super.key, required this.model,this.withHeart});
  final SubBrandModel model;
  @override
  State<ServiceItem> createState() => _ServiceItemState();
}

class _ServiceItemState extends State<ServiceItem> {
  late final bloc = sl<FavoriteBloc>();
  bool isFavorite=false;
  @override
  void initState() {
    isFavorite=widget.withHeart??false;
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Container(
        margin: EdgeInsets.only(bottom: 16.h),
        height: 220.h,
        decoration:
            BoxDecoration(border: Border.all(color: context.borderColor, width: 2.r), borderRadius: BorderRadius.circular(8.r)),
        child: Stack(
          children: [
            CustomImage(
              widget.model.bannerImage ?? "",
              height: 220.h,
              width: double.infinity,
              borderRadius: BorderRadius.circular(8.r),
              fit: BoxFit.cover,
            ),
            Container(
              alignment: Alignment.bottomCenter,
              decoration: BoxDecoration(
                gradient: LinearGradient(begin: Alignment.topCenter, end: Alignment.bottomCenter, colors: [
                  Colors.transparent,
                  Colors.transparent,
                  Colors.transparent,
                  context.primaryColorLight.withOpacity(.45),
                  context.primaryColorLight,
                ]),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(LocaleKeys.your_balance.tr(), style: context.boldText.copyWith(fontSize: 12.sp)),
                      Text("${widget.model.customerBrandPurchasesLimit??0} L.E", style: context.boldText.copyWith(fontSize: 20.sp, color: context.primaryColor)),
                    ],
                  ),
                  Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(widget.model.brandName ?? "", style: context.boldText.copyWith(fontSize: 20.sp)),
                      Row(
                        children: List.generate(
                          5,
                          (indexx) => Icon(Icons.star_rate_rounded,
                              size: 18.r, opticalSize: 18.r,
                              color: indexx > (int.parse("${widget.model.averageRating??0}")-1) ? context.borderColor : context.hoverColor),
                        ),
                      )
                    ],
                  ),
                  Container(
                    width: 64.r,
                    height: 64.r,
                    alignment: Alignment.center,
                    padding: EdgeInsets.all(8.r),
                    decoration: BoxDecoration(
                        gradient: LinearGradient(begin: Alignment.topCenter, end: Alignment.bottomCenter, colors: [
                          context.secondaryColor,
                          context.primaryColor,
                        ]),
                        shape: BoxShape.circle),
                    child: FittedBox(
                      child: Text(
                        "${widget.model.customerBrandDiscountPercentage}%",
                        style: context.boldText.copyWith(fontSize: 18.sp, color: context.primaryColorLight),
                      ),
                    ),
                  )
                ],
              ).withPadding(horizontal: 16.w, vertical: 8.h),
            ),
            Container(
              alignment: Alignment.topLeft,
              child: IconButton(onPressed: (){
                isFavorite!=true?
                    bloc.add(AddToFavoriteEvent(brandId: widget.model.brandId!))
                    : bloc.add(RemoveFromFavoriteEvent(brandId: widget.model.brandId!));

                isFavorite=!isFavorite;
                setState(() {});

                }, icon: Icon(Icons.favorite,color: isFavorite!=true?context.borderColor : context.hoverColor,)),
            )
          ],
        ),
      ),
    );
  }
}

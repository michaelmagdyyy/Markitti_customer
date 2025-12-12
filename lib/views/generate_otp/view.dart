import 'package:e_commerce/core/services/my_functions.dart';
import 'package:e_commerce/core/utils/extensions.dart';
import 'package:e_commerce/core/widgets/app_bar.dart';
import 'package:e_commerce/core/widgets/app_btn.dart';
import 'package:e_commerce/gen/locale_keys.g.dart';
import 'package:e_commerce/views/generate_otp/controller/event.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:qr_flutter/qr_flutter.dart';

import '../../core/services/service_locator.dart';
import '../../core/widgets/custom_image.dart';
import '../../core/widgets/error_widget.dart';
import '../../core/widgets/loading.dart';
import '../../models/sub_category_brand.dart';
import 'controller/bloc.dart';
import 'controller/state.dart';

class GenerateOTPView extends StatefulWidget {
  const GenerateOTPView({super.key, required this.model});

  final SubBrandModel model;

  @override
  State<GenerateOTPView> createState() => _GenerateOTPViewState();
}

class _GenerateOTPViewState extends State<GenerateOTPView> {
  late final bloc = sl<CodeBloc>()..add(GetCodeEvent(id: widget.model.brandId ?? "0"));

  @override
  Widget build(BuildContext context) {
    return BlocConsumer(
      bloc: bloc,
      listener: (context, state) {
        if (state is DoneSocketQrState) {
          showModalBottomSheet(
              context: context,
              builder: (context) => Container(
                    padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 10.h),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(topLeft: Radius.circular(16.r), topRight: Radius.circular(16.r))),
                    child: SafeArea(
                      child: Column(crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(LocaleKeys.brand_details.tr(), style: context.semiboldText.copyWith(fontSize: 16.sp)),
                          Text("${bloc.infoModel?.brandName}", style: context.boldText.copyWith(fontSize: 16.sp, color: context.primaryColor)).withPadding(top: 8.h,),
                          Text(LocaleKeys.branchCity.tr(), style: context.semiboldText.copyWith(fontSize: 16.sp)),
                          Text("${bloc.infoModel?.branchName}", style: context.boldText.copyWith(fontSize: 16.sp, color: context.primaryColor)).withPadding(top: 8.h,),
                          Text("${LocaleKeys.invoiceAmount.tr()}", style: context.semiboldText.copyWith(fontSize: 16.sp)),
                          Text("${bloc.infoModel?.invoiceAmount} L.E", style: context.boldText.copyWith(fontSize: 16.sp, color: context.primaryColor)).withPadding(top: 8.h,),
                          Text("${LocaleKeys.discountPercentage.tr()}", style: context.semiboldText.copyWith(fontSize: 16.sp)),
                          Text("${bloc.infoModel?.discountPercentage} %", style: context.boldText.copyWith(fontSize: 16.sp, color: context.primaryColor)).withPadding(top: 8.h, bottom: 16.h),
                          Text("${LocaleKeys.amountToBePaid.tr()}", style: context.semiboldText.copyWith(fontSize: 16.sp)),
                          Text("${bloc.infoModel?.amountToBePaid} L.E", style: context.boldText.copyWith(fontSize: 16.sp, color: context.primaryColor)).withPadding(top: 8.h,),
                          Text(LocaleKeys.transactionDateTime.tr(), style: context.semiboldText.copyWith(fontSize: 16.sp)),
                          Text("${bloc.infoModel?.transactionDateTime}", style: context.boldText.copyWith(fontSize: 16.sp, color: context.primaryColor)).withPadding(top: 8.h,),
                          Row(
                            children: [
                              Expanded(
                                child: AppBtn(
                                    title: LocaleKeys.confirm.tr(),
                                    loading: state is LoadingSocketQrState,
                                    onPressed: () {
                                      bloc.add(AcceptOrCancelEvent(qrCode: bloc.model?.qrCode ?? "0", type: "approve"));
                                      Navigator.pop(context);
                                    }),
                              ),
                              SizedBox(
                                width: 16.w,
                              ),
                              Expanded(
                                child: AppBtn(
                                    title: LocaleKeys.cancel.tr(),
                                    loading: state is LoadingSocketQrState,
                                    onPressed: () {
                                      bloc.add(AcceptOrCancelEvent(qrCode: bloc.model?.qrCode ?? "0", type: "reject"));
                                      Navigator.pop(context);
                                    }),
                              )
                            ],
                          )
                        ],
                      ),
                    ),
                  ));
        }
      },
      builder: (context, state) {
        return Scaffold(
          appBar: CustomAppBar(title: LocaleKeys.generate_otp),
          body: state is LoadingCodeState
              ? const LoadingApp()
              : state is FailedCodeState
                  ? CustomErrorWidget(title: state.msg)
                  : SingleChildScrollView(
                      child: Column(children: [
                        CustomImage(widget.model.brandLogo,
                                fit: BoxFit.cover,
                                width: 120.r,
                                height: 120.r,
                                border: Border.all(color: context.focusColor),
                                borderRadius: BorderRadius.circular(500.r))
                            .center,
                        Text(widget.model.brandName ?? "", style: context.boldText.copyWith(fontSize: 20.sp)),
                        Divider(height: 48.h, color: context.hintColor.withOpacity(.3), thickness: 12.h),
                        Text("  ${LocaleKeys.monthlyPurchaseLimit.tr()}", style: context.semiboldText.copyWith(fontSize: 18.sp)),
                        Text("${bloc.model?.availableMonthlyPurchaseLimit} L.E",
                                style: context.boldText.copyWith(fontSize: 18.sp, color: context.primaryColor))
                            .withPadding(
                          top: 8.h,
                        ),
                        Text("  ${LocaleKeys.dailyPurchaseLimit.tr()}", style: context.semiboldText.copyWith(fontSize: 18.sp)),
                        Text("${bloc.model?.availableDailyPurchaseLimit} L.E",
                                style: context.boldText.copyWith(fontSize: 18.sp, color: context.primaryColor))
                            .withPadding(top: 8.h, bottom: 16.h),
                        Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: [
                              QrImageView(
                                data: bloc.model?.qrCode ?? "0",
                                version: QrVersions.auto,
                                eyeStyle:QrEyeStyle(
                                  eyeShape: QrEyeShape.square,
                                  color: MyFunctions.isDark(context)?Colors.white: Colors.black,
                                ),
                                dataModuleStyle:QrDataModuleStyle(
                                  dataModuleShape: QrDataModuleShape.square,
                                  color: MyFunctions.isDark(context)?Colors.white: Colors.black,
                                ),
                                size: 200.0,
                              ).center,
                              const SizedBox(height: 20),
                              AppBtn(
                                  title: LocaleKeys.showInfo.tr(),
                                  loading: state is LoadingSocketQrState,
                                  onPressed: () {
                                    bloc.add(SocketQrEvent(qrCode: bloc.model?.qrCode ?? "0"));
                                  }),
                              const SizedBox(height: 20),
                            ],
                          ),
                        ),
                      ]),
                    ),
        );
      },
    );
  }
}

import 'package:e_commerce/core/utils/extensions.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../core/services/service_locator.dart';
import '../../core/widgets/app_bar.dart';
import '../../core/widgets/empty_list.dart';
import '../../gen/locale_keys.g.dart';
import '../../models/UsageHistoryModel.dart';
import 'UsageHistoryBloc/usage_history_bloc.dart';

class UsageHistoryScreen extends StatefulWidget {
  const UsageHistoryScreen({super.key});

  @override
  State<UsageHistoryScreen> createState() => _UsageHistoryScreenState();
}

class _UsageHistoryScreenState extends State<UsageHistoryScreen> {
  late final bloc = sl<UsageHistoryBloc>();
  List<UsageHistoryData>? listUsageHistory=[];
  @override
  void initState() {
    bloc.add(GetUsageHistoryEvent());
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: "Usage History",),
      body: BlocConsumer<UsageHistoryBloc, UsageHistoryState>(
        bloc: bloc,
        listener: (context, state) {
          if (state is UsageHistoryLoaded) {
            listUsageHistory = state.model.data?? [];
            setState(() {});
          }
        },
        builder: (context, state) {
          if (listUsageHistory!.isEmpty) return const EmptyList();
          return ListView.builder(
            padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
            itemCount: listUsageHistory?.length??0,
            itemBuilder: (context, index) => Card(
              margin: EdgeInsets.symmetric(horizontal: 12, vertical: 6),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(children: [
                  Expanded(
                    child: Column(crossAxisAlignment:CrossAxisAlignment.start,children: [
                      Center(child: Image.network(listUsageHistory?[index].brandLogo, width: 100, height: 100)),
                      SizedBox(height: 10,),
                      Text(LocaleKeys.brand_details.tr(), style: context.semiboldText.copyWith(fontSize: 16.sp)),
                      Text("${listUsageHistory?[index].brandName}", style: context.boldText.copyWith(fontSize: 16.sp, color: context.primaryColor)).withPadding(top: 8.h,),
                      Text(LocaleKeys.branchCity.tr(), style: context.semiboldText.copyWith(fontSize: 16.sp)),
                      Text("${listUsageHistory?[index].branchName}", style: context.boldText.copyWith(fontSize: 16.sp, color: context.primaryColor)).withPadding(top: 8.h,),
                      Text("${LocaleKeys.invoiceAmount.tr()}", style: context.semiboldText.copyWith(fontSize: 16.sp)),
                      Text("${listUsageHistory?[index].transactionValue} L.E", style: context.boldText.copyWith(fontSize: 16.sp, color: context.primaryColor)).withPadding(top: 8.h,),
                      Text("${LocaleKeys.discountPercentage.tr()}", style: context.semiboldText.copyWith(fontSize: 16.sp)),
                      Text("${listUsageHistory?[index].discountPercentage} %", style: context.boldText.copyWith(fontSize: 16.sp, color: context.primaryColor)).withPadding(top: 8.h, bottom: 16.h),
                      Text("${LocaleKeys.amountToBePaid.tr()}", style: context.semiboldText.copyWith(fontSize: 16.sp)),
                      Text("${listUsageHistory?[index].amountToBePaid} L.E", style: context.boldText.copyWith(fontSize: 16.sp, color: context.primaryColor)).withPadding(top: 8.h,),
                      Text(LocaleKeys.transactionDateTime.tr(), style: context.semiboldText.copyWith(fontSize: 16.sp)),
                      Text("${listUsageHistory?[index].transactionDate}", style: context.boldText.copyWith(fontSize: 16.sp, color: context.primaryColor)).withPadding(top: 8.h,),

                    ],),
                  )
                ],),
              )
            ),
          );
        },
      ),
    );
  }
}

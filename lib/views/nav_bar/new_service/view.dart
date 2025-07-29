import 'package:e_commerce/core/utils/extensions.dart';
import 'package:e_commerce/views/nav_bar/new_service/controller/bloc.dart';
import 'package:e_commerce/views/nav_bar/new_service/controller/event.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/services/service_locator.dart';
import '../../../core/widgets/error_widget.dart';
import '../../../core/widgets/loading.dart';
import '../../../gen/locale_keys.g.dart';
import 'controller/state.dart';

class NewServiceView extends StatefulWidget {
  const NewServiceView({super.key});

  @override
  State<NewServiceView> createState() => _NewServiceViewState();
}

class _NewServiceViewState extends State<NewServiceView> {
  final bloc = sl<NewServicesBloc>()..add(StartNewServicesEvent());

  @override
  Widget build(BuildContext context) {
    return BlocBuilder(
      bloc: bloc,
      builder: (context, state) {
        return Scaffold(
          body: SafeArea(
            child: Column(
              children: [
                Text(LocaleKeys.new_services_added.tr(), style: context.semiboldText.copyWith(fontSize: 20.sp))
                    .withPadding(vertical: 24.h),
                state is LoadingNewServicesState
                    ? const Expanded(child: LoadingApp())
                    : state is FailedNewServicesState
                        ? Expanded(child: CustomErrorWidget(title: state.msg))
                        : Expanded(
                            child: ListView.builder(
                                padding: EdgeInsets.symmetric(horizontal: 16.w),
                                itemCount: bloc.list.length,
                                itemBuilder: (context, index) => const SizedBox()))
              ],
            ),
          ),
        );
      },
    );
  }
}

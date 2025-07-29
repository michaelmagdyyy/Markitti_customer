import 'package:e_commerce/core/routes/app_routes_fun.dart';
import 'package:e_commerce/core/routes/routes.dart';
import 'package:e_commerce/core/utils/extensions.dart';
import 'package:e_commerce/core/widgets/app_btn.dart';
import 'package:e_commerce/core/widgets/app_field.dart';
import 'package:e_commerce/core/widgets/auth_scaffold.dart';
import 'package:e_commerce/gen/locale_keys.g.dart';
import 'package:e_commerce/views/auth/login/controller/state.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/services/service_locator.dart';
import 'controller/bloc.dart';
import 'controller/event.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  final bloc = sl<LoginBloc>();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder(
      bloc: bloc,
      builder: (context, state) {
        return Form(
          key: bloc.formKey,
          autovalidateMode: bloc.autoValidateMode,
          child: AuthScaffold(
              title: LocaleKeys.sign_in_button.tr(),
              desc: LocaleKeys.sign_in_message.tr(),
              widget: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  AppField(
                    title: LocaleKeys.mobile.tr(),
                    keyboardType: TextInputType.phone,
                    controller: bloc.phone,
                  ),
                  AppField(
                    title: LocaleKeys.password.tr(),
                    hintText: "***********",
                    keyboardType: TextInputType.visiblePassword,
                    controller: bloc.password,
                  ),
                  GestureDetector(
                    onTap: () {
                      push(NamedRoutes.forgetPassword);
                    },
                    child: Text(LocaleKeys.forgot_password.tr(),
                            style: context.semiboldText.copyWith(fontSize: 16.sp, color: context.primaryColor))
                        .withPadding(bottom: 24.h),
                  ),
                  AppBtn(
                      title: LocaleKeys.sign_in.tr(),
                      loading: state is LoadingLoginState,
                      onPressed: () {
                        if (bloc.formKey.currentState!.validate()) {
                          bloc.add(StartLoginEvent());
                        } else {
                          bloc.autoValidateMode = AutovalidateMode.onUserInteraction;
                          setState(() {});
                        }
                        // push(NamedRoutes.navBar);
                      }),
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(LocaleKeys.create_new_account.tr(), style: context.mediumText.copyWith(fontSize: 16.sp)).withPadding(end: 4.w),
                      GestureDetector(
                        onTap: () {
                          replacement(NamedRoutes.register);
                        },
                        child: Text(LocaleKeys.register_button.tr(),
                            style: context.boldText.copyWith(fontSize: 16.sp, color: context.primaryColor)),
                      ),
                    ],
                  ).center.withPadding(vertical: 24.h)
                ],
              )),
        );
      },
    );
  }
}

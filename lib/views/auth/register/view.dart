import 'package:e_commerce/blocs/cities/bloc.dart';
import 'package:e_commerce/blocs/cities/event.dart';
import 'package:e_commerce/blocs/cities/state.dart';
import 'package:e_commerce/blocs/countries/bloc.dart';
import 'package:e_commerce/blocs/countries/events.dart';
import 'package:e_commerce/blocs/countries/states.dart';
import 'package:e_commerce/core/utils/extensions.dart';
import 'package:e_commerce/core/widgets/app_sheet.dart';
import 'package:e_commerce/core/widgets/auth_scaffold.dart';
import 'package:e_commerce/core/widgets/date_picker.dart';
import 'package:e_commerce/core/widgets/loading.dart';
import 'package:e_commerce/gen/locale_keys.g.dart';
import 'package:e_commerce/views/auth/register/controller/register_bloc.dart';
import 'package:easy_localization/easy_localization.dart' as t;
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/routes/app_routes_fun.dart';
import '../../../core/routes/routes.dart';
import '../../../core/services/service_locator.dart';
import '../../../core/widgets/app_btn.dart';
import '../../../core/widgets/app_field.dart';

class RegisterView extends StatefulWidget {
  const RegisterView({super.key});

  @override
  State<RegisterView> createState() => _RegisterViewState();
}

class _RegisterViewState extends State<RegisterView> {
  final registerBloc = sl<RegisterBloc>();
  final countryBloc = sl<CountriesBloc>();
  final cityBloc = sl<CitiesBloc>();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder(
      bloc: registerBloc,
      builder: (context, registerState) {
        return BlocConsumer(
          bloc: countryBloc,
          listener: (context, countryState) {
            if (countryState is CountrySuccessState) {
              showModalBottomSheet(
                  context: context,
                  builder: (context) => CustomAppSheet(
                        title: LocaleKeys.selectProvinces.tr(),
                        children: List.generate(
                          countryBloc.countries.length,
                          (index) => InkWell(
                            onTap: () {
                              countryBloc.add(SelectCountryEvent(model: countryBloc.countries[index]));
                              registerBloc.countryModel = countryBloc.countries[index];
                              Navigator.pop(context);
                            },
                            splashColor: Colors.transparent,
                            hoverColor: Colors.transparent,
                            highlightColor: Colors.transparent,
                            child: Container(
                              width: double.infinity,
                              margin: EdgeInsets.symmetric(vertical: 8.h),
                              padding: EdgeInsets.all(12.r),
                              decoration:
                                  BoxDecoration(border: Border.all(color: context.hintColor), borderRadius: BorderRadius.circular(12.r)),
                              child: Text(countryBloc.countries[index].provinceNameEn ?? "empty name"),
                            ),
                          ),
                        ),
                      ));
            }
          },
          builder: (context, countryState) {
            return BlocConsumer(
              bloc: cityBloc,
              listener: (context, cityState) {
                if (cityState is CitiesSuccessState) {
                  showModalBottomSheet(
                      context: context,
                      builder: (context) => CustomAppSheet(
                            title: LocaleKeys.selectArea.tr(),
                            children: List.generate(
                              cityBloc.list.length,
                              (index) => InkWell(
                                onTap: () {
                                  cityBloc.add(SelectCityEvent(model: cityBloc.list[index]));
                                  registerBloc.cityModel = cityBloc.list[index];
                                  Navigator.pop(context);
                                },
                                splashColor: Colors.transparent,
                                hoverColor: Colors.transparent,
                                highlightColor: Colors.transparent,
                                child: Container(
                                  width: double.infinity,
                                  margin: EdgeInsets.symmetric(vertical: 8.h),
                                  padding: EdgeInsets.all(12.r),
                                  decoration: BoxDecoration(
                                      border: Border.all(color: context.hintColor), borderRadius: BorderRadius.circular(12.r)),
                                  child: Text(cityBloc.list[index].areaNameEn ?? "empty name"),
                                ),
                              ),
                            ),
                          ));
                }
              },
              builder: (context, cityState) {
                return AuthScaffold(
                    title: LocaleKeys.register_button.tr(),
                    desc: LocaleKeys.create_account_message.tr(),
                    widget: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        AppField(
                          title: LocaleKeys.firstName.tr(),
                          controller: registerBloc.firstName,
                        ),
                        AppField(
                          title: LocaleKeys.lastName.tr(),
                          controller: registerBloc.lastName,
                        ),
                        AppField(
                          title: LocaleKeys.mobile.tr(),
                          controller: registerBloc.phoneController,
                        ),
                        AppField(
                          title: LocaleKeys.job.tr(),
                          controller: registerBloc.jobController,
                        ),
                        AppField(
                          title: LocaleKeys.age.tr(),
                          controller: registerBloc.ageController,
                          onTap: () {
                            showModalBottomSheet(
                                context: context,
                                shape: const RoundedRectangleBorder(
                                  borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
                                ),
                                builder: (context) => Container(
                                      color: Colors.white,
                                      width: double.infinity,
                                      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        spacing: 16.h,
                                        mainAxisSize: MainAxisSize.min,
                                        children: List.generate(
                                          registerBloc.ageRanges.length,
                                          (index) => InkWell(
                                            onTap: () {
                                              registerBloc.ageController.text = registerBloc.ageRanges[index];
                                              setState(() {});
                                              Navigator.pop(context);
                                            },
                                            child: Container(
                                              width: double.infinity,
                                              padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
                                              decoration: BoxDecoration(
                                                  border: Border.all(color: context.primaryColor),
                                                  borderRadius: BorderRadius.circular(16.r)),
                                              child: Text(
                                                registerBloc.ageRanges[index],
                                                textDirection: TextDirection.ltr,
                                                style: context.mediumText,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ));
                          },
                        ),
                        AppField(
                          title: LocaleKeys.numberOfChildren.tr(),
                          controller: registerBloc.numberChildrenController,
                        ),
                        AppField(
                          title: LocaleKeys.hobbies.tr(),
                          controller: registerBloc.hobbiesController,
                        ),
                        AppField(
                          title: LocaleKeys.maritalStatus.tr(),
                          controller: registerBloc.maritalStatusController,
                        ),
                        AppField(
                            title: LocaleKeys.province.tr(),
                            controller: TextEditingController(text: countryBloc.model?.provinceNameEn),
                            suffixIcon: countryState is CountryLoadingState ? const SizedBox(width: 32, child: LoadingApp()) : null,
                            onTap: () {
                              cityBloc.list.clear();
                              cityBloc.model = null;
                              countryBloc.add(StartCountriesEvent());
                            }),
                        if (cityBloc.list.isNotEmpty || countryBloc.model?.provincesId != null)
                          AppField(
                              title: LocaleKeys.area.tr(),
                              controller: TextEditingController(text: cityBloc.model?.areaNameEn),
                              suffixIcon: cityState is CitiesLoadingState ? const SizedBox(width: 32, child: LoadingApp()) : null,
                              onTap: () {
                                if (countryBloc.model?.provincesId != null) {
                                  cityBloc.add(CitiesEvent(countryId: countryBloc.model!.provincesId!));
                                }
                              }),
                        StatefulBuilder(
                            builder: (context, setState) => Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    InkWell(
                                      splashColor: Colors.transparent,
                                      hoverColor: Colors.transparent,
                                      highlightColor: Colors.transparent,
                                      onTap: () {
                                        registerBloc.isMale = true;
                                        setState(() {});
                                      },
                                      child: Row(
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          Icon(registerBloc.isMale ? Icons.radio_button_checked_sharp : Icons.radio_button_off,
                                              color: registerBloc.isMale ? context.primaryColor : context.borderColor, size: 32.r),
                                          const Text("Male"),
                                        ],
                                      ),
                                    ),
                                    InkWell(
                                      splashColor: Colors.transparent,
                                      hoverColor: Colors.transparent,
                                      highlightColor: Colors.transparent,
                                      onTap: () {
                                        registerBloc.isMale = false;
                                        setState(() {});
                                      },
                                      child: Row(
                                        mainAxisSize: MainAxisSize.min,
                                        mainAxisAlignment: MainAxisAlignment.end,
                                        children: [
                                          Icon(!registerBloc.isMale ? Icons.radio_button_checked_sharp : Icons.radio_button_off,
                                              color: !registerBloc.isMale ? context.primaryColor : context.borderColor, size: 32.r),
                                          const Text("Female"),
                                        ],
                                      ),
                                    ),
                                  ],
                                )).withPadding(bottom: 20.h),
                        AppField(
                          title: LocaleKeys.dateOfBirth.tr(),
                          onTap: () {
                            showDialog(
                                context: context,
                                builder: (context) => Dialog(
                                      child: CustomDatePicker(
                                        title: LocaleKeys.dateOfBirth.tr(),
                                        initialDate: DateTime.now().subtract(const Duration(days: 30000)),
                                      ),
                                    )).then(
                              (value) {
                                if (value != null) {
                                  registerBloc.birthday.text = t.DateFormat('yyyy-MM-dd', context.locale.toString()).format(value);

                                  registerBloc.add(UpdateViewEvent());
                                }
                              },
                            );
                          },
                          controller: registerBloc.birthday,
                        ),
                        AppField(
                          title: LocaleKeys.nationalId.tr(),
                          controller: registerBloc.identityNumController,
                        ),
                        AppField(
                            title: LocaleKeys.password.tr(),
                            hintText: "***********",
                            controller: registerBloc.passwordController,
                            keyboardType: TextInputType.visiblePassword),
                        AppBtn(
                            title: LocaleKeys.register_button.tr(),
                            loading: registerState is RegisterLoadingState,
                            onPressed: () {
                              registerBloc.add(RegisterEvent());
                            }),
                        Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(LocaleKeys.already_have_account.tr(), style: context.mediumText.copyWith(fontSize: 14.sp))
                                .withPadding(end: 4.w),
                            GestureDetector(
                              onTap: () {
                                replacement(NamedRoutes.login);
                              },
                              child: Text(LocaleKeys.sign_in_button.tr(),
                                  style: context.boldText.copyWith(fontSize: 16.sp, color: context.primaryColor)),
                            ),
                          ],
                        ).center.withPadding(vertical: 24.h)
                      ],
                    ));
              },
            );
          },
        );
      },
    );
  }
}

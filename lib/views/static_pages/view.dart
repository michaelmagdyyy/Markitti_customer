import 'package:e_commerce/blocs/PartnerProgrambloc/partner_program_bloc.dart';
import 'package:e_commerce/blocs/terms_bloc/terms_bloc.dart';
import 'package:e_commerce/core/utils/extensions.dart';
import 'package:e_commerce/core/widgets/app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../core/services/service_locator.dart';

class StaticPagesView extends StatefulWidget {
  const StaticPagesView({super.key, required this.title,required this.isTerms});
  final String title;
  final bool isTerms;

  @override
  State<StaticPagesView> createState() => _StaticPagesViewState();
}

class _StaticPagesViewState extends State<StaticPagesView> {
  late final bloc = sl<TermsBloc>();
  late final blocPartnerProgram = sl<PartnerProgramBloc>();
  @override
  void initState() {
    super.initState();
    bloc.add(GetTermsEvent());
    blocPartnerProgram.add(GetPartnerProgramEvent());
  }
  String data="";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: widget.title,
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 24.h),
        child:widget.isTerms==true?BlocConsumer<TermsBloc, TermsState>(
          bloc: bloc,
  listener: (context, state) {
    if (state is TermsLoaded) {
      data = state.model.termsAndCondistions?? "";
      setState(() {});
    }
  },
  builder: (context, state) {
    return Text(
          "${data??""}",style: context.regularText.copyWith(fontSize: 14.sp, color: context.primaryColorDark.withOpacity(.5)),
        );
  },
):BlocConsumer<PartnerProgramBloc, PartnerProgramState>(
          bloc: blocPartnerProgram,
  listener: (context, state) {
    if (state is PartnerProgramLoaded) {
      data = state.model.data?.partnerProgram?? "";
      setState(() {});
    }
  },
  builder: (context, state) {
    return Text(
          "${data??""}",style: context.regularText.copyWith(fontSize: 14.sp, color: context.primaryColorDark.withOpacity(.5)),
        );
  },
),
      ),
    );
  }
}

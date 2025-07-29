import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/services/server_gate.dart';
import '../../../core/services/cache_helper.dart';
import '../../../gen/assets.gen.dart';
import '../../../gen/locale_keys.g.dart';
import '../../../models/brand_details.dart';
import '../../../models/general.dart';
import 'event.dart';
import 'state.dart';

class BrandDetailsBloc extends Bloc<BrandDetailsEvent, BrandDetailsState> {
  BrandDetailsBloc() : super(InitialBrandDetailsState()) {
    on<StartBrandDetailsEvent>(_fun);
  }

  BrandDetailsModel? model;

  int currentIndex = 0;
  List<GeneralModel> list = [
    GeneralModel(key: "0", name: LocaleKeys.description.tr(), image: Assets.svg.desc),
    GeneralModel(key: "1", name: LocaleKeys.branches.tr(), image: Assets.svg.branch),
    GeneralModel(key: "2", name: LocaleKeys.video.tr(), image: Assets.svg.youtube),
    GeneralModel(key: "3", name: "Review", image: Assets.svg.desc),
  ];

  Future<void> _fun(StartBrandDetailsEvent event, Emitter<BrandDetailsState> emit) async {
    emit(LoadingBrandDetailsState());

    final response = await ServerGate.i.sendToServer(
      url: 'Brands/one_brand',
      body: {
        "card_no": CacheHelper.getValue(AppCached.cardNum) ?? "",
        "device_token": "a2426c2ed5cc2f569664e4abad17e960",
        "brand_id": event.id,
        "csrf_token_name": CacheHelper.getValue(AppCached.tokenName),
        "csrf_token_value": CacheHelper.getValue(AppCached.token),
      },
    );
    if (response.success) {
      model = BrandDetailsModel.fromJson(response.data['data']);
      emit(DoneBrandDetailsState(response.msg));
    } else {
      emit(FailedBrandDetailsState(response.msg));
    }
  }
}

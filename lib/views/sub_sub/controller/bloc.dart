import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/services/server_gate.dart';
import '../../../core/services/cache_helper.dart';
import '../../../core/services/my_functions.dart';
import '../../../models/sub_category_brand.dart';
import '../../../models/sub_sub_model.dart';
import 'event.dart';
import 'state.dart';

class SubSubCategoriesBloc extends Bloc<SubSubCategoriesEvent, SubSubCategoriesState> {
  SubSubCategoriesBloc() : super(SubSubCategoriesState()) {
    on<StartSubSubCategoriesEvent>(_subSubCategory);
    on<StartSubSubCategoriesBrandEvent>(_subSubBrand);
  }

  List<SubSubCategoryModel> subSubCategoryList = [];

  Future<void> _subSubCategory(StartSubSubCategoriesEvent event, Emitter<SubSubCategoriesState> emit) async {
    emit(LoadingSubSubCategoriesState());

    final response = await ServerGate.i.sendToServer(
      url: 'Categories/sub_sub_categories',
      body: {
        "card_no": CacheHelper.getValue(AppCached.cardNum) ?? "",
        "device_token" : "${await MyFunctions.getToken()}",
        "sub_cat_id": event.id,
        "csrf_token_name": CacheHelper.getValue(AppCached.tokenName),
        "csrf_token_value": CacheHelper.getValue(AppCached.token),
      },
    );
    if (response.success) {
      subSubCategoryList = List.from(response.data['data']['sub_sub_categories']).map((e) => SubSubCategoryModel.fromJson(e)).toList();
      add(StartSubSubCategoriesBrandEvent(id: subSubCategoryList.firstOrNull?.subCategoryId ?? ""));
      emit(DoneSubSubCategoriesState(response.msg));
    } else {
      emit(FailedSubSubCategoriesState(response.msg));
    }
  }

  List<SubBrandModel> subSubBrandList = [];

  Future<void> _subSubBrand(StartSubSubCategoriesBrandEvent event, Emitter<SubSubCategoriesState> emit) async {
    emit(LoadingSubSubCategoriesBrandState());

    final response = await ServerGate.i.sendToServer(
      url: 'Brands/sub_sub_categories_brands',
      body: {
        "sub_sub_cat_id": event.id,
        "card_no": CacheHelper.getValue(AppCached.cardNum) ?? "",
        "device_token" : "${await MyFunctions.getToken()}",
        "csrf_token_name": CacheHelper.getValue(AppCached.tokenName),
        "csrf_token_value": CacheHelper.getValue(AppCached.token),
      },
    );
    if (response.success) {
      subSubBrandList = List.from(response.data['sub_sub_category_brands']).map((e) => SubBrandModel.fromJson(e)).toList();
      emit(DoneSubSubCategoriesBrandState(response.msg));
    } else {
      emit(FailedSubSubCategoriesBrandState(response.msg));
    }
  }
}

import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/services/server_gate.dart';
import '../../../core/services/cache_helper.dart';
import '../../../core/services/my_functions.dart';
import '../../../models/sub_category.dart';
import '../../../models/sub_category_brand.dart';
import 'event.dart';
import 'state.dart';

class SubCategoriesBloc extends Bloc<SubCategoriesEvent, SubCategoriesState> {
  SubCategoriesBloc() : super(SubCategoriesState()) {
    on<StartSubCategoriesEvent>(_subCategory);
    on<StartSubCategoriesBrandEvent>(_subBrand);
  }

  List<SubCategoryModel> subCategoryList = [];

  Future<void> _subCategory(StartSubCategoriesEvent event, Emitter<SubCategoriesState> emit) async {
    emit(LoadingSubCategoriesState());

    final response = await ServerGate.i.sendToServer(
      url: 'Categories/sub_categories',
      body: {
        "card_no": CacheHelper.getValue(AppCached.cardNum) ?? "",
        "device_token" : "${await MyFunctions.getToken()}",
        "main_cat_id": event.id,
        "csrf_token_name": CacheHelper.getValue(AppCached.tokenName),
        "csrf_token_value": CacheHelper.getValue(AppCached.token),
      },
    );
    if (response.success) {
      subCategoryList = List.from(response.data['data']).map((e) => SubCategoryModel.fromJson(e)).toList();
      if (subCategoryList.firstOrNull != null) {
        add(StartSubCategoriesBrandEvent(id: subCategoryList.lastOrNull?.subCategoryId ?? ""));
      }
      emit(DoneSubCategoriesState(response.msg));
    } else {
      emit(FailedSubCategoriesState(response.msg));
    }
  }

  List<SubBrandModel> subBrandList = [];

  Future<void> _subBrand(StartSubCategoriesBrandEvent event, Emitter<SubCategoriesState> emit) async {
    emit(LoadingSubCategoriesBrandState());

    final response = await ServerGate.i.sendToServer(
      url: 'Brands/sub_categories_brands',
      body: {
        "card_no": CacheHelper.getValue(AppCached.cardNum) ?? "",
        "device_token" : "${await MyFunctions.getToken()}",
        "sub_cat_id": event.id,
        "csrf_token_name": CacheHelper.getValue(AppCached.tokenName),
        "csrf_token_value": CacheHelper.getValue(AppCached.token),
      },
    );
    if (response.success) {
      subBrandList = List.from(response.data['data']['sub_category_brands']).map((e) => SubBrandModel.fromJson(e)).toList();
      emit(DoneSubCategoriesBrandState(response.msg));
    } else {
      emit(FailedSubCategoriesBrandState(response.msg));
    }
  }
}

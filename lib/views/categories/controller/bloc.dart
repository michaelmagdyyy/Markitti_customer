import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/services/server_gate.dart';
import '../../../core/services/cache_helper.dart';
import '../../../core/services/my_functions.dart';
import '../../../models/category.dart';
import 'event.dart';
import 'state.dart';

class CategoriesBloc extends Bloc<CategoriesEvent, CategoriesState> {
  CategoriesBloc() : super(CategoriesState()) {
    on<StartCategoriesEvent>(_fun);
  }

  List<CategoryModel> list = [];

  Future<void> _fun(StartCategoriesEvent event, Emitter<CategoriesState> emit) async {
    emit(LoadingCategoriesState());

    final response = await ServerGate.i.sendToServer(
      url: 'Categories/main_categories',
      body: {
        "card_no":CacheHelper.getValue(AppCached.cardNum)??"",
        "device_token" : "${await MyFunctions.getToken()}",
      },
    );
    if (response.success) {
      list = List.from(response.data['data']).map((e) => CategoryModel.fromJson(e)).toList();
      emit(DoneCategoriesState(response.msg));
    } else {
      emit(FailedCategoriesState(response.msg));
    }
  }
}

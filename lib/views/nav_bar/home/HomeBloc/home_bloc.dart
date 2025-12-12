import 'package:bloc/bloc.dart';
import 'package:e_commerce/models/SliderModel.dart';
import 'package:meta/meta.dart';

import '../../../../core/services/cache_helper.dart';
import '../../../../core/services/my_functions.dart';
import '../../../../core/services/server_gate.dart';
import '../../../../models/SavingsCurrentMonthModel.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(HomeInitial()) {
    on<GetSavingsCurrentMonthEvent>(_getSavingsCurrentMonth);
    on<GetSliderEvent>(_getSlider);
  }
  SavingsCurrentMonthModel? savingsCurrentMonthModel;
  SliderModel? sliderModel;
  void _getSavingsCurrentMonth(GetSavingsCurrentMonthEvent event, Emitter<HomeState> emit) async {
    emit(HomeLoading());
    final response = await ServerGate.i.sendToServer( url: "Home/savings_current_month",
        body: {
          "card_no": CacheHelper.getValue(AppCached.cardNum) ?? "",
          "device_token" : "${await MyFunctions.getToken()}",
        });
    if (response.success) {
      SavingsCurrentMonthModel model = SavingsCurrentMonthModel.fromJson(response.data);
      savingsCurrentMonthModel=model;
      emit(HomeLoaded());
    } else {
      emit(HomeError(msg: response.msg));
    }
  }
  void _getSlider(GetSliderEvent event, Emitter<HomeState> emit) async {
    emit(HomeLoading());
    final response = await ServerGate.i.sendToServer( url: "Slider",
        body: {
          "card_no": CacheHelper.getValue(AppCached.cardNum) ?? "",
          "device_token" : "${await MyFunctions.getToken()}",
        });
    if (response.success) {
      SliderModel model = SliderModel.fromJson(response.data);
      sliderModel=model;
      emit(HomeLoaded());
    } else {
      emit(HomeError(msg: response.msg));
    }
  }

}

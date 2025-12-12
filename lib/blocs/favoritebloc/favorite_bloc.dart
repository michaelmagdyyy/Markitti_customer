import 'package:bloc/bloc.dart';
import 'package:e_commerce/core/services/my_functions.dart';
import 'package:meta/meta.dart';

import '../../core/services/cache_helper.dart';
import '../../core/services/server_gate.dart';
import '../../core/widgets/flash_helper.dart';
import '../../models/FavoriteModel.dart';

part 'favorite_event.dart';
part 'favorite_state.dart';

class FavoriteBloc extends Bloc<FavoriteEvent, FavoriteState> {
  FavoriteBloc() : super(FavoriteInitial()) {
    on<GetFavoriteEvent>(_sendData);
    on<AddToFavoriteEvent>(_addData);
    on<RemoveFromFavoriteEvent>(_removeData);
  }
  void _sendData(GetFavoriteEvent event, Emitter<FavoriteState> emit) async {
    emit(FavoriteLoading());
    final response = await ServerGate.i.sendToServer( url: "Cards/get_favorite_brands",
        body: {
          "card_no": CacheHelper.getValue(AppCached.cardNum) ?? "",
          "device_token" : "${await MyFunctions.getToken()}"
        });
    if (response.success) {
      FavoriteModel model = FavoriteModel.fromJson(response.data);
      emit(FavoriteLoaded(model: model));
    } else {
      emit(FavoriteError(msg: response.msg));
    }
  }
  void _addData(AddToFavoriteEvent event, Emitter<FavoriteState> emit) async {
    emit(FavoriteLoading());
    final response = await ServerGate.i.sendToServer( url: "Cards/add_to_favorite",
        body: {
          "card_no": CacheHelper.getValue(AppCached.cardNum) ?? "",
          "device_token" : "${await MyFunctions.getToken()}",
          "brand_id" : event.brandId
        });
    if (response.success) {
      FavoriteModel model = FavoriteModel.fromJson(response.data);
      emit(FavoriteLoaded(model: model));
    } else {
      emit(FavoriteError(msg: response.msg));
    }
    _sendData;
  }
  void _removeData(RemoveFromFavoriteEvent event, Emitter<FavoriteState> emit) async {
    emit(FavoriteLoading());
    final response = await ServerGate.i.sendToServer( url: "Cards/remove_from_favorite",
        body: {
          "card_no": CacheHelper.getValue(AppCached.cardNum) ?? "",
          "device_token" : "${await MyFunctions.getToken()}",
          "brand_id" : event.brandId
        });
    if (response.success) {
      FavoriteModel model = FavoriteModel.fromJson(response.data);
      emit(FavoriteLoaded(model: model));
    } else {
      emit(FavoriteError(msg: response.msg));
    }
    _sendData;
  }
}

import 'package:flutter_bloc/flutter_bloc.dart';

import '../../core/services/server_gate.dart';
import '../../models/city_model.dart';
import 'event.dart';
import 'state.dart';

class CitiesBloc extends Bloc<CitiesEvents, CitiesStates> {
  CitiesBloc() : super(CitiesInitial()) {
    on<CitiesEvent>(_sendData);
    on<SelectCityEvent>(_selectCity);
  }

  List<CityModel> list = [];
  CityModel? model;

  void _sendData(
    CitiesEvent event,
    Emitter<CitiesStates> emit,
  ) async {
    list = [];
    model = null;
    emit(CitiesLoadingState());

    final response = await ServerGate.i.getFromServer(url: "Authentication/areas/${event.countryId}");
    if (response.statusCode==200) {
      list = List.from(response.data['data']['areas']).map((e) => CityModel.fromJson(e)).toList();
      emit(CitiesSuccessState());
    } else {
      emit(CitiesFailedState(msg: response.msg));
    }
  }

  _selectCity(SelectCityEvent event, Emitter<CitiesStates> emit) {
    if (event.model != null) {
      model = event.model!;
    }
    emit(SelectCityState());
  }
}

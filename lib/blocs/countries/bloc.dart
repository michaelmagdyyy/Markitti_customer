import 'package:flutter_bloc/flutter_bloc.dart';

import '../../core/services/server_gate.dart';
import '../../models/country.dart';
import 'events.dart';
import 'states.dart';

class CountriesBloc extends Bloc<CountriesEvent, CountryStates> {
  CountriesBloc() : super(CountryInitailState()) {
    on<StartCountriesEvent>(_fun);
    on<SelectCountryEvent>(_selectCity);
  }

  List<CountryModel> countries = [];
  CountryModel? model;

  Future<void> _fun(StartCountriesEvent event, Emitter<CountryStates> emit) async {
    countries.clear();
    model = null;
    emit(CountryLoadingState());
    final result = await ServerGate.i.getFromServer(url: 'Authentication/provinces');
    if (result.statusCode==200) {
      countries = List<CountryModel>.from((result.data['data']['provinces'] ?? []).map((e) => CountryModel.fromJson(e)));
      emit(CountrySuccessState());
    } else {
      emit(CountryFailedState());
    }
  }

  _selectCity(SelectCountryEvent event, Emitter<CountryStates> emit) {
    if (event.model != null) {
      model = event.model!;
    }
    emit(CountrySelectedState());
  }
}

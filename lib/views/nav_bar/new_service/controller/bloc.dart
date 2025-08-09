import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/services/server_gate.dart';
import '../../../../models/service_model.dart';
import 'event.dart';
import 'state.dart';

class NewServicesBloc extends Bloc<NewServicesEvent, NewServicesState> {
  NewServicesBloc() : super(NewServicesState()) {
    on<StartNewServicesEvent>(_fun);
  }

  List<ServiceModel> list = [];

  Future<void> _fun(StartNewServicesEvent event, Emitter<NewServicesState> emit) async {
    emit(LoadingNewServicesState());

    final response = await ServerGate.i.sendToServer(
      url: 'Brands/newest_brands',
      body: {
        "card_no": "02100750031008612",
        "device_token": "adc0ca7800275c1b07816f1c1ef70256b5ec95d2",
      },
    );
    if (response.success) {
      list = List.from(response.data['brands']).map((e) => ServiceModel.fromJson(e)).toList();

      emit(DoneNewServicesState(response.msg));
    } else {
      emit(FailedNewServicesState(response.msg));
    }
  }
}

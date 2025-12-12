import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/services/cache_helper.dart';
import '../../../../core/services/my_functions.dart';
import '../../../../core/services/server_gate.dart';
import '../../../../models/service_model.dart';
import 'event.dart';
import 'state.dart';

class NewServicesBloc extends Bloc<NewServicesEvent, NewServicesState> {
  NewServicesBloc() : super(NewServicesState()) {
    on<StartNewServicesEvent>(_fun);
  }

  List<ServiceData> list = [];

  Future<void> _fun(StartNewServicesEvent event, Emitter<NewServicesState> emit) async {
    emit(LoadingNewServicesState());

    final response = await ServerGate.i.sendToServer(
      url: 'Brands/newest_brands',
      body: {
        "card_no": CacheHelper.getValue(AppCached.cardNum) ?? "",
        "device_token" : "${await MyFunctions.getToken()}",
      },
    );
    if (response.success) {
      ServiceModel model = ServiceModel.fromJson(response.data);
      list = model.data??[];
      emit(DoneNewServicesState(response.msg));
    } else {
      emit(FailedNewServicesState(response.msg));
    }
  }
}

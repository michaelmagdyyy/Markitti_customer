import 'package:bloc/bloc.dart';
import 'package:e_commerce/models/TermsAndConditionsModel.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:meta/meta.dart';

import '../../core/services/my_functions.dart';
import '../../core/services/server_gate.dart';

part 'terms_event.dart';
part 'terms_state.dart';

class TermsBloc extends Bloc<TermsEvent, TermsState> {
  TermsBloc() : super(TermsInitial()) {
    on<GetTermsEvent>(_sendData);
  }
  void _sendData(GetTermsEvent event, Emitter<TermsState> emit) async {
    emit(TermsLoading());

    final response = await ServerGate.i.sendToServer( url: "Terms_and_conditions",
        body: {
          "device_token" : "${await MyFunctions.getToken()}",
    });
    if (response.success) {
      TermsAndConditionsModel model = TermsAndConditionsModel.fromJson(response.data);
      emit(TermsLoaded(model: model));
    } else {
      emit(TermsError(msg: response.msg));
    }
  }
}

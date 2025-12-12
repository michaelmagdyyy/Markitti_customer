import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../core/widgets/flash_helper.dart';

import '../../core/services/server_gate.dart';
import '../../models/user.dart';

part 'change_lang_event.dart';

part 'change_lang_state.dart';

class ChangeLangBloc extends Bloc<ChangeLangEvents, ChangeLangStates> {
  ChangeLangBloc() : super(ChangeLangStates()) {
    on<ChangeLangEvent>(_changeLang);
  }

  // _changeLang(ChangeLangEvent event, Emitter<ChangeLangStates> emit) async {
  //   emit(ChangeLangLoadingState());
  //   final response = await ServerGate.i.sendToServer(
  //       url: 'api/client_web/change_language', body: {"locale": event.lang});
  //   if (response.success) {
  //     // UserModel.i.locale = event.lang;
  //     UserModel.i.save();
  //     emit(ChangeLangSuccessState());
  //   } else {
  //     emit(ChangeLangFailedState(msg: response.msg));
  //   }
  // }
  _changeLang(ChangeLangEvent event, Emitter<ChangeLangStates> emit) async {
    emit(ChangeLangLoadingState());

    final response = await ServerGate.i.sendToServer(
      url: 'api/client_web/change_language',
      body: {"locale": event.lang},
    );

    if (response.success) {
      // Save to local model
      UserModel.i.locale = event.lang;
      UserModel.i.save();
      emit(ChangeLangSuccessState());
    } else {
      emit(ChangeLangFailedState(msg: response.msg));
    }
  }
}

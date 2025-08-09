import 'dart:io';

import 'package:e_commerce/core/services/cache_helper.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../core/routes/app_routes_fun.dart';
import '../../core/routes/routes.dart';
import '../../core/services/server_gate.dart';
import '../../core/widgets/flash_helper.dart';

part 'logout_event.dart';

part 'logout_state.dart';

class LogoutBloc extends Bloc<LogoutEvents, LogoutStates> {
  LogoutBloc() : super(LogoutStates()) {
    on<LogoutEvent>(_logout);
  }

  Future<void> _logout(LogoutEvent event, Emitter<LogoutStates> emit) async {
    emit(LogoutLoadingState());
    final response =
        await ServerGate.i.sendToServer(url: "client/logout", body: {
      "type": Platform.operatingSystem == "ios" ? "IOS" : "Android",
      "device_token": "123",
    });
    if (response.success) {
      CacheHelper.clear();
      pushAndRemoveUntil(NamedRoutes.login);
      emit(LogoutSuccessState(msg: response.msg));
    } else {
      emit(LogoutFailedState(msg: response.msg));
    }
  }
}

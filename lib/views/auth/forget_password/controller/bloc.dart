import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/services/server_gate.dart';
import 'event.dart';
import 'state.dart';

class ForgetPasswordBloc extends Bloc<ForgetPasswordEvent, ForgetPasswordState> {
  ForgetPasswordBloc() : super(ForgetPasswordState()) {
    on<ForgetPasswordEvent>(_sendData);
  }

  final formKey = GlobalKey<FormState>();
  var autoValidateMode = AutovalidateMode.disabled;
  final phoneController = TextEditingController();

  Future<void> _sendData(ForgetPasswordEvent event, Emitter<ForgetPasswordState> emit) async {
    emit(LoadingForgetPasswordState());
    final result = await ServerGate.i
        .sendToServer(url: 'client/forget', body: {"phone_code": event.phoneCode, "phone": phoneController.text});

    if (result.success) {
      emit(DoneForgetPasswordState(msg: result.msg));
    } else {
      emit(FailedForgetPasswordState(msg: result.msg));
    }
  }
}

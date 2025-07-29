import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/services/server_gate.dart';
import '../../../../../core/widgets/flash_helper.dart';

part 'change_pass_event.dart';
part 'change_pass_state.dart';

class ChangePasswordBloc extends Bloc<ChangePasswordEvents, ChangePasswordStates> {
  final formKey = GlobalKey<FormState>();
  var autoValidateMode = AutovalidateMode.disabled;
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();

  ChangePasswordBloc() : super(ChangePasswordStates()) {
    on<ChangePasswordEvent>(_sendData);
  }

  void _sendData(
    ChangePasswordEvent event,
    Emitter<ChangePasswordStates> emit,
  ) async {
    emit(ChangePasswordLoadingState());

    final response = await ServerGate.i.sendToServer(
      url: "client/reset-password",
      body: {
        "phone_code": event.phoneCode,
        "phone": event.phone,
        "code": event.code,
        "password": passwordController.text,
        "password_confirmation":confirmPasswordController.text
      },
    );

    if (response.success) {
      // push(pushAndRemoveUntil(const LoginScreen()));
      emit(ChangePasswordSuccessState(msg: response.msg));
    } else {
      emit(ChangePasswordFailedState(msg: response.msg));
    }
  }
}

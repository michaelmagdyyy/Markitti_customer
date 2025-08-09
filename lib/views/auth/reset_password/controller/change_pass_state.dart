part of 'change_pass_bloc.dart';

class ChangePasswordStates {}

class ChangePasswordLoadingState extends ChangePasswordStates {}

class ChangePasswordSuccessState extends ChangePasswordStates {
  final String msg;

  ChangePasswordSuccessState({required this.msg}) {
    FlashHelper.showToast(msg, type: MessageType.success);
  }
}

class ChangePasswordFailedState extends ChangePasswordStates {
  final String msg;

  ChangePasswordFailedState({required this.msg}) {
    FlashHelper.showToast(msg);
  }
}

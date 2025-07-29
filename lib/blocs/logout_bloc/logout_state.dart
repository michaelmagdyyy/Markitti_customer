part of 'logout_bloc.dart';

class LogoutStates {}

class LogoutLoadingState extends LogoutStates {}

class LogoutSuccessState extends LogoutStates {
  final String msg;

  LogoutSuccessState({required this.msg}) {
    FlashHelper.showToast(msg, type: MessageType.success);
  }
}

class LogoutFailedState extends LogoutStates {
  final String msg;

  LogoutFailedState({required this.msg}) {
    FlashHelper.showToast(msg);
  }
}

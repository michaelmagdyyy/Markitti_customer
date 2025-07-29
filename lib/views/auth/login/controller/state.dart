import '../../../../core/widgets/flash_helper.dart';

class LoginState {}

class DoneLoginState extends LoginState {
  final String msg;

  DoneLoginState(this.msg) {
    FlashHelper.showToast(msg, type: MessageType.success);
  }
}

class LoadingLoginState extends LoginState {}

class FailedLoginState extends LoginState {
  final String msg;

  FailedLoginState(this.msg) {
    FlashHelper.showToast(msg);
  }
}

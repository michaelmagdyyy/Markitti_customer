
import '../../../../core/widgets/flash_helper.dart';

class ForgetPasswordState {}

class DoneForgetPasswordState extends ForgetPasswordState {
  final String msg;

  DoneForgetPasswordState({required this.msg}) {
    FlashHelper.showToast(msg, type: MessageType.success);
  }
}

class LoadingForgetPasswordState extends ForgetPasswordState {}

class FailedForgetPasswordState extends ForgetPasswordState {
  final String msg;

  FailedForgetPasswordState({required this.msg}) {
    FlashHelper.showToast(msg);
  }
}

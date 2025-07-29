import '../../../../core/widgets/flash_helper.dart';

class NewServicesState {}

class DoneNewServicesState extends NewServicesState {
  final String msg;

  DoneNewServicesState(this.msg) {
    FlashHelper.showToast(msg, type: MessageType.success);
  }
}

class LoadingNewServicesState extends NewServicesState {}

class FailedNewServicesState extends NewServicesState {
  final String msg;

  FailedNewServicesState(this.msg) {
    FlashHelper.showToast(msg);
  }
}

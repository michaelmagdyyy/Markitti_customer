import '../../../../core/widgets/flash_helper.dart';

class CodeState {}

class DoneCodeState extends CodeState {
  final String msg;

  DoneCodeState(this.msg) {
    FlashHelper.showToast(msg, type: MessageType.success);
  }
}

class LoadingCodeState extends CodeState {}

class FailedCodeState extends CodeState {
  final String msg;

  FailedCodeState(this.msg) {
    FlashHelper.showToast(msg);
  }
}

class DoneSocketQrState extends CodeState {
  final String msg;

  DoneSocketQrState(this.msg) {
    FlashHelper.showToast(msg, type: MessageType.success);
  }
}

class LoadingSocketQrState extends CodeState {}

class FailedSocketQrState extends CodeState {
  final String msg;

  FailedSocketQrState(this.msg) {
    FlashHelper.showToast(msg);
  }
}

/////////
class DoneAcceptOrCancelState extends CodeState {
  final String msg;

  DoneAcceptOrCancelState(this.msg) {
    FlashHelper.showToast(msg, type: MessageType.success);
  }
}

class LoadingAcceptOrCancelState extends CodeState {}

class FailedAcceptOrCancelState extends CodeState {
  final String msg;

  FailedAcceptOrCancelState(this.msg) {
    FlashHelper.showToast(msg);
  }
}

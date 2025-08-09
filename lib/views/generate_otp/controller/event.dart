class CodeEvent {}

class GetCodeEvent extends CodeEvent {
  final String id;

  GetCodeEvent({required this.id});
}

class SocketQrEvent extends CodeEvent {
  final String qrCode;

  SocketQrEvent({required this.qrCode});
}

class AcceptOrCancelEvent extends CodeEvent {
  final String qrCode, type;

  AcceptOrCancelEvent({required this.qrCode, required this.type});
}

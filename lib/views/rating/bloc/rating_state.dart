part of 'rating_bloc.dart';

@immutable
class RatingState {}

final class RatingInitial extends RatingState {}
class LoadingCodeState extends RatingState {}
class DoneCodeState extends RatingState {
  final String msg;

  DoneCodeState(this.msg) {
    FlashHelper.showToast(msg, type: MessageType.success);
  }
}
class FailedCodeState extends RatingState {
  final String msg;

  FailedCodeState(this.msg) {
    FlashHelper.showToast(msg);
  }
}

part of 'usage_history_bloc.dart';

@immutable
sealed class UsageHistoryState {}

final class UsageHistoryInitial extends UsageHistoryState {}
final class UsageHistoryLoading extends UsageHistoryState {}
final class UsageHistoryLoaded extends UsageHistoryState {
  final UsageHistoryModel model;
  UsageHistoryLoaded({required this.model}){
    FlashHelper.showToast(model.message.toString(), type: MessageType.success);
  }
}
final class UsageHistoryError extends UsageHistoryState {
  final String msg;
  UsageHistoryError({required this.msg}){
    FlashHelper.showToast(msg, type: MessageType.success);
  }
}

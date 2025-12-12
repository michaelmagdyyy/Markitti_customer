part of 'favorite_bloc.dart';

@immutable
sealed class FavoriteState {}

final class FavoriteInitial extends FavoriteState {}
final class FavoriteLoading extends FavoriteState {}
final class FavoriteLoaded extends FavoriteState {
  final FavoriteModel model;
  FavoriteLoaded({required this.model}){
    FlashHelper.showToast(model.message.toString(), type: MessageType.success);
  }
}
final class FavoriteError extends FavoriteState {
  final String msg;
  FavoriteError({required this.msg}){
    FlashHelper.showToast(msg, type: MessageType.success);
  }
}

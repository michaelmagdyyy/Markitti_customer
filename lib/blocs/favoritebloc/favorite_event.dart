part of 'favorite_bloc.dart';

class FavoriteEvent {}
class GetFavoriteEvent  extends FavoriteEvent{}
class AddToFavoriteEvent  extends FavoriteEvent{
  final String brandId;
  AddToFavoriteEvent({required this.brandId});
}
class RemoveFromFavoriteEvent  extends FavoriteEvent{
  final String brandId;
  RemoveFromFavoriteEvent({required this.brandId});
}

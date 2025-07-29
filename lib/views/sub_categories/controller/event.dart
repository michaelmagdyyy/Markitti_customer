class SubCategoriesEvent {}

class StartSubCategoriesEvent extends SubCategoriesEvent {
  final String id;

  StartSubCategoriesEvent({required this.id});
}
class StartSubCategoriesBrandEvent extends SubCategoriesEvent {
  final String id;

  StartSubCategoriesBrandEvent({required this.id});
}

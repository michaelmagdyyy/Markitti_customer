class SubSubCategoriesEvent {}

class StartSubSubCategoriesEvent extends SubSubCategoriesEvent {
  final String id;

  StartSubSubCategoriesEvent({required this.id});
}
class StartSubSubCategoriesBrandEvent extends SubSubCategoriesEvent {
  final String id;

  StartSubSubCategoriesBrandEvent({required this.id});
}

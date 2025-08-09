class SubCategoryModel {
  late final String? subCategoryId;
  late final String? categoryId;
  late final String? subCategoryName;
  late final String? subCategoryPhoto;
  late final String? visible;
  late final bool? hasSubSub;

  SubCategoryModel.fromJson(Map<String, dynamic> json) {
    subCategoryId = json['sub_category_id'];
    categoryId = json['main_category_id'];
    subCategoryName = json['sub_category_name'];
    subCategoryPhoto = json['sub_category_photo'];
    visible = json['visible'];
    hasSubSub = json['has_sub_sub_categories'];
  }
}

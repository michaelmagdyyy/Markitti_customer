class SubSubCategoryModel {


  late final String? subCategoryId;
  late final String? mainCategoryId;
  late final String? subSubCategoryName;
  late final String? categoryPhoto;
  late final String? visible;

  SubSubCategoryModel.fromJson(Map<String, dynamic> json) {
    subCategoryId = json['sub_category_id'];
    mainCategoryId = json['main_category_id'];
    subSubCategoryName = json['sub_sub_category_name'];
    categoryPhoto = json['category_photo'];
    visible = json['visible'];
  }
}

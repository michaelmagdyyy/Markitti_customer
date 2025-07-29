class CategoryModel {
  late final String? brandsCategoryId;
  late final String? categoryName;
  late final String? categoryPhoto;
  late final String? visible;

  CategoryModel.fromJson(Map<String, dynamic> json) {
    brandsCategoryId = json['category_id'];
    categoryName = json['category_name'];
    categoryPhoto = json['category_photo'];
    visible = json['visible'];
  }
}

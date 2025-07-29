class CountryModel {
  late final String? provincesId;
  late final String? provinceNameEn;
  late final String? provinceNameAr;
  late final String? createdAt;
  late final String? createdBy;
  late final String? updatedAt;
  late final String? updatedBy;

  CountryModel.fromJson(Map<String, dynamic> json) {
    provincesId = json['provinces_id'];
    provinceNameEn = json['province_name_en'];
    provinceNameAr = json['province_name_ar'];
    createdAt = json['created_at'];
    createdBy = json['created_by'];
    updatedAt = json['updated_at'];
    updatedBy = json['updated_by'];
  }
}

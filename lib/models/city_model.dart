class CityModel {
  late final String? areasId;
  late final String? provinceId;
  late final String? areaNameEn;
  late final String? areaNameAr;
  late final String? createdAt;
  late final String? createdBy;
  late final String? updatedAt;
  late final String? updatedBy;

  CityModel.fromJson(Map<String, dynamic> json) {
    areasId = json['areas_id'];
    provinceId = json['province_id'];
    areaNameEn = json['area_name_en'];
    areaNameAr = json['area_name_ar'];
    createdAt = json['created_at'];
    createdBy = json['created_by'];
    updatedAt = json['updated_at'];
    updatedBy = json['updated_by'];
  }
}

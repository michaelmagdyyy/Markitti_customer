class RatingFactorsModel {
  String? status;
  List<RatingFactorsData>? data;

  RatingFactorsModel({this.status, this.data});

  RatingFactorsModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    if (json['data'] != null) {
      data = <RatingFactorsData>[];
      json['data'].forEach((v) {
        data!.add(new RatingFactorsData.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class RatingFactorsData {
  String? ratingFactorsId;
  String? factorName;
  String? factorDescription;

  RatingFactorsData({this.ratingFactorsId, this.factorName, this.factorDescription});

  RatingFactorsData.fromJson(Map<String, dynamic> json) {
    ratingFactorsId = json['rating_factors_id'];
    factorName = json['factor_name'];
    factorDescription = json['factor_description'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['rating_factors_id'] = this.ratingFactorsId;
    data['factor_name'] = this.factorName;
    data['factor_description'] = this.factorDescription;
    return data;
  }
}
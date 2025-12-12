class FavoriteModel {
  String? status;
  List<FavoriteData>? data;
  String? message;

  FavoriteModel({this.status, this.data, this.message});

  FavoriteModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    if (json['data'] != null) {
      data = <FavoriteData>[];
      json['data'].forEach((v) {
        data!.add(new FavoriteData.fromJson(v));
      });
    }
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    data['message'] = this.message;
    return data;
  }
}

class FavoriteData {
  String? brandId;
  String? createdAt;
  String? brandName;
  String? brandLogo;
  String? bannerImage;

  FavoriteData({this.brandId, this.createdAt, this.brandName, this.brandLogo,this.bannerImage});

  FavoriteData.fromJson(Map<String, dynamic> json) {
    brandId = json['brand_id'];
    createdAt = json['created_at'];
    brandName = json['brand_name'];
    brandLogo = json['brand_logo'];
    bannerImage = json['brand_image'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['brand_id'] = this.brandId;
    data['created_at'] = this.createdAt;
    data['brand_name'] = this.brandName;
    data['brand_logo'] = this.brandLogo;
    data['brand_image'] = this.bannerImage;
    return data;
  }
}
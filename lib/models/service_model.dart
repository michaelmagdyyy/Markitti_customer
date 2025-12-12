class ServiceModel {
  String? status;
  String? message;
  List<ServiceData>? data;

  ServiceModel({this.status, this.message, this.data});

  ServiceModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    if (json['data'] != null) {
      data = <ServiceData>[];
      json['data'].forEach((v) {
        data!.add(new ServiceData.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['message'] = this.message;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class ServiceData {
  String? brandName;
  String? brandLogo;
  String? description;
  String? roles;
  String? facebookPage;
  String? youtubeChannelLink;
  String? instagramLink;
  String? bannerImage;
  String? customerBrandDiscountPercentage;

  ServiceData(
      {this.brandName,
        this.brandLogo,
        this.description,
        this.roles,
        this.facebookPage,
        this.youtubeChannelLink,
        this.instagramLink,
        this.bannerImage,
        this.customerBrandDiscountPercentage});

  ServiceData.fromJson(Map<String, dynamic> json) {
    brandName = json['brand_name'];
    brandLogo = json['brand_logo'];
    description = json['description'];
    roles = json['roles'];
    facebookPage = json['facebook_page'];
    youtubeChannelLink = json['youtube_channel_link'];
    instagramLink = json['instagram_link'];
    bannerImage = json['banner_image'];
    customerBrandDiscountPercentage =
    json['customer_brand_discount_percentage'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['brand_name'] = this.brandName;
    data['brand_logo'] = this.brandLogo;
    data['description'] = this.description;
    data['roles'] = this.roles;
    data['facebook_page'] = this.facebookPage;
    data['youtube_channel_link'] = this.youtubeChannelLink;
    data['instagram_link'] = this.instagramLink;
    data['banner_image'] = this.bannerImage;
    data['customer_brand_discount_percentage'] =
        this.customerBrandDiscountPercentage;
    return data;
  }
}
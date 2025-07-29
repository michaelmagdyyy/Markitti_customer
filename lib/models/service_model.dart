class ServiceModel {
  late final String? customerBrandDiscountPercentage;
  late final String? customerBrandPurchasesLimit;
  late final String? brandNameEn;
  late final String? brandNameAr;
  late final String? brandLogo;
  late final String? descriptionEn;
  late final String? descriptionAr;
  late final String? facebookPage;
  late final String? youtubeChannelLink;
  late final String? instagramLink;
  late final String? bannerImage;

  ServiceModel.fromJson(Map<String, dynamic> json) {
    customerBrandDiscountPercentage = json['customer_brand_discount_percentage'];
    customerBrandPurchasesLimit = json['customer_brand_purchases_limit'];
    brandNameEn = json['brand_name_en'];
    brandNameAr = json['brand_name_ar'];
    brandLogo = json['brand_logo'];
    descriptionEn = json['description_en'];
    descriptionAr = json['description_ar'];
    facebookPage = json['facebook_page'];
    youtubeChannelLink = json['youtube_channel_link'];
    instagramLink = json['instagram_link'];
    bannerImage = json['banner_image'];
  }
}

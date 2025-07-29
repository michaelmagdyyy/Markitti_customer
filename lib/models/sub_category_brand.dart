class SubBrandModel {
  late final String? brandId;
  late final String? brandName;
  late final String? brandLogo;
  late final String? bannerImage;
  late final String? customerBrandDiscountPercentage;
  late final String? customerBrandPurchasesLimit;



  SubBrandModel.fromJson(Map<String, dynamic> json) {
    brandId = json['brand_id'];
    brandName = json['brand_name'];
    brandLogo = json['brand_logo'];
    bannerImage = json['banner_image'];
    customerBrandDiscountPercentage = json['customer_brand_discount_percentage'];
    customerBrandPurchasesLimit = json['customer_brand_purchases_limit'];
  }
}
